# Figure 14.1

**The research agenda mapped onto the architecture stack, with the passport regimes as the external force. Bold border marks S3, the gap with a closing window. Read bottom-up, the figure is the book's argument in miniature: the M-series keeps the binding layer honest, the C-series and S1 keep the record layer durable and interoperable, the naming and claims layers ride mostly-solved standards with succession amendments, and the external demand arrives at the top — so the stack's health depends most on the layers furthest from where the regulatory attention lands, which is the asymmetry this chapter exists to correct.**

Source chapter: `ch14-future-directions.md`

![Figure 14.1](figure-14-1.png)

## Mermaid source

```mermaid
flowchart TB
    subgraph EXT [External force]
        DPP[Passport regimes:<br>Battery Reg. live 2027,<br>ESPR acts pending]
    end
    subgraph STACK [Architecture stack — Fig. 3.2]
        CL[Claims layer] --- NM[Naming layer] --- RC[Record layer] --- BD[Binding layer]
    end
    DPP -->|demand for verifiable<br>per-unit records| CL
    C2K[C2 ZK disclosure] -.-> CL
    C4K[C4 / S2 DID method] -.-> NM
    C1K[C1 PQ-durable proofs<br>C3 formal SM verification<br>S1 event standard] -.-> RC
    M1K[M1 stability data<br>M2 challenge design<br>M3 line-speed imaging<br>M4 cell identity] -.-> BD
    S3K[S3 binding template<br>standards — closing window] ==> BD
    style S3K stroke-width:3px
```
