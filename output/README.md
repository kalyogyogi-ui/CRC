# Manuscript Output Bundle

Generated exports for **Blockchain-Based Identity and Provenance for Distributed Energy Assets**.

## Build

From the repository root:

```sh
make output          # everything below
make zip             # also creates manuscript-exports.zip at repo root
make list-outputs    # list generated files with sizes
```

## Directory layout

```
output/
├── docx/
│   ├── complete/
│   │   └── manuscript-complete.docx   ← full book
│   ├── chapters/
│   │   ├── ch01-the-asset-identity-problem.docx
│   │   ├── … (ch02–ch13)
│   │   └── ch14-future-directions.docx
│   ├── front-matter/                  ← 6 files
│   └── back-matter/                   ← 5 files
└── markdown/                          ← mirror of manuscript/ sources
```

## Source of truth

Edit files in `manuscript/`, then run `make output` to refresh this tree.
