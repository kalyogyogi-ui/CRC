# Figure 4.1

**The partition and its verification path. Solid arrows are the write path at event time; dashed arrows are the read/verification path years later.**

Source chapter: `ch04-designing-the-identity-layer.md`

![Figure 4.1](figure-4-1.png)

## Mermaid source

```mermaid
flowchart LR
    subgraph WRITE [Event time]
        E[Event payload:<br>report, image,<br>defect map] --> C[Canonical<br>serialization]
        C --> D[Digest]
        C --> S1[(Owner store)]
        C --> S2[(Manufacturer store)]
        C --> S3[(Archival store)]
        D --> TX[Ledger transaction:<br>DID, type, digest,<br>refs, signatures]
    end
    TX --> LED[Consortium ledger]
    LED --> ANC[Public-chain anchor]
    subgraph READ [Verification time, years later]
        V[Verifier]
    end
    V -.-> S3
    V -.-> LED
    V -.-> ANC
```
