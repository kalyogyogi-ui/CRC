# Figure 4.3

**The oracle layer as a computation provenance chain. Every arrow carries a signature; every box references its input digests.**

Source chapter: `ch04-designing-the-identity-layer.md`

![Figure 4.3](figure-4-3.png)

## Mermaid source

```mermaid
flowchart LR
    PHY[Physical<br>measurement] --> INS[Instrument<br>secure element<br>signs raw data]
    INS --> PROC[Processing step:<br>template / feature<br>extraction, signed]
    PROC --> ATT[Attestation:<br>claim + input digests<br>+ corroborations]
    ATT --> SM[Lifecycle contract:<br>schema + corroboration<br>class checks]
    SM --> LEDG[Ledger commit]
    CAL[Calibration events<br>instrument's own DID] -.-> INS
    CO[Corroborating<br>signer / modality] -.-> ATT
```
