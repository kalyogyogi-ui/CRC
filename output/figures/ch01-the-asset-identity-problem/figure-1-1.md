# Figure 1.1

**Lifecycle of a distributed energy asset and the custody transitions at which records are created, transferred — and lost.**

Source chapter: `ch01-the-asset-identity-problem.md`

![Figure 1.1](figure-1-1.png)

## Mermaid source

```mermaid
flowchart LR
    A[Cell & material<br>suppliers] --> B[Module / device<br>manufacturer]
    B --> C[Distributor /<br>logistics]
    C --> D[EPC contractor:<br>installation &<br>commissioning]
    D --> E[Owner / operator<br>+ O&M contractor]
    E -->|resale| F[Second owner /<br>asset manager]
    E -->|failure| G[Warranty claim /<br>refurbisher]
    F --> H[Repowering:<br>redeployment or<br>secondary market]
    G --> E
    H --> I[Decommissioning<br>& recycling]
    E --> I
    style B fill:#dbe9f6,stroke:#2c5f8a
    style E fill:#dbe9f6,stroke:#2c5f8a
    style I fill:#dbe9f6,stroke:#2c5f8a
```
