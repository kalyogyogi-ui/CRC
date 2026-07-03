# Figure 5.3

**A fragment of one module's evidence DAG, as a warranty adjudicator would traverse it. Boxes are events; arrows are `prior_refs` edges (each arrow points from an event to evidence it relies on).**

Source chapter: `ch05-lifecycle-event-modeling.md`

![Figure 5.3](figure-5-3.png)

## Mermaid source

```mermaid
flowchart RL
    RES[EVT_RESOLVE<br>adjudicator, yr 13] --> CLM[EVT_FAULT claim<br>owner, yr 12]
    RES --> REB[Manufacturer response<br>+ factory first-article refs]
    CLM --> C2[EVT_INSPECT<br>EL campaign, yr 11]
    CLM --> C1[EVT_INSPECT<br>EL sample, yr 6]
    CLM --> COM[EVT_COMMISSION<br>Class C, yr 0]
    REB --> C2
    REB --> REG[EVT_REGISTER<br>factory enrollment]
    C2 --> C1
    C1 --> COM
    COM --> INS[EVT_INSTALL<br>position map]
    INS --> REG
    C2 -.instrument DID.-> CAL[Instrument calibration<br>chain, own DAG]
```
