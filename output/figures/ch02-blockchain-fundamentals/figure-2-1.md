# Figure 2.1

**Block structure and a Merkle inclusion proof. To prove record R3 is in the block, the prover supplies R3 with the sibling hash H(R4) and the uncle hash H12; the verifier recomputes the root and compares it with the header.**

Source chapter: `ch02-blockchain-fundamentals.md`

![Figure 2.1](figure-2-1.png)

## Mermaid source

```mermaid
flowchart TB
    subgraph BlockN [Block header n]
        PH[prev-header hash] --- MR[Merkle root] --- TS[timestamp / consensus data]
    end
    MR --> H1234[H1234]
    H1234 --> H12[H12]
    H1234 --> H34[H34]
    H12 --> R1[H R1]
    H12 --> R2[H R2]
    H34 --> R3[H R3]
    H34 --> R4[H R4]
    style R3 fill:#f6e3c5,stroke:#a8781f
    style R4 fill:#dbe9f6,stroke:#2c5f8a
    style H12 fill:#dbe9f6,stroke:#2c5f8a
    BlockN -.->|header chain| BlockN1[Block header n+1]
```
