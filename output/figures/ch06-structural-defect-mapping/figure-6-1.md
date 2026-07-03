# Figure 6.1

**The enrollment pipeline. Everything to the right of the instrument is a signed computation chain; the two-layer decomposition feeds identity and condition records separately.**

Source chapter: `ch06-structural-defect-mapping.md`

![Figure 6.1](figure-6-1.png)

## Mermaid source

```mermaid
flowchart LR
    M[Module under bias] --> Q[NV magnetometer<br>signed raw field map]
    Q --> INV[Current-density<br>inversion, signed]
    INV --> REG[Grid registration &<br>normalization, signed]
    REG --> DEC{Two-layer<br>decomposition}
    DEC --> ST[Stable-structure layer<br>→ identity template]
    DEC --> CN[Condition layer<br>→ condition summary]
    ST --> TD[Template digest]
    CN --> CD[Condition digest]
    TD --> EV[EVT_REGISTER /<br>EVT_INSPECT payload]
    CD --> EV
    Q -. full maps .-> STOR[(Replicated<br>off-chain custody)]
    EV --> LEDG[Consortium ledger<br>+ public anchor]
```
