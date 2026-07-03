# Blockchain-Based Identity and Provenance for Distributed Energy Assets

**Immutable Identity, Lifecycle Traceability, and Integrity Verification for Solar and Renewable Infrastructure**

This repository holds the working manuscript of a single-author monograph prepared for
submission to CRC Press (Taylor & Francis). The manuscript is written in Markdown, one
file per chapter, and builds to PDF or DOCX with Pandoc.

## Structure

```
manuscript/
├── 00-front-matter/          Title page, foreword, preface, abbreviations, lists
├── 01-part-i-foundations/    Chapters 1–3
├── 02-part-ii-architecture/  Chapters 4–7
├── 03-part-iii-security-and-trust/   Chapters 8–10
├── 04-part-iv-application-and-deployment/  Chapters 11–14
├── 05-back-matter/           Glossary, appendices, references, index terms
└── metadata.yaml             Pandoc metadata
```

## Conventions

- Figures are drawn as Mermaid diagrams in place, each with a numbered caption
  (`Figure 6.2`, etc.). For production these will be redrawn by the publisher's art
  department; the Mermaid source is the authoritative content.
- Tables are numbered per chapter (`Table 4.1`, etc.) and carry captions above the table,
  following CRC house style.
- Each chapter closes with a summary section and a **References and Further Reading**
  list. Citations refer to real standards, regulations, and published work; entries the
  author must complete before submission are marked with bracketed placeholders.
- Chapter cross-references use chapter and section numbers, not file links, so the text
  survives conversion to the publisher's template.

## Building

Requires `pandoc` (≥ 3.0) and, for PDF output, a LaTeX distribution.

```sh
make output          # full export bundle → output/ (see output/README.md)
make zip             # output/ + manuscript-exports.zip at repo root
make docx            # legacy: manuscript.docx at repo root
make pdf             # manuscript.pdf at repo review
make wordcount
make list-outputs    # list generated DOCX paths and sizes
```

### Export layout (`output/`)

| Path | Contents |
|------|----------|
| `output/docx/complete/manuscript-complete.docx` | Full book |
| `output/docx/chapters/ch01-…ch14-….docx` | One DOCX per chapter (14 files) |
| `output/docx/front-matter/*.docx` | Title, foreword, preface, etc. (6 files) |
| `output/docx/back-matter/*.docx` | Glossary, appendices, references, index (5 files) |
| `output/markdown/` | Mirror of all source `.md` files + `metadata.yaml` |

Source Markdown lives in `manuscript/`; `output/markdown/` is regenerated on each `make output`.

## Status

Complete draft (all 14 chapters, front and back matter). Editorial and technical
review fixes applied: Chapter 6 retitled *Structural Defect Mapping* with
terminology section (Section 6.0); Chapter 11 labeled as composite design
walkthrough with evidentiary classes; sensitivity boxes on cost tables (Chapters
7 and 13); Chapter 14 chapter summary added. Every chapter runs to at least
7,600 words; the full manuscript is approximately 115,000 words.
