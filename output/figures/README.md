# Manuscript Figures — Chapter-wise Export

Rendered from Mermaid source in the manuscript. Each figure includes:
- `.mmd` — editable Mermaid source (as in the book)
- `.png` — high-resolution raster (2400px width, scale 2)
- `.svg` — vector for print/redraw
- `.md` — caption card with embedded image

---

## ch01-the-asset-identity-problem

- **Figure 1.1** — Lifecycle of a distributed energy asset and the custody transitions at which records are created, transferred — and lost.  
  `ch01-the-asset-identity-problem/figure-1-1.png` · `ch01-the-asset-identity-problem/figure-1-1.svg` · `ch01-the-asset-identity-problem/figure-1-1.mmd`
- **Figure 1.2** — Chapter dependency map. Solid arrows are strong prerequisites; the dashed arrow indicates helpful but optional background.  
  `ch01-the-asset-identity-problem/figure-1-2.png` · `ch01-the-asset-identity-problem/figure-1-2.svg` · `ch01-the-asset-identity-problem/figure-1-2.mmd`

## ch02-blockchain-fundamentals

- **Figure 2.1** — Block structure and a Merkle inclusion proof. To prove record R3 is in the block, the prover supplies R3 with the sibling hash H(R4) and the uncle hash H12; the verifier recomputes the root and compares it with the header.  
  `ch02-blockchain-fundamentals/figure-2-1.png` · `ch02-blockchain-fundamentals/figure-2-1.svg` · `ch02-blockchain-fundamentals/figure-2-1.mmd`
- **Figure 2.2** — The boundary between the deterministic on-chain world and the physical world. Everything crossing the boundary passes through oracles and signed transactions — the trust-critical interface of the entire architecture.  
  `ch02-blockchain-fundamentals/figure-2-2.png` · `ch02-blockchain-fundamentals/figure-2-2.svg` · `ch02-blockchain-fundamentals/figure-2-2.mmd`

## ch03-physical-asset-identity-models

- **Figure 3.1** — A taxonomy of binding mechanisms for physical assets. The right-hand branch — passive structural fingerprints — is where Chapter 6's contribution sits.  
  `ch03-physical-asset-identity-models/figure-3-1.png` · `ch03-physical-asset-identity-models/figure-3-1.svg` · `ch03-physical-asset-identity-models/figure-3-1.mmd`
- **Figure 3.2** — The layered identity stack assumed throughout Parts II–IV. Standards supply the naming and claim formats; the ledger supplies ordering and permanence; the binding layer attaches the whole construction to matter.  
  `ch03-physical-asset-identity-models/figure-3-2.png` · `ch03-physical-asset-identity-models/figure-3-2.svg` · `ch03-physical-asset-identity-models/figure-3-2.mmd`

## ch04-designing-the-identity-layer

- **Figure 4.1** — The partition and its verification path. Solid arrows are the write path at event time; dashed arrows are the read/verification path years later.  
  `ch04-designing-the-identity-layer/figure-4-1.png` · `ch04-designing-the-identity-layer/figure-4-1.svg` · `ch04-designing-the-identity-layer/figure-4-1.mmd`
- **Figure 4.2** — Manufacture-time issuance for a passive asset. The gray band marks the trusted-setup boundary: everything below it is cryptographically verifiable ever after; everything above it is procedural and must be defended procedurally.  
  `ch04-designing-the-identity-layer/figure-4-2.png` · `ch04-designing-the-identity-layer/figure-4-2.svg` · `ch04-designing-the-identity-layer/figure-4-2.mmd`
- **Figure 4.3** — The oracle layer as a computation provenance chain. Every arrow carries a signature; every box references its input digests.  
  `ch04-designing-the-identity-layer/figure-4-3.png` · `ch04-designing-the-identity-layer/figure-4-3.svg` · `ch04-designing-the-identity-layer/figure-4-3.mmd`
- **Figure 4.4** — Deployment topology for a national-scale identity layer. Every organization runs the components in its own box; nothing in the architecture requires shared infrastructure beyond the protocols.  
  `ch04-designing-the-identity-layer/figure-4-4.png` · `ch04-designing-the-identity-layer/figure-4-4.svg` · `ch04-designing-the-identity-layer/figure-4-4.mmd`

## ch05-lifecycle-event-modeling

- **Figure 5.1** — Asset lifecycle state machine. Every transition is effected only by a ledger event of the named type; the state-machine contract rejects events whose transition is not an arrow in this diagram.  
  `ch05-lifecycle-event-modeling/figure-5-1.png` · `ch05-lifecycle-event-modeling/figure-5-1.svg` · `ch05-lifecycle-event-modeling/figure-5-1.mmd`
- **Figure 5.3** — A fragment of one module's evidence DAG, as a warranty adjudicator would traverse it. Boxes are events; arrows are `prior_refs` edges (each arrow points from an event to evidence it relies on).  
  `ch05-lifecycle-event-modeling/figure-5-3.png` · `ch05-lifecycle-event-modeling/figure-5-3.svg` · `ch05-lifecycle-event-modeling/figure-5-3.mmd`
- **Figure 5.2** — Write-time enforcement sequence for `EVT_COMMISSION`.  
  `ch05-lifecycle-event-modeling/figure-5-2.png` · `ch05-lifecycle-event-modeling/figure-5-2.svg` · `ch05-lifecycle-event-modeling/figure-5-2.mmd`

## ch06-structural-defect-mapping

- **Figure 6.1** — The enrollment pipeline. Everything to the right of the instrument is a signed computation chain; the two-layer decomposition feeds identity and condition records separately.  
  `ch06-structural-defect-mapping/figure-6-1.png` · `ch06-structural-defect-mapping/figure-6-1.svg` · `ch06-structural-defect-mapping/figure-6-1.mmd`
- **Figure 6.2** — The four-step verification workflow. Steps 1–2 are remote and cheap; Step 3 is the proportional escalation of Section 3.6.  
  `ch06-structural-defect-mapping/figure-6-2.png` · `ch06-structural-defect-mapping/figure-6-2.svg` · `ch06-structural-defect-mapping/figure-6-2.mmd`

## ch07-consensus-and-scalability

- **Figure 7.1** — Merkle-aggregated registration. One consensus round commits a production batch; each unit remains individually provable.  
  `ch07-consensus-and-scalability/figure-7-1.png` · `ch07-consensus-and-scalability/figure-7-1.svg` · `ch07-consensus-and-scalability/figure-7-1.mmd`

## ch08-threat-model

- **Figure 8.1** — Attack surface by layer of the Figure 3.2 stack. Numbered attack families are treated in Sections 8.3–8.6.  
  `ch08-threat-model/figure-8-1.png` · `ch08-threat-model/figure-8-1.svg` · `ch08-threat-model/figure-8-1.mmd`

## ch09-post-quantum-considerations

- **Figure 9.1** — The migration timeline as the schema sees it: overlapping algorithm validity intervals, periodic re-anchors, and hardware re-attestation waves. A verifier at any point evaluates each record against the policy in force at its creation, plus the re-anchor chain since.  
  `ch09-post-quantum-considerations/figure-9-1.png` · `ch09-post-quantum-considerations/figure-9-1.svg` · `ch09-post-quantum-considerations/figure-9-1.mmd`

## ch10-privacy-governance-regulation

- **Figure 10.1** — The privacy architecture: three zones with one-way evidential references. Public verifiability flows left; identity resolution requires authorization flowing right.  
  `ch10-privacy-governance-regulation/figure-10-1.png` · `ch10-privacy-governance-regulation/figure-10-1.svg` · `ch10-privacy-governance-regulation/figure-10-1.mmd`

## ch11-solar-pilot-case-study

- **Figure 11.1** — Pilot system diagram. Shaded components are the three zones of Figure 10.1; arrows show the dominant data flows, quantified in Section 11.2.1. Every organization hosts its own boxes on its own infrastructure — the validator set spans four hosting arrangements and three jurisdictions, per Section 4.7's anti-correlation rule.  
  `ch11-solar-pilot-case-study/figure-11-1.png` · `ch11-solar-pilot-case-study/figure-11-1.svg` · `ch11-solar-pilot-case-study/figure-11-1.mmd`

## ch12-extending-the-model

- **Figure 12.1** — Battery lifecycle extension to the Chapter 5 state machine. Unshaded states are inherited unchanged from Figure 5.1; the figure shows only the extension's neighborhood, since everything upstream of the first `Removed` is the base machine verbatim.  
  `ch12-extending-the-model/figure-12-1.png` · `ch12-extending-the-model/figure-12-1.svg` · `ch12-extending-the-model/figure-12-1.mmd`

## ch13-economic-and-market-implications

- **Figure 13.1** — The adoption loop the incidence table implies: pricing levers, not mandates, carry the mechanism from first movers to the value chain.  
  `ch13-economic-and-market-implications/figure-13-1.png` · `ch13-economic-and-market-implications/figure-13-1.svg` · `ch13-economic-and-market-implications/figure-13-1.mmd`

## ch14-future-directions

- **Figure 14.1** — The research agenda mapped onto the architecture stack, with the passport regimes as the external force. Bold border marks S3, the gap with a closing window. Read bottom-up, the figure is the book's argument in miniature: the M-series keeps the binding layer honest, the C-series and S1 keep the record layer durable and interoperable, the naming and claims layers ride mostly-solved standards with succession amendments, and the external demand arrives at the top — so the stack's health depends most on the layers furthest from where the regulatory attention lands, which is the asymmetry this chapter exists to correct.  
  `ch14-future-directions/figure-14-1.png` · `ch14-future-directions/figure-14-1.svg` · `ch14-future-directions/figure-14-1.mmd`
