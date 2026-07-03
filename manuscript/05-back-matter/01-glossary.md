# Glossary {.unnumbered}

**Active binding.** Physical-binding mechanism in which the asset holds a secret
(a private key in tamper-resistant hardware) and proves possession by
challenge–response. Applicable to assets with electronics and power. (§3.3)

**Anchoring.** Periodic commitment of a digest of consortium-ledger state into
one or more public blockchains, so that later rewriting of consortium history is
detectable against a record the consortium does not control. (§4.4)

**Asset DID.** Decentralized identifier registered for a single physical unit,
resolvable to a DID document holding binding references, controller history, and
the ledger address of the lifecycle record. (§3.5)

**Attributability.** Property that every statement attached to an asset identity
records who made it and cannot be silently altered or deleted afterward. One of
the four identity properties. (§1.2)

**Bindability / binding.** Property that a party holding the physical asset can
verify it is the unit its identity record designates. Implemented actively
(device keys) or passively (structural fingerprints). (§1.2, Ch. 3, 6)

**Challenge-parameterized measurement.** Verification protocol in which the
measurement operating point (bias current, region subset) is drawn at random from
a challenge space fixed at enrollment, so static replicas fail off-challenge.
(§6.4)

**Cohort monitor.** Read-side analytics service that flags assets whose condition
or event cadence departs from their production or deployment cohort; holds no
write authority. (§8.4, §11.2)

**Completeness problem.** The limitation that a ledger proves what was recorded,
never that everything that happened was recorded; addressed by incentive design,
not cryptography. (§5.7)

**Condition layer.** The evolving component of a structural fingerprint (crack
networks, solder-bond drift), separated at enrollment from the stable layer and
used as the baseline condition record. (§6.3)

**Consortium ledger.** Permissioned, BFT-consensus ledger operated by identified
industry parties (manufacturers, operators, insurers, certifiers); the
operational record layer of the architecture. (§2.4)

**Corroboration class.** Per-event-type requirement (Class A: submitter only;
B: plus instrument attestation; C: plus adverse or independent co-signature)
enforced at write time. (§4.5, §5.3)

**Digest.** Output of a cryptographic hash function over a canonical
serialization; the on-chain commitment to an off-chain payload. (§2.6, §4.2)

**Digital product passport (DPP).** Regulatory per-unit record of identity,
composition, and lifecycle data with tiered access, mandated for batteries by
Regulation (EU) 2023/1542 and extended by the ESPR. (§10.4, §12.2)

**Enrollment.** The trusted measurement at which a structural fingerprint is
captured and committed to the identity record; the system's trusted setup.
(§3.4, §4.3)

**Evidence DAG.** The directed acyclic graph formed by events referencing prior
events (`prior_refs`), traversed by verifiers instead of replaying an asset's
whole history. (§5.4)

**Evidential record.** A sparse, append-only, multi-party record intended as
evidence — as distinct from an operational digital twin. (§3.2)

**Garbage-in permanence.** The failure mode in which a ledger immutably preserves
false inputs; the reason oracle and binding design dominate ledger design. (§1.5,
§2.1)

**Ghost-shift production.** Units manufactured on genuine tooling outside
contracted runs, escaping the quality system while carrying genuine branding.
(§1.4.1, §4.3)

**Identity retirement / laundering.** Attack family in which good identities are
falsely terminated (or units re-enrolled with clean slates) to escape recorded
history. (§8.3-F4)

**Lifecycle state machine.** The nine-state model (Registered through Recycled)
whose transitions are effected only by schema-conformant ledger events. (§5.2)

**Merkle aggregation / batching.** Committing a batch of records via a single
on-chain Merkle root while preserving per-unit provability by inclusion proof.
(§2.2, §7.2)

**Mosca's inequality.** Migration-timing rule: act now if data lifetime plus
migration time exceeds time to threat arrival. (§9.2)

**NV magnetometry.** Magnetic-field imaging using nitrogen-vacancy centers in
diamond; inverted to current-density maps revealing defect structure in PV
cells. (§6.2)

**Oracle.** Any mechanism introducing external facts onto the ledger; in this
architecture, a signed computation chain from instrument to contract. (§2.5,
§4.5)

**Passive binding.** Binding derived from measurable physical structure rather
than a stored secret; required for assets without electronics. (§3.4)

**Persistence.** Property that an identity survives custody, ownership, and
institutional changes for the asset's full service life. (§1.2)

**Proof of retrievability.** Challenge protocol by which off-chain custody
stores prove they still hold committed payloads; outcomes logged as ledger
events. (§4.2)

**Re-anchoring (pattern P1).** Committing the entire existing ledger under a
successor algorithm before the incumbent weakens, transferring evidential weight
from signatures to anchored structure. (§9.4)

**Registrar.** The accredited role authorized to create asset identities;
plural by design, with revocable, ledger-recorded accreditation. (§4.3)

**Retroactive registration.** Enrollment of an already-fielded asset, carrying
explicitly weaker provenance than factory registration. (§4.3)

**Stable-structure layer.** The component of a defect map fixed at manufacture
(grain texture, as-built shunt population) on which identity rests. (§6.3)

**Supersession.** Replacement-with-provenance of a binding template or role key,
never deletion; the chain of superseded templates is itself evidence. (§6.4,
§9.4)

**Three-zone topology.** Privacy architecture separating public anchors and
aggregates, consortium envelope data, and controlled payload/party-registry
custody. (§10.2)

**Tiered assurance.** Purchasing identity assurance in proportion to value at
risk: universal cheap enrollment, opportunistic re-verification, sampled
high-assurance escalation, laboratory reference. (§3.6, §6.7)

**Two-layer decomposition.** Separation of a measured defect map into
stable-structure and condition layers, making one measurement serve identity and
condition simultaneously. (§6.3)

**Verifiable credential (VC).** Signed, schema-conformant claims by an issuer
about a subject; the container for test reports, commissioning records, and
accreditations. (§3.5)

\newpage
