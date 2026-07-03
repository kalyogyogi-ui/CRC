# Figure 6.2

**The four-step verification workflow. Steps 1–2 are remote and cheap; Step 3 is the proportional escalation of Section 3.6.**

Source chapter: `ch06-structural-defect-mapping.md`

![Figure 6.2](figure-6-2.png)

## Mermaid source

```mermaid
flowchart TB
    D[Downstream party D] --> S1[Step 1: Verify record authenticity<br>signatures, digests, public anchors]
    S1 --> S2[Step 2: Evidence-graph review<br>corroboration, calibration chains,<br>evolution plausibility, cadence]
    S2 --> DEC{Assurance level<br>required?}
    DEC -->|routine| S4a[Decide on remote<br>evidence alone]
    DEC -->|elevated| S3[Step 3: Sampled physical verification<br>pre-committed sampling design,<br>challenge-parameterized measurement]
    S3 --> S4[Step 4: Decision with<br>quantified residual risk]
    S4a --> OUT[Underwrite / price / accept / adjudicate]
    S4 --> OUT
```
