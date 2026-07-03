# Figure 2.2

**The boundary between the deterministic on-chain world and the physical world. Everything crossing the boundary passes through oracles and signed transactions — the trust-critical interface of the entire architecture.**

Source chapter: `ch02-blockchain-fundamentals.md`

![Figure 2.2](figure-2-2.png)

## Mermaid source

```mermaid
flowchart LR
    subgraph OFF [Physical world / off-chain]
        S[Sensors & instruments] --> O[Oracle layer<br>Ch. 4]
        M[Manufacturer, EPC, O&M<br>signing keys] --> T[Signed transactions]
        DB[(Off-chain data stores:<br>images, defect maps,<br>telemetry)]
    end
    subgraph ON [Ledger / on-chain]
        R[Asset registry<br>contract]
        L[Lifecycle state<br>machine contract]
        A[Anchoring &<br>audit contract]
    end
    O --> L
    T --> R
    T --> L
    DB -. digests only .-> L
    A -->|periodic digest| P[Public PoS chain<br>anchor]
```
