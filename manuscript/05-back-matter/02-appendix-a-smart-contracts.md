# Appendix A: Smart Contract Code Samples {.unnumbered}

The listings below are illustrative, not production-grade: they omit access-control
hardening, gas optimization, upgrade proxies, and the full event vocabulary, in
order to keep the logic of Chapters 4, 5, and 9 legible on the page. They are
written in Solidity for concreteness; the pilot's production suite targets a
permissioned platform and enforces the identical schema (Section 11.2 explains why
the envelope, not the platform, is the specification). Line-by-line commentary
follows each listing. All code in this appendix is original to this book.

## A.1 Envelope and Registry Types {.unnumbered}

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// Event envelope, Section 5.4. Payloads never appear on-chain;
/// only digests and replicated-custody references do (Section 4.2).
struct EventEnvelope {
    uint16  schemaVersion;
    bytes32 assetDid;        // DID digest; resolution off-chain (Section 3.5)
    uint8   eventType;       // Table 5.1 vocabulary
    uint16  payloadVersion;
    bytes32 payloadDigest;   // over canonical CBOR serialization
    bytes32[] payloadRefs;   // content-reference digests (custody locators)
    uint64  claimedTime;     // submitter's asserted physical-world time
    bytes32[] priorRefs;     // evidence DAG edges (Section 5.4)
    bytes32 submitterRole;   // role DID (Section 10.2: no legal persons on-chain)
}

/// Lifecycle states, Figure 5.1.
enum AssetState {
    None, Registered, InTransit, Installed, Commissioned,
    Suspended, Removed, Decommissioned, Recycled
}

/// Registration class, Section 4.3: factory-grade provenance is
/// never conflated with retroactive enrollment.
enum RegClass { Factory, Retroactive }
```

## A.2 AssetRegistry {.unnumbered}

```solidity
contract AssetRegistry {
    struct Registration {
        RegClass  regClass;
        bytes32   templateDigest;    // enrollment fingerprint (Section 6.3)
        bytes32   batchRoot;         // Merkle batch membership (Section 7.2)
        bytes32   registrarRole;
        uint64    ledgerTime;
        bool      exists;
    }

    mapping(bytes32 => Registration) private assets;      // assetDid => reg
    mapping(bytes32 => bool)          private batchRoots; // committed roots

    IRoleAccred public immutable accred;   // Section A.4

    event BatchCommitted(bytes32 indexed root, bytes32 indexed registrar,
                         bytes32 manifestDigest);
    event AssetRegistered(bytes32 indexed assetDid, RegClass regClass,
                          bytes32 indexed batchRoot);

    constructor(IRoleAccred _accred) { accred = _accred; }

    /// One consensus round commits a whole production batch (Figure 7.1).
    /// The manifest must already sit in replicated custody: the contract
    /// cannot check that, so the corroboration rules of Section 4.2 make
    /// custody-write-before-commit a registrar accreditation condition.
    function commitBatch(bytes32 root, bytes32 manifestDigest,
                         bytes32 registrarRole) external {
        require(accred.isAccredited(registrarRole, Role.Registrar,
                                    block.timestamp), "registrar");
        require(!batchRoots[root], "duplicate batch");
        batchRoots[root] = true;
        emit BatchCommitted(root, registrarRole, manifestDigest);
    }

    /// Per-unit registration proves membership in a committed batch.
    /// `proof` is the Merkle inclusion path (about log2(n) hashes).
    function register(EventEnvelope calldata env, RegClass regClass,
                      bytes32 templateDigest, bytes32 batchRoot,
                      bytes32[] calldata proof) external {
        require(batchRoots[batchRoot], "unknown batch");
        require(!assets[env.assetDid].exists, "duplicate DID"); // uniqueness
        bytes32 leaf = keccak256(abi.encode(env.assetDid, templateDigest,
                                            env.payloadDigest));
        require(_verifyInclusion(leaf, proof, batchRoot), "bad proof");

        assets[env.assetDid] = Registration({
            regClass: regClass,
            templateDigest: templateDigest,
            batchRoot: batchRoot,
            registrarRole: env.submitterRole,
            ledgerTime: uint64(block.timestamp),
            exists: true
        });
        emit AssetRegistered(env.assetDid, regClass, batchRoot);
    }

    function templateOf(bytes32 assetDid) external view returns (bytes32) {
        require(assets[assetDid].exists, "unknown asset");
        return assets[assetDid].templateDigest;
    }

    function _verifyInclusion(bytes32 leaf, bytes32[] calldata proof,
                              bytes32 root) internal pure returns (bool) {
        bytes32 node = leaf;
        for (uint256 i = 0; i < proof.length; i++) {
            node = node < proof[i]
                ? keccak256(abi.encodePacked(node, proof[i]))
                : keccak256(abi.encodePacked(proof[i], node));
        }
        return node == root;
    }
}
```

**Commentary.** Uniqueness is enforced at the DID, not the serial number — the
contract cannot know whether two DIDs describe one laminate; that is the binding
layer's job (Chapter 6), and the registry's job is to make double-registration of
one DID impossible and every registration attributable. Note what is deliberately
*absent*: no product metadata, no owner names, no site data. Those live in
payloads and the party registry (Section 10.2); the contract holds only what
consensus must order.

## A.3 LifecycleSM (excerpt): the EVT_COMMISSION path {.unnumbered}

```solidity
contract LifecycleSM {
    uint8 constant EVT_INSTALL    = 3;
    uint8 constant EVT_COMMISSION = 4;   // Table 5.1 (excerpt)

    struct Attestation {              // Section 4.5 oracle chain
        bytes32 attestorRole;         // instrument or co-signer role DID
        uint8   kind;                 // 1 = instrument, 2 = co-signature
        bytes   sig;                  // over the envelope digest
    }

    mapping(bytes32 => AssetState) public stateOf;
    mapping(bytes32 => bytes32)    public custodianOf;   // role DID

    IRoleAccred  public immutable accred;
    AssetRegistry public immutable registry;

    event LifecycleEvent(bytes32 indexed assetDid, uint8 indexed eventType,
                         bytes32 payloadDigest, uint64 claimedTime);
    event WarrantyClockStarted(bytes32 indexed assetDid, uint64 startTime);

    uint64 constant COMMISSION_WINDOW = 30 days;   // Section 5.5 submission window

    function submitCommission(EventEnvelope calldata env,
                              Attestation[] calldata atts) external {
        // 1. Transition legality (Figure 5.1)
        require(stateOf[env.assetDid] == AssetState.Installed, "state");

        // 2. Submitter authorization: EPC role for this site
        require(accred.isAccredited(env.submitterRole, Role.EPC,
                                    env.claimedTime), "submitter");

        // 3. Corroboration Class C (Table 5.1): at least one in-calibration
        //    instrument attestation AND one owner-side co-signature.
        require(_hasInstrument(atts, env) && _hasOwnerCosign(atts, env),
                "corroboration");

        // 4. Submission window (Section 5.1: offline entry is first-class,
        //    but the claimed-time / ledger-time gap is bounded)
        require(block.timestamp >= env.claimedTime &&
                block.timestamp - env.claimedTime <= COMMISSION_WINDOW,
                "window");

        stateOf[env.assetDid] = AssetState.Commissioned;
        emit LifecycleEvent(env.assetDid, EVT_COMMISSION,
                            env.payloadDigest, env.claimedTime);
        // Derived event the insurer's client subscribes to (Section 11.4)
        emit WarrantyClockStarted(env.assetDid, env.claimedTime);
    }

    function _hasInstrument(Attestation[] calldata atts,
                            EventEnvelope calldata env)
            internal view returns (bool) {
        for (uint256 i = 0; i < atts.length; i++) {
            if (atts[i].kind == 1 &&
                accred.inCalibration(atts[i].attestorRole, env.claimedTime) &&
                _sigValid(atts[i], env)) return true;
        }
        return false;
    }

    function _hasOwnerCosign(Attestation[] calldata atts,
                             EventEnvelope calldata env)
            internal view returns (bool) {
        for (uint256 i = 0; i < atts.length; i++) {
            if (atts[i].kind == 2 &&
                accred.isAccredited(atts[i].attestorRole, Role.OwnerEngineer,
                                    env.claimedTime) &&
                _sigValid(atts[i], env)) return true;
        }
        return false;
    }

    function _sigValid(Attestation calldata att, EventEnvelope calldata env)
            internal view returns (bool) {
        // Signature verification is delegated to the algorithm policy in
        // force at env.claimedTime (Section 9.4, pattern P2): the same
        // envelope verifies under ECDSA in era 1, hybrid in transition,
        // ML-DSA thereafter, without contract surgery.
        return accred.verifyByPolicy(att.attestorRole, att.sig,
                                     _envelopeDigest(env), env.claimedTime);
    }

    function _envelopeDigest(EventEnvelope calldata env)
            internal pure returns (bytes32) {
        return keccak256(abi.encode(env));   // canonical: fixed field order
    }
}
```

**Commentary.** This is Figure 5.2 as code, and the four numbered checks are the
entire write-time constitution for this event: state, role, corroboration,
window. Everything else the pilot wanted to check at first — payload plausibility,
test-value ranges, degradation sanity — was deliberately moved to the read-side
cohort monitor (Section 5.5), and the S2 governance episode (Section 11.3)
vindicated the split: the 72-hour co-signing dispute was resolved by changing a
*parameter*, not contract logic. The `verifyByPolicy` indirection is where
Chapter 9 lives in code: signature validity is evaluated against the algorithm
policy in force at the claimed time, so cryptographic migration is a policy-
register update, never a state-machine redeployment.

## A.4 RoleAccred (interface) and the time-contextual verifier {.unnumbered}

```solidity
enum Role { Registrar, EPC, OwnerEngineer, OandM, Inspector,
            Recycler, Instrument, Adjudicator }

interface IRoleAccred {
    /// Accreditation is an interval, not a bit: authority is evaluated
    /// at the time the event claims, against ledger-recorded validity
    /// (Section 8.5 succession; Section 9.4 pattern P2).
    function isAccredited(bytes32 roleDid, Role role, uint256 atTime)
        external view returns (bool);

    function inCalibration(bytes32 instrumentDid, uint256 atTime)
        external view returns (bool);

    /// Verifies `sig` over `digest` under the algorithm policy that the
    /// on-ledger policy register (Section 9.6) declares in force for
    /// this role at `atTime`. Hybrid-era policies require both classical
    /// and PQC components to verify.
    function verifyByPolicy(bytes32 roleDid, bytes calldata sig,
                            bytes32 digest, uint256 atTime)
        external view returns (bool);
}
```

## A.5 Off-chain verifier sketch: Chapter 6, Steps 1–2 {.unnumbered}

The downstream verifier is not a contract — it reads. The sketch below (Python-
style pseudocode) is the skeleton of the insurer's client from Section 11.3-S3.

```python
def verify_asset_history(asset_did, headers, anchors, custody, policy):
    """Chapter 6, Steps 1-2: record authenticity + evidence-graph review.
    `headers`/`anchors` are consortium block headers and public-chain
    anchor receipts; `custody` fetches payloads; `policy` is the
    verifier's own acceptance policy (not the ledger's)."""

    events = fetch_event_stream(asset_did)

    for ev in events:
        # Step 1a: inclusion against anchored history (Section 2.2, 4.4)
        assert merkle_included(ev, headers)
        assert header_anchored(headers.block_of(ev), anchors)

        # Step 1b: signatures under the algorithm policy at claimed time
        # (Section 9.4 P2; pre-re-anchor eras trust the anchor chain P1)
        assert verify_by_policy(ev.submitter, ev, at=ev.claimed_time)
        for att in ev.corroborations:
            assert verify_by_policy(att.attestor, att, at=ev.claimed_time)

        # Step 1c: payload digests against replicated custody
        payload = custody.fetch(ev.payload_refs)
        assert canonical_digest(payload) == ev.payload_digest

    # Step 2: evidence-graph review over the prior_refs DAG (Section 5.4)
    dag = build_dag(events)
    assert dag.commissioning().corroboration_class() >= policy.min_class
    for inspection in dag.condition_chain():
        assert instrument_in_calibration(inspection)      # recursion: Rule 3
        assert plausible_evolution(inspection, dag)       # R5, Section 6.4
    assert cadence_within_cohort(events, policy.cohort_baseline)  # Section 5.7

    return Verdict(pass_remote=True,
                   residuals=["enrollment substitution (F2)",
                              "unrecorded events (Section 5.7)"])
```

The `residuals` line is not decoration; it is the appendix's restatement of the
book's discipline. A verifier that returns only a boolean has hidden its
assumptions; a verifier that names what it could not check (Section 6.6, Step 4)
is the one an underwriter can price against.

\newpage
