# Figure 4.4

**Deployment topology for a national-scale identity layer. Every organization runs the components in its own box; nothing in the architecture requires shared infrastructure beyond the protocols.**

Source chapter: `ch04-designing-the-identity-layer.md`

![Figure 4.4](figure-4-4.png)

## Mermaid source

```mermaid
flowchart TB
    subgraph MFR [Manufacturer premises]
        QA[QA instruments I-A] --> RAG[Registrar agent + HSM]
        RAG --> VN1[Validator node]
        RAG --> ST1[(Custody store)]
    end
    subgraph OWN [Owner / operator]
        WOS[Work-order system<br>event emission] --> VN2[Validator node]
        ST2[(Custody store)]
        MONC[Cohort monitor<br>read-side]
    end
    subgraph INSR [Insurer / certifier / archival]
        VC2[Verification clients] --> RR[Read replica<br>+ proof service]
        VN3[Validator nodes ×k]
        ST3[(Archival custody<br>+ cold export)]
    end
    subgraph FIELD [Field]
        HH2[Handheld verify kits I-B]
        INV2[Active devices I-A]
    end
    VN1 <--> VN2
    VN2 <--> VN3
    VN1 <--> VN3
    VN3 --> ANCC[Anchor agent] --> PUB2[Public chains ×2]
    HH2 --> WOS
    INV2 --> WOS
    RR --> EXT[External verifiers:<br>buyers, lenders, regulators]
```
