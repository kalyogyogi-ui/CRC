# Figure 11.1

**Pilot system diagram. Shaded components are the three zones of Figure 10.1; arrows show the dominant data flows, quantified in Section 11.2.1. Every organization hosts its own boxes on its own infrastructure — the validator set spans four hosting arrangements and three jurisdictions, per Section 4.7's anti-correlation rule.**

Source chapter: `ch11-solar-pilot-case-study.md`

![Figure 11.1](figure-11-1.png)

## Mermaid source

```mermaid
flowchart TB
    subgraph FACTORY [Factory - module OEM]
        ELI[In-line EL + flash<br>instrument DIDs] --> RA[Registrar agent:<br>batching, Merkle roots]
        QDM[Tier-2 defect-map<br>station, sampled] --> RA
    end
    subgraph FIELD [Site - EPC then O&M]
        HH[Handheld verify kit:<br>EL spot + challenge app]
        INV[340 inverters:<br>secure-element DIDs,<br>self-attesting commissioning]
        DRONE[Drone IR / EL<br>campaign rigs]
    end
    subgraph CONS [Consortium zone - 8 validators]
        LED[(BFT ledger:<br>registry + lifecycle<br>contracts)]
        MON[Cohort monitor:<br>read-side analytics]
    end
    subgraph CTRL [Controlled zone]
        PAY[(Payload custody ×3:<br>owner, OEM, archival)]
        PREG[(Party registry:<br>role DIDs)]
    end
    subgraph PUBZ [Public zone]
        ANC1[Anchor chain A]
        ANC2[Anchor chain B]
    end
    RA --> LED
    RA --> PAY
    HH --> LED
    INV --> LED
    DRONE --> PAY
    DRONE --> LED
    LED --> ANC1
    LED --> ANC2
    MON --> LED
    PREG -.-> LED
    INS[Insurer / buyer<br>verification clients] --> LED
    INS --> ANC1
    INS -.authorized.-> PAY
```
