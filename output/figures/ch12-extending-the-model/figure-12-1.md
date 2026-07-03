# Figure 12.1

**Battery lifecycle extension to the Chapter 5 state machine. Unshaded states are inherited unchanged from Figure 5.1; the figure shows only the extension's neighborhood, since everything upstream of the first `Removed` is the base machine verbatim.**

Source chapter: `ch12-extending-the-model.md`

![Figure 12.1](figure-12-1.png)

## Mermaid source

```mermaid
stateDiagram-v2
    state "Installed (2nd application)" as Installed2
    state "Commissioned (2nd life)" as Commissioned2
    state "Removed (2nd)" as Removed2
    Commissioned --> Removed: EVT_REMOVE
    Removed --> Repurposing: EVT_REPURPOSE_OUT (SoH payload, Class C)
    Repurposing --> Installed2: EVT_REPURPOSE_IN (new application class)
    Installed2 --> Commissioned2: EVT_COMMISSION
    Commissioned2 --> Removed2: EVT_REMOVE
    Removed2 --> Decommissioned: EVT_DECOMMISSION
    Decommissioned --> Recycled: EVT_RECYCLE (mass balance mandated)
```
