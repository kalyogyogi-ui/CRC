# Figure 3.2

**The layered identity stack assumed throughout Parts II–IV. Standards supply the naming and claim formats; the ledger supplies ordering and permanence; the binding layer attaches the whole construction to matter.**

Source chapter: `ch03-physical-asset-identity-models.md`

![Figure 3.2](figure-3-2.png)

## Mermaid source

```mermaid
flowchart TB
    subgraph L4 [Claims layer]
        VC1[Verifiable credentials:<br>test reports, commissioning,<br>inspections, warranty]
    end
    subgraph L3 [Naming layer]
        DID[Asset DIDs + DID documents:<br>controller, binding references,<br>succession history]
    end
    subgraph L2 [Record layer — Ch. 2, 4, 5]
        LED[Consortium ledger:<br>registry, lifecycle state machine,<br>anchored to public chain]
    end
    subgraph L1 [Binding layer — this chapter, Ch. 6]
        AB[Active: device keys<br>in secure elements]
        PB[Passive: structural<br>fingerprints / defect maps]
    end
    VC1 --> DID
    DID --> LED
    LED --> AB
    LED --> PB
    AB --> HW[Physical asset]
    PB --> HW
```
