# Figure 3.1

**A taxonomy of binding mechanisms for physical assets. The right-hand branch — passive structural fingerprints — is where Chapter 6's contribution sits.**

Source chapter: `ch03-physical-asset-identity-models.md`

![Figure 3.1](figure-3-1.png)

## Mermaid source

```mermaid
flowchart TB
    ROOT[Binding mechanisms] --> ART[Artifact-based:<br>labels, tags, seals]
    ROOT --> ACT[Active cryptographic:<br>device holds a secret]
    ROOT --> PAS[Passive structural:<br>device IS the credential]
    ART --> ART1[Barcode / QR serials]
    ART --> ART2[RFID / NFC tags]
    ART --> ART3[Tamper-evident seals]
    ACT --> ACT1[Secure element /<br>TPM device keys]
    ACT --> ACT2[PUF-derived keys]
    PAS --> PAS1[Optical fingerprints:<br>EL crack patterns,<br>surface texture]
    PAS --> PAS2[Electrical signatures:<br>dark I–V, capacitance]
    PAS --> PAS3[Quantum-sensed<br>defect maps — Ch. 6]
    style ART fill:#f3d9d3,stroke:#9c4a3c
    style ACT fill:#dbe9f6,stroke:#2c5f8a
    style PAS fill:#d9ead9,stroke:#3c7a3c
```
