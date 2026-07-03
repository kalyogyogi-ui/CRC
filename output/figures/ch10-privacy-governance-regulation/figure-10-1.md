# Figure 10.1

**The privacy architecture: three zones with one-way evidential references. Public verifiability flows left; identity resolution requires authorization flowing right.**

Source chapter: `ch10-privacy-governance-regulation.md`

![Figure 10.1](figure-10-1.png)

## Mermaid source

```mermaid
flowchart LR
    subgraph PUB [Public zone]
        AN[Anchors on public chains]
        AG[Attested aggregates:<br>fleet stats, recovery<br>mass balances]
    end
    subgraph CONS [Consortium zone]
        LED[Ledger: asset DIDs,<br>role DIDs, event envelopes,<br>digests only]
    end
    subgraph PRIV [Controlled zone]
        PAY[(Payload custody:<br>images, maps, terms)]
        REG[(Party registry:<br>role DID → legal person,<br>site → address)]
    end
    LED --> AN
    LED --> AG
    PAY -. digests .-> LED
    REG -. role DIDs .-> LED
    AUTH[Authorized verifier<br>dispute / audit / diligence] --> REG
    AUTH --> PAY
```
