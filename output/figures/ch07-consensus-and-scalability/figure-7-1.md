# Figure 7.1

**Merkle-aggregated registration. One consensus round commits a production batch; each unit remains individually provable.**

Source chapter: `ch07-consensus-and-scalability.md`

![Figure 7.1](figure-7-1.png)

## Mermaid source

```mermaid
flowchart LR
    subgraph FACT [Factory registrar, per shift]
        U1[Unit regs<br>r1 … r4096] --> MT[Merkle tree<br>over batch]
        MT --> ROOT[Batch root]
        U1 --> MAN[Batch manifest]
    end
    MAN --> CUST[(Replicated custody<br>committed first)]
    ROOT --> TX[Single ledger tx:<br>root + manifest digest<br>+ registrar signature]
    TX --> LED[Consortium ledger]
    LED --> AN[Public anchor]
    P[Any single unit's DID] -. leaf proof,<br>log2 4096 = 12 hashes .-> ROOT
```
