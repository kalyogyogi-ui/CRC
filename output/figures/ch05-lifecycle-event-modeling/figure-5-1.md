# Figure 5.1

**Asset lifecycle state machine. Every transition is effected only by a ledger event of the named type; the state-machine contract rejects events whose transition is not an arrow in this diagram.**

Source chapter: `ch05-lifecycle-event-modeling.md`

![Figure 5.1](figure-5-1.png)

## Mermaid source

```mermaid
stateDiagram-v2
    [*] --> Registered: EVT_REGISTER
    Registered --> InTransit: EVT_SHIP
    InTransit --> InTransit: EVT_CUSTODY_TRANSFER
    InTransit --> Installed: EVT_INSTALL
    Registered --> Installed: EVT_INSTALL
    Installed --> Commissioned: EVT_COMMISSION
    Commissioned --> Commissioned: EVT_INSPECT, EVT_MAINTAIN, EVT_FAULT, EVT_OWNERSHIP_TRANSFER
    Commissioned --> Suspended: EVT_SUSPEND
    Suspended --> Commissioned: EVT_RECOMMISSION
    Commissioned --> Removed: EVT_REMOVE
    Suspended --> Removed: EVT_REMOVE
    Removed --> InTransit: EVT_SHIP (redeployment / resale)
    Removed --> Decommissioned: EVT_DECOMMISSION
    Decommissioned --> Recycled: EVT_RECYCLE
    Recycled --> [*]
    Decommissioned --> [*]
```
