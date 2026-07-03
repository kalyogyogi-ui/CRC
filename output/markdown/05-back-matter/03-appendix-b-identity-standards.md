# Appendix B: Comparative Table of Identity Standards {.unnumbered}

This appendix consolidates, in reference form, the standards landscape discussed in
Sections 3.5, 10.4, 12.5, and 14.3. Assessments reflect the state of each
instrument at the time of writing and use the book's requirement vocabulary:
the four identity properties of Section 1.2 (uniqueness U, persistence P,
bindability B, attributability A), the binding requirements R1–R6 of Table 6.2,
and the interoperability layers S1–S5 of Table 14.1.

## B.1 Identifier and credential standards {.unnumbered}

| Standard | Governing body | Designed for | U | P | B | A | Fit for energy hardware — notes |
|---|---|---|:-:|:-:|:-:|:-:|---|
| DID v1.0 | W3C | Persons, orgs, software agents | ● | ◐ | ○ | ◐ | Naming layer of Fig. 3.2. Needs: succession semantics for non-agentive subjects, method longevity (§3.5; research item C4) |
| Verifiable Credentials v2.0 | W3C | Claims by issuers about subjects | — | ◐ | ○ | ● | Claims layer. Selective disclosure supports §10.2; needs ledger beneath it for ordering and non-suppression |
| X.509 / PKI | IETF/ITU | Server & org certificates | ● | ◐ | ○ | ◐ | Mature tooling; CA hierarchy reintroduces central-registry risk (§1.5); CRL semantics poor over decades |
| IEC 61406 (Identification Link) | IEC | Machine-readable ID links on products | ● | ◐ | ○ | ○ | Locator, not proof (§3.6); useful as the QR "locate cheaply" layer |
| GS1 EPC/SGTIN + EPCIS | GS1 | Supply-chain serialization & events | ● | ◐ | ○ | ◐ | Event vocabulary (EPCIS) is the nearest existing analog to Ch. 5; no binding, mutable repositories |
| IEEE 2418.x (blockchain frameworks) | IEEE | DLT application frameworks | — | — | — | ◐ | Framework guidance; no per-unit binding content |
| ISO/TC 307 outputs | ISO | DLT terminology, governance, interop | — | — | — | ◐ | Venue for S1/S2 standardization (§14.3) rather than a usable scheme today |

● = provided, ◐ = partial, ○ = absent, — = not applicable.

## B.2 Binding mechanisms (reference summary of Chapters 3 and 6) {.unnumbered}

| Mechanism | R1 entropy | R2 stable subset | R3 forgery asymmetry | R4 challengeable | R5 evolution-checkable | R6 field-feasible | Asset classes |
|---|:-:|:-:|:-:|:-:|:-:|:-:|---|
| Printed serial / QR | ○ | ◐ | ○ | ○ | ○ | ● | Locator only, all classes |
| RFID/NFC tag | ○ | ◐ | ○ | ◐ | ○ | ● | Logistics convenience |
| Secure element key (TPM-class) | ● | ● | ● | ● | — | ● | Inverters, BMS, meters, controllers |
| PUF-derived key | ● | ◐ (aging drift) | ● | ● | — | ◐ | Cost-sensitive electronics |
| EL structural fingerprint | ● | ◐ (crack evolution) | ● | ◐ | ● | ● | PV modules — routine tier |
| Structural defect map (Ch. 6) | ● | ◐→● (M1 open) | ● | ● | ● | ◐ (M3 open) | PV modules — high-assurance tier |
| Impedance/formation signature | ◐ | ○–◐ | ◐ | ◐ | ◐ | ◐ | Battery cells — open problem M4 |
| Composite ply/resin signature + embedded tag | ● | ● | ● | ◐ | ● | ● | Wind blades, large composites |

## B.3 Regulatory record regimes (engineering view) {.unnumbered}

| Regime | Jurisdiction / status | Per-unit? | Lifecycle events? | Verifiability mechanism | Projection from Ch. 5 schema |
|---|---|:-:|:-:|---|---|
| Battery passport (Reg. 2023/1542, Annex XIII) | EU — obligations from 2027 | ● | ● (incl. repurposing) | Self-declared + audit; **no binding mandated** | Direct (§12.2): registration, SoH condition records, repurposing pair, recycle mass balance |
| ESPR DPP delegated acts | EU — in progress; PV a named candidate | ● (expected) | ◐ | Undefined at time of writing | Read-side mapping layer (§10.4); S4 gap |
| Guarantees of origin (Dir. 2018/2001) | EU — live | ○ (per MWh) | ○ | Registry-based | Equipment-truth layer interface (§10.4) |
| US state RECs / tracking (WREGIS etc.) | US — live | ○ (per MWh) | ○ | Registry-based | Same interface pattern |
| UFLPA supply-chain evidence | US — live | ◐ (shipment-level) | ○ | Documentary | Provenance VCs from `EVT_REGISTER` + BOM refs |
| India e-waste rules (2022) + REC | India — live | ◐ (EPR aggregate) | ○ | Declaratory | Recycle-event aggregates (§10.2-4) |
| IEEE 1547 / grid codes | US/EU/India — live | ● (settings per device) | ◐ (config changes) | Paper certificates today | `EVT_CONFIG_CHANGE` class (§12.4) |

## B.4 Reading the tables together {.unnumbered}

Three summary observations, stated once here rather than repeated in the chapters.
First, no existing standard spans more than two layers of the Figure 3.2 stack:
the W3C pair covers naming and claims, GS1 covers events without binding or
immutability, secure elements cover binding without naming — composition is not
optional, it is the architecture. Second, the binding rows show the pattern the
book's research agenda targets: every passive mechanism is strong exactly where
its R2 or R6 entry is the open problem (M1, M3, M4), which is why Chapter 6's
supersession and tiering exist. Third, the regulatory column B.3 shows demand
arriving ahead of mechanism — passports mandate records with no mandated binding
or ledger, which is both the adoption opening of Section 14.4 and the risk that
self-declared passports entrench before verifiable ones ship. Standards gap S3
(binding templates and thresholds, Table 14.1) has no row in B.1 because nothing
exists to tabulate; that absence is this appendix's most important entry.

\newpage
