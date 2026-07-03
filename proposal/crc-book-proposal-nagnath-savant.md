# BOOK PUBLISHING PROPOSAL

**Submitted to:** CRC Press / Taylor & Francis  
**Proposed series:** Renewable and Sustainable Energy Developments  
**Date:** July 2026  
**Proposal contact:** Nagnath Savant · nagnathsavant@gmail.com · +91 9822548376 · Pune, Maharashtra, India

---

## 1. Author / Editor Information

**Proposed author (single author):**

**Nagnath Savant**  
Blockchain Researcher and Technical Author  
Pune, Maharashtra, India  
nagnathsavant@gmail.com · +91 9822548376  
LinkedIn: Nagnath Savant

**Affiliation and background.** I am an independent blockchain researcher and technical author with nine years of work in distributed ledger systems, cryptographic protocols, and their application to infrastructure problems. From 2017 to 2023 I served as Assistant Professor in Electronics and Telecommunication Engineering at KJ's Educational Institute, KPC Pandharpur, where I taught embedded systems, telecommunications, and signal processing and mentored more than one hundred undergraduate projects. Since 2017 I have maintained an independent research and publishing programme alongside teaching and, subsequently, full-time authorship.

**Relevant publications and books.** I am under contract or active proposal with major publishers on blockchain fundamentals: *Blockchain Unlocked: Fundamentals to Real World* (Oxford University Press, forthcoming) and *Blockchain Foundations: Mastering Cryptographic Primitives, Consensus Mechanisms, and the Mathematics Behind Distributed Ledger Technology* (Apress, in progress). I am also the author of *The Post-Quantum Cryptocurrency Revolution: Preparing Digital Assets for the Quantum Era* (2025), which treats NIST post-quantum standards and migration planning for long-lived cryptographic records — a thread this manuscript carries into energy hardware with a twenty- to thirty-year service-life horizon. Earlier peer-reviewed work includes microcontroller-based energy monitoring systems (IJSART, IRJET, 2016). I do not propose to duplicate those books here; Chapter 2 supplies only the ledger background this monograph requires, and Chapter 9 applies post-quantum migration specifically to asset-identity records without repeating a general PQC treatise.

**Research and innovation directly underlying this book.** In 2026 I filed a patent-pending application for a system combining structural defect mapping of photovoltaic modules with blockchain-based immutable identity and provenance tracking. Portions of that mechanism are developed in Chapters 6 and 11 and are disclosed in the manuscript at the level of the application itself. I was also selected for the Ideation Phase of the Blockchain India Challenge 2026 for work applying distributed ledger technology to strategic infrastructure.

**Co-authors.** None. This is a single-author monograph with a unified architectural argument. I am solely responsible for the manuscript and available for the full publishing lifecycle described in your guidelines.

**Availability.** I am available to complete any revisions arising from peer review, respond to editorial queries during acceptance checking and copyediting, and support production on the schedule agreed in the publishing contract. I have no teaching commitments that would prevent delivery. I compose in Markdown and LaTeX and can deliver the final manuscript in the format CRC specifies.

**Community standing.** I write for the intersection of energy-systems engineers, blockchain practitioners, and the standards and compliance communities now implementing digital product passports. My prior books address the ledger and cryptography layers; this book addresses a problem I encountered in practice — verifying that physical renewable-energy assets match their documentary records — and extends research I have pursued independently since 2017.

---

## 2. Proposed Title

**Main title:** Blockchain-Based Identity and Provenance for Distributed Energy Assets

**Subtitle:** Immutable Identity, Lifecycle Traceability, and Integrity Verification for Solar and Renewable Infrastructure

**Alternative short title for cataloguing:** *Asset Identity for Distributed Energy Systems*

---

## 3. Book Description (Technical)

Distributed renewable-energy assets — photovoltaic modules, inverters, battery systems, and the components of distributed grids — are manufactured in volume, shipped across borders, installed, resold, repurposed, and recycled. Every stage of that life generates records: flash-test data, commissioning certificates, maintenance logs, warranty claims, insurance surveys, and the emerging digital product passports required under EU regulation. Yet the physical object and the record that claims to describe it are joined today by nothing stronger than a printed label and institutional trust. A buyer acquiring a used solar plant cannot verify that the modules on the roof are the modules in the data room. An insurer pricing fleet risk cannot distinguish documented history from selective documentation. A recycler facing battery-passport requirements cannot trace a pack to its constituent cells with confidence.

This monograph presents a complete engineering architecture for verifiable asset identity: records that name a single physical unit, persist for the asset's service life, bind cryptographically to measurable properties of the object, and carry tamper-evident statements about who said what and when. The design treats distributed ledgers as one component in a larger system — not as a universal solution. A permissioned consortium ledger holds commitments and lifecycle state; large payloads live off-chain under replicated custody; periodic anchoring to public chains supplies immutability that outlives any single institution. Manufacture-time enrollment is the trust root. Decentralized identifiers and verifiable credentials, adapted for hardware rather than persons, supply the naming and attestation layer. A formal lifecycle event schema — from registration through commissioning, maintenance, ownership transfer, and decommissioning — is enforced by smart contracts and corroboration rules that reflect how evidence is actually produced in the field.

The book's central research contribution is structural defect mapping as a passive binding mechanism for photovoltaic modules: fingerprinting the microscopic defect population that manufacturing cannot control, committing those fingerprints to the identity record at enrollment, and building a four-step verification workflow through which downstream parties — buyers, insurers, grid operators, warranty adjudicators — can trust recorded condition history without trusting the custodian who holds it. Quantum-limited magnetometry and established factory characterization modalities (electroluminescence imaging, thermography, I–V testing) are combined in a tiered assurance model whose economics are worked explicitly. The architecture is stress-tested in a formal threat model, extended to post-quantum migration for assets whose records must remain verifiable for decades, and mapped to privacy, governance, and regulatory interfaces in the European Union, United States, and India.

Part IV applies the framework: a composite design walkthrough of a solar identity deployment, extension to wind turbines and battery storage (including EU battery-passport field mapping), an economics chapter that refuses market-size speculation and instead prices specific transactions, and a research agenda tied to open measurement and standardization problems. Two appendices provide illustrative smart-contract samples and comparative tables of identity standards and regulatory regimes.

The manuscript is written for graduate students, researchers, and practising engineers who must decide whether, where, and how to deploy identity infrastructure for energy hardware — not for readers seeking a survey of peer-to-peer energy trading or tokenized electricity markets.

---

## 4. What This Book Does for the Reader (Lay Terms)

Every day, electricity from solar panels and batteries enters the grid through assets whose history is stored in spreadsheets, PDFs, and manufacturer portals that no independent party can fully verify. When a bank finances a solar farm, an insurer underwrites it, or a buyer acquires used equipment, the diligence process relies on documents that a motivated seller could assemble without the assets to match. The cost of that uncertainty appears as warranty disputes, insurance loadings, discounts on secondary markets, and — increasingly — failed compliance with digital product passport regulations.

This book gives the engineer or technical manager a concrete design for fixing that gap. It explains how to issue an identity to a physical module at the factory, record what happens to it through installation and ownership changes, and verify — by measurement, not by trust — that the module in front of you is the module the record describes. It states plainly where blockchains help, where they do not, and what the alternatives are. A reader who finishes the book should be able to evaluate a vendor proposal, draft consortium governance requirements, or scope a pilot deployment without accepting hype in place of architecture.

**Everyday stakes.** When storm damage triggers a warranty claim, the manufacturer and the owner dispute whether the failed modules are the modules originally supplied — a dispute that today turns on paperwork both sides can contest. When repowering projects sell used panels into export markets, buyers price every lot as if it might be salvage mislabelled as premium stock. When the EU requires a battery passport from 2027, manufacturers must trace each pack through its life; the engineering question is not whether to keep records but whether those records are machine-verifiable by third parties. This book addresses that engineering question directly.

---

## 5. Keywords

blockchain; distributed ledger; distributed energy resources; asset identity; provenance; photovoltaic; solar energy; battery storage; digital product passport; decentralized identifiers; verifiable credentials; lifecycle traceability; structural defect mapping; electroluminescence; post-quantum cryptography; threat modeling; consortium ledger; smart contracts; renewable energy certificates; supply chain integrity; warranty fraud; secondary market; Internet of Things; energy storage; wind energy

---

## 6. Table of Contents

**Front Matter**  
Foreword (invited)  
Preface  
About the Author  
List of Abbreviations  
List of Figures and Tables  

**Part I — Foundations**  
Chapter 1. The Asset Identity Problem in Distributed Energy Systems  
Chapter 2. Blockchain Fundamentals for a Non-Blockchain-Native Reader  
Chapter 3. Physical Asset Identity Models  

**Part II — Architecture**  
Chapter 4. Designing an Immutable Identity Layer for Energy Hardware  
Chapter 5. Lifecycle Event Modeling — Manufacture to Decommissioning  
Chapter 6. Structural Defect Mapping and Integrity Verification  
Chapter 7. Consensus and Scalability for High-Volume Asset Fleets  

**Part III — Security and Trust**  
Chapter 8. Threat Model — Spoofing, Cloning, and Data Manipulation  
Chapter 9. Post-Quantum Considerations for Long-Lived Infrastructure  
Chapter 10. Privacy, Data Governance, and Regulatory Interfaces  

**Part IV — Application and Deployment**  
Chapter 11. Case Study — Solar Asset Identity Pilot Architecture  
Chapter 12. Extending the Model — Wind, Storage, and Broader IoT Renewable Assets  
Chapter 13. Economic and Market Implications  
Chapter 14. Future Directions and Open Research Problems  

**Back Matter**  
Glossary  
Appendix A: Smart Contract Code Samples (illustrative)  
Appendix B: Comparative Table of Identity Standards  
References  
Index  

---

## 7. Chapter Abstracts and Keywords

### Chapter 1. The Asset Identity Problem in Distributed Energy Systems
**Abstract.** Defines asset identity in four properties — uniqueness, persistence, bindability, and attributability — and shows why serial numbers, paper certificates, and vendor databases fail for distributed energy hardware. Works through acquisition and fleet-management vignettes, quantifies consequences (counterfeiting, warranty fraud, undocumented degradation, secondary-market adverse selection), and maps the book's scope and chapter dependencies.  
**Keywords:** asset identity; distributed energy resources; provenance; lemons market; warranty; secondary market

### Chapter 2. Blockchain Fundamentals for a Non-Blockchain-Native Reader
**Abstract.** Supplies the minimum distributed-ledger background required for the remainder: append-only structure, Merkle commitments, consensus families (PoW, PoS, BFT) assessed for identity workloads rather than payments, permissioning decisions, smart contracts, on-chain versus off-chain partitioning, and an explicit checklist of what ledger machinery does not guarantee. Deliberately concise; not a substitute for a general blockchain textbook.  
**Keywords:** distributed ledger; consensus; Merkle tree; smart contracts; permissioned blockchain

### Chapter 3. Physical Asset Identity Models
**Abstract.** Adapts digital-twin concepts, hardware roots of trust, decentralized identifiers, and verifiable credentials to physical infrastructure. Compares active binding (device keys, secure elements) and passive binding (structural fingerprints), introduces a verification escalation ladder, and positions structural defect mapping as the high-assurance passive mechanism developed in Chapter 6.  
**Keywords:** digital twin; DID; verifiable credentials; active binding; passive binding; secure element

### Chapter 4. Designing an Immutable Identity Layer for Energy Hardware
**Abstract.** Designs the identity layer from workload numbers: on-chain/off-chain partition, manufacture-time issuance and retroactive enrollment, public-chain anchoring, oracle design with instrument trust grades, and deployment topology for fleet-scale operation. Includes worked negatives where a conventional signed database is the honest answer.  
**Keywords:** identity layer; oracle; anchoring; manufacture-time issuance; off-chain storage

### Chapter 5. Lifecycle Event Modeling — Manufacture to Decommissioning
**Abstract.** Specifies a formal event vocabulary, lifecycle state machine, corroboration classes, evidence directed acyclic graph, and smart-contract enforcement for transitions from registration through decommissioning and recycling. Includes a complete twenty-six-year module biography and integrity guarantees by stage.  
**Keywords:** lifecycle events; state machine; event schema; commissioning; decommissioning

### Chapter 6. Structural Defect Mapping and Integrity Verification
**Abstract.** Anchor chapter. Develops passive binding through structural defect mapping: why defect structure satisfies per-unit uniqueness and forgery-cost requirements; instrument toolbox (quantum-limited magnetometry and classical EL/thermography); enrollment pipeline; binding construction; four-step verification workflow with sampling arithmetic; tier economics. Section 6.0 fixes terminology between quantum-limited sensing and established semiconductor characterization. Portions subject to author's pending patent application.  
**Keywords:** structural defect mapping; electroluminescence; NV magnetometry; integrity verification; enrollment

### Chapter 7. Consensus and Scalability for High-Volume Asset Fleets
**Abstract.** Evaluates consensus and scaling techniques against asset-identity event loads rather than payment throughput. Merkle batching, epochal checkpointing, committee sizing, and a worked lifetime cost model for a 250 MW plant demonstrate that ledger capacity is not the binding constraint; enrollment integrity and governance are.  
**Keywords:** scalability; BFT; Merkle batching; fleet deployment; cost model

### Chapter 8. Threat Model — Spoofing, Cloning, and Data Manipulation
**Abstract.** Organizes adversaries, attack families, and defense patterns across the physical, oracle, ledger, and governance layers. Includes attack decision trees, a residual-risk register, and red-team practices. Written as a standalone security reference for physical-asset ledger systems.  
**Keywords:** threat model; spoofing; cloning; oracle manipulation; residual risk

### Chapter 9. Post-Quantum Considerations for Long-Lived Infrastructure
**Abstract.** Applies Mosca's inequality and NIST post-quantum standards to identity records that must survive twenty to forty years. Assigns ML-DSA and SLH-DSA by architectural role, specifies migration patterns (re-anchoring, key supersession, digest upsizing), and cross-references the author's general post-quantum migration work without duplicating it.  
**Keywords:** post-quantum cryptography; ML-DSA; long-lived records; cryptographic migration

### Chapter 10. Privacy, Data Governance, and Regulatory Interfaces
**Abstract.** Three-zone privacy architecture; consortium governance decision table; interfaces to EU Battery Regulation, ESPR/digital product passports, REC markets, grid codes, GDPR, US supply-chain integrity rules, and India's DPDP Act. Engineering requirements only — not a legal treatise.  
**Keywords:** privacy; governance; digital product passport; GDPR; battery regulation

### Chapter 11. Case Study — Solar Asset Identity Pilot Architecture
**Abstract.** Composite design walkthrough of a 50 MW plant instantiating the full stack: consortium participants, factory enrollment, smart-contract suite, five operational scenarios, illustrative results with evidentiary classes, failures and lessons, and open engineering problems. Explicitly labeled as a replicable template rather than a single commercial audit report.  
**Keywords:** case study; solar pilot; deployment; consortium; design walkthrough

### Chapter 12. Extending the Model — Wind, Storage, and Broader IoT Renewable Assets
**Abstract.** Maps the framework onto battery storage (EU passport field groups), wind-turbine component provenance, and renewable-adjacent IoT. States where the base architecture applies with minimal change and where cell-level identity, firmware binding, or commodity balance-of-system items require extension.  
**Keywords:** battery passport; wind turbine; second life; interoperability; IoT

### Chapter 13. Economic and Market Implications
**Abstract.** Microeconomic analysis of information rents in secondary equipment markets, insurance, project finance, and passport compliance. Refuses aggregate market projections and token economics; bounds claims against next-best verification costs. Adoption sequencing and incidence analysis identify insurers and lenders as natural first movers.  
**Keywords:** economics; lemons market; insurance; project finance; adoption

### Chapter 14. Future Directions and Open Research Problems
**Abstract.** Research agenda organized by measurement, cryptography, and standardization workstreams; integration outlook with digital product passport initiatives; decade map of milestones; open-artifact policy recommendation; role-specific actions for manufacturers, owners, insurers, regulators, and researchers.  
**Keywords:** research agenda; standardization; digital product passport; open problems

---

## 8. Length, Schedule, and Manuscript Status

| Item | Detail |
|------|--------|
| **Current status** | Complete first draft (all fourteen chapters, front matter, back matter, two appendices, glossary, reference list, index term list) |
| **Word count** | Approximately 116,000 words (references and back matter included, per your guidelines) |
| **Estimated typeset pages** | 280–300 pages at CRC monograph density |
| **Chapters** | 14 numbered chapters in 4 parts |
| **Proposed delivery** | Final manuscript within **90 days** of signed contract, subject to revision in response to peer review of this proposal and editorial acceptance checking |
| **Foreword** | To be commissioned from a senior figure in renewable asset management or digital product passport standardization upon contract |

I am prepared to revise the draft in response to reviewer comments before formal acceptance. Sample chapters (1, 6, and 8) and the full draft are available on request.

---

## 9. Illustrations

| Type | Count (draft) | Notes |
|------|---------------|-------|
| Figures | 20 | Architecture diagrams, state machines, data-flow charts, verification workflows. Draft rendered as Mermaid source in manuscript; prepared to supply redrawn vector figures or cooperate with CRC art department |
| Tables | 42 | Numbered per chapter; comparative matrices, workload models, threat registers, regulatory summaries |
| Code listings | 4 blocks | Appendix A: illustrative Solidity and pseudocode (original to this book) |

No colour is required for comprehension. All figures are integral to the argument; none is decorative.

---

## 10. Advanced Features and Composition

| Feature | Present? | Notes |
|---------|----------|-------|
| Equations | Moderate | Sampling arithmetic, cost models, Mosca's inequality; standard mathematical notation |
| Special characters | Minimal | Standard Unicode; no exotic scripts |
| Code | Yes | Appendix A smart-contract samples; syntax-highlighted in source |
| **LaTeX** | **Optional** | I am proficient in LaTeX (per my CV) and compose the draft in Markdown with Pandoc. I can deliver final manuscript in **Microsoft Word** (preferred for editorial workflow) or **LaTeX** per CRC's requirement for this series. No strong preference — I will follow series convention. |
| **Third-party material** | Limited | Figures are original. Citations are to published standards, regulations, and literature. No extended reproduction of third-party text. Permission will be secured for any previously published material of my own if required. Patent-pending material is my own disclosure at application level. |

---

## 11. Market Breadth and International Appeal

**Breadth.** The book sits at the intersection of renewable energy engineering, supply-chain integrity, distributed systems, and emerging product-passport regulation — a cross-disciplinary market that no single existing title serves at monograph depth.

| Segment | Estimated demand driver |
|---------|-------------------------|
| University libraries | Graduate courses in energy systems, cybersecurity, and sustainable infrastructure |
| R&D engineers at OEMs, EPCs, asset owners | Passport compliance, enrollment integration, pilot architecture |
| Insurers and project finance | Diligence cost reduction, verifiable fleet history |
| Standards bodies and regulators | ISO TC 307, CEN-CENELEC JTC 24, IEEE P2418.x, EU passport implementers |
| National labs and metrology | Structural binding metrology campaign (Chapter 14) |

**International appeal.** Regulatory drivers are global: EU Battery Regulation and ESPR (2027+), US UFLPA supply-chain scrutiny, India's DPDP Act and domestic solar manufacturing scale-up, and secondary PV markets in Africa, South Asia, and Latin America. The architecture is jurisdiction-aware (Chapter 10) but not jurisdiction-locked. English is the working language of the relevant standards communities.

**Geographic sales expectation.** Primary: North America, Europe, India, East Asia (manufacturing and deployment). Secondary: Australia, Middle East, Africa (solar deployment and used-equipment trade).

---

## 12. Audience

**Primary audience.** Graduate students, researchers, and practising engineers in renewable energy systems, power engineering, and blockchain-for-infrastructure — readers who must design, evaluate, or procure asset-identity systems.

**Secondary audiences.**  
- Insurance and project-finance technical staff underwriting renewable portfolios  
- Compliance officers implementing digital product passports  
- Standards participants in blockchain, energy, and traceability working groups  
- Policy analysts needing engineering-level understanding without legal advice  

**Level.** Graduate/researcher/practitioner. Senior undergraduates with systems and cryptography prerequisites can follow Parts I and II with Chapter 2 as bridge.

**Not intended for.** General trade readers, cryptocurrency investors, or peer-to-peer energy-trading implementers (treated only where they intersect identity).

---

## 13. Relevant Courses and Professional Organizations

**Graduate courses (potential adoption as reference monograph, not primary textbook):**  
- Blockchain and Distributed Systems for Infrastructure  
- Renewable Energy Systems Engineering  
- Cyber-Physical Security for the Grid  
- Supply Chain Traceability and Digital Product Passports  
- Post-Quantum Cryptography for Engineers  

**Professional organizations and communities:**  
- IEEE Power & Energy Society; IEEE Blockchain Initiative  
- IEA Photovoltaic Power Systems Programme (IEA-PVPS) Task 13  
- International Electrotechnical Commission (IEC TC 82 solar; TC 21/23 battery)  
- Energy Web / green proofs community  
- Blockchain India Challenge network  
- CEN-CENELEC JTC 24 (Digital Product Passport)  

**Workshops and short courses.** Material supports a one-week professional short course for asset managers and passport implementation teams (Chapters 1, 4, 6, 10, 11).

---

## 14. Competing and Related Titles

| Title | Author / publisher | How this book differs |
|-------|-------------------|------------------------|
| *Blockchain-based Peer-to-Peer Transactions in Energy Systems* | Nwulu & Damisa, IOP, 2023 | Focuses on P2P trading, auctions, and EV charging; does not treat physical asset identity, manufacture-time binding, or defect-map verification |
| *IEEE 2418.5-2025 Guide for Blockchain in Power and Energy Systems* | IEEE, 2025 | Reference guide (~86 pages); framework and use cases, not implementable lifecycle architecture or threat model at monograph depth |
| *Smart Cyber-Physical Power Systems* (Vols. 1–2) | Wiley–IEEE Press, 2025 | Broad emerging-technology survey (AI, blockchain, IoT, quantum); blockchain is one topic among many, without asset-identity engineering |
| *Blockchain Unlocked: Fundamentals to Real World* | Savant, Oxford UP, forthcoming | Author's own general blockchain treatment; does not address physical asset binding or energy-specific lifecycle schema |
| *Blockchain Foundations* | Savant, Apress, in progress | Cryptographic and mathematical foundations; prerequisite reading, not application to energy hardware |
| *The Post-Quantum Cryptocurrency Revolution* | Savant, self-published, 2025 | Financial digital assets; Chapter 9 here is the asset-infrastructure-specific application without repeating general migration theory |
| Journal literature (DID/VC for RECs; Energy Web Green Proofs) | Various | Paper-length architectures; no full-stack treatment from manufacture through economics and regulation |

**Gap this book fills.** To my knowledge, no existing monograph presents a complete, implementable architecture for cryptographically verifiable identity of renewable energy *hardware* — from structural binding and lifecycle event schemas through threat modeling, post-quantum planning, passport alignment, and worked deployment — in a single authorial argument.

---

## 15. Five Marketable Features

1. **First monograph-length treatment** of blockchain-based identity for physical distributed energy assets, not energy trading or certificate markets alone.  
2. **Patent-pending structural binding mechanism** (Chapter 6) with honest treatment of instrument limits, tier economics, and verification sampling — the book's differentiated technical core.  
3. **Formal lifecycle event schema** with illustrative smart-contract samples (Appendix A) and a composite solar deployment walkthrough (Chapter 11) usable as a pilot template.  
4. **Timely regulatory alignment** with EU Battery Regulation, ESPR/digital product passports, and cross-jurisdictional privacy interfaces (Chapter 10) — engineering requirements, not legal commentary.  
5. **Post-quantum chapter for thirty-year assets** (Chapter 9) — a requirement largely absent from financial-blockchain literature but essential for solar and storage infrastructure.  

---

## 16. Third-Party Material and Permissions

- All chapter text, tables, and appendix code samples are original to this manuscript.  
- Figures are authored as Mermaid source and will be redrawn; no third-party figure reproduction.  
- Bibliography cites published standards, regulations, and academic literature under fair scholarly practice.  
- I will secure written permission for any reuse of my own previously published material if CRC requires it.  
- Patent-pending content (Chapters 6 and 11) is disclosed at the level of the filed application; I am the applicant and can grant publication rights.  

---

## 17. Suggested Reviewers / Referees

*(Names offered as categories; specific individuals to be confirmed with commissioning editor to avoid conflicts.)*

1. **Renewable asset management / technical diligence** — senior engineer or investment director with portfolio-scale PV acquisition experience (validates Chapter 1 and 13).  
2. **Photovoltaic quality and characterization** — researcher or standards participant in IEA-PVPS Task 13 or IEC TC 82 (validates Chapters 6 and 11 measurement claims).  
3. **Blockchain in energy systems** — contributor to IEEE P2418.x or published work on DLT for grid/REC applications, *not* author of a directly competing monograph (validates Chapters 2, 4, 7).  
4. **Digital product passport implementation** — industry or standards participant in EU battery or ESPR passport pilots (validates Chapters 10 and 12).  
5. **Security / threat modeling** — academic or industry specialist in hardware security or oracle attacks for cyber-physical systems (validates Chapter 8).  

I request that reviewers with authored competing textbooks in blockchain-for-energy be excluded per your policy.

---

## 18. Open Access and Funding

No funding is currently attached to this project. I am proposing conventional publication under CRC's standard terms. I am open to discussion of open-access options if the commissioning editor identifies a suitable route and funding source. No third-party funder will assert editorial control.

---

## 19. Supporting Material Attached or Available

- [x] This proposal  
- [x] Author CV (Nagnath Savant)  
- [ ] Sample chapters on request: **Chapter 1** (problem), **Chapter 6** (structural defect mapping), **Chapter 8** (threat model)  
- [ ] Complete draft available to reviewers under confidentiality upon editor's arrangement  
- [ ] Foreword invitation letter (to be sent upon contract)  

---

## 20. Author Declaration

I confirm that this proposal is not under consideration with another publisher. I am the sole author of the manuscript, I have the right to propose it, and the technical claims are my own work except where cited. I am prepared to compose the final manuscript in accordance with CRC's author guidelines and the publishing agreement.

**Nagnath Savant**  
July 2026 · Pune, India
