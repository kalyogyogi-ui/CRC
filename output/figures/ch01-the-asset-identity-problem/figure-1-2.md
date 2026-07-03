# Figure 1.2

**Chapter dependency map. Solid arrows are strong prerequisites; the dashed arrow indicates helpful but optional background.**

Source chapter: `ch01-the-asset-identity-problem.md`

![Figure 1.2](figure-1-2.png)

## Mermaid source

```mermaid
flowchart TB
    subgraph P1 [Part I — Foundations]
        C1[Ch 1<br>Problem] --> C2[Ch 2<br>Ledger<br>fundamentals]
        C1 --> C3[Ch 3<br>Identity<br>models]
    end
    subgraph P2 [Part II — Architecture]
        C4[Ch 4<br>Identity layer] --> C5[Ch 5<br>Lifecycle<br>events]
        C5 --> C6[Ch 6<br>Defect mapping &<br>verification]
        C4 --> C7[Ch 7<br>Consensus &<br>scale]
    end
    subgraph P3 [Part III — Security & Trust]
        C8[Ch 8<br>Threat model] --> C9[Ch 9<br>Post-quantum]
        C8 --> C10[Ch 10<br>Privacy &<br>regulation]
    end
    subgraph P4 [Part IV — Application]
        C11[Ch 11<br>Solar pilot] --> C12[Ch 12<br>Wind, storage,<br>IoT]
        C11 --> C13[Ch 13<br>Economics]
        C12 --> C14[Ch 14<br>Open problems]
        C13 --> C14
    end
    C2 --> C4
    C3 --> C4
    C6 --> C8
    C7 --> C11
    C10 -.-> C11
    C6 --> C11
```
