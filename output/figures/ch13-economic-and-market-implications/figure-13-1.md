# Figure 13.1

**The adoption loop the incidence table implies: pricing levers, not mandates, carry the mechanism from first movers to the value chain.**

Source chapter: `ch13-economic-and-market-implications.md`

![Figure 13.1](figure-13-1.png)

## Mermaid source

```mermaid
flowchart LR
    INS[Insurers & lenders:<br>immediate benefit,<br>trivial cost] -->|premium credits,<br>covenant terms| OWN[Owners adopt:<br>consortium fees pay back<br>at exit/refinancing]
    OWN -->|procurement<br>requirements| OEM[OEMs enroll at<br>manufacture; premium<br>lines signal first]
    OWN -->|SLA completeness<br>terms, shared savings| OM[O&M integrates<br>event emission]
    OEM --> MKT[Verified fleets reach<br>secondary market]
    OM --> MKT
    MKT -->|observed resale premia,<br>loss experience| INS
```
