# Preface {.unnumbered}

This book began with a mundane frustration. In 2022 I was asked to review the technical
file for a batch of photovoltaic modules that a buyer suspected were not what the
paperwork claimed. The flash-test reports were plausible. The serial numbers matched the
labels. The factory inspection certificate carried the right stamps. And yet nobody in
the transaction — not the buyer, not the insurer, not the engineer who would eventually
sign the commissioning certificate — could establish with any confidence that the
modules on the pallets were the modules described in the documents. Every piece of
evidence was a document *about* the asset, produced by a party with something to gain,
and none of it was bound to the physical object in a way that would survive a motivated
forger with a label printer.

That gap — between the physical asset and the records that claim to describe it — is
the subject of this book. It is an old problem. Provenance fraud predates electricity,
let alone photovoltaics. But three things have changed recently, and their intersection
is what makes the problem newly tractable and newly urgent.

First, distributed energy assets have become numerous, mobile, and traded. A utility
transformer stays where it is installed for forty years and everyone knows where it is.
A solar module is manufactured on one continent, installed on another, and increasingly
resold, redeployed, or recycled on a third. Batteries move from vehicles into
stationary storage. The asset population that needs identity has grown from thousands
of large, stationary machines to hundreds of millions of small, fungible ones.

Second, the value that depends on asset history has grown faster than the assets
themselves. Warranty claims, insurance underwriting, secondary-market pricing, carbon
and renewable-energy-certificate accounting, and the emerging digital product passport
regulations in the European Union all rest on statements about where an asset came
from, what condition it is in, and what has happened to it. Those statements are only
as good as the records behind them.

Third, the technical components of a solution have matured separately and now need to
be assembled. Append-only distributed ledgers give us records that no single party can
quietly rewrite. Hardware roots of trust give us cryptographic keys that are physically
bound to a device. Decentralized identifier standards give us a way to name things
without a central registrar. And — the part of this story that is my own research
contribution — high-resolution defect characterization gives us a way to fingerprint
the physical structure of a device, so that the identity record is anchored not just to
a key in a chip but to measurable properties of the object itself.

That last piece is where this book departs from the existing literature. A portion of
the approach described in Chapters 6 and 11 — the binding of structural
defect-mapping data derived from quantum-limited and classical characterization
modalities to an immutable identity record, and the verification workflow built on
that binding — is the subject of a patent application I filed before beginning this
manuscript. I want to be straightforward about what that means for the reader. The
book explains the ideas fully; a monograph that withheld its central mechanism would
not be worth writing. It does not disclose anything beyond what the application itself
discloses, and it does not depend on the patent being granted. Where a design choice in
the book reflects a claim in the application, I say so, and I have tried to present the
surrounding material — threat models, lifecycle schemas, consensus trade-offs,
regulatory interfaces — in a way that is useful to a reader who adopts an entirely
different integrity-verification mechanism.

A note on what this book is not. It is not a blockchain primer; Chapter 2 covers only
what the remaining chapters require, and readers who want a systematic treatment of
distributed ledgers should look elsewhere. It is not a survey of energy-trading
applications of blockchain — peer-to-peer energy markets, tokenized electricity, and
similar schemes appear only where they touch asset identity. And it is not an advocacy
document. Distributed ledgers are one tool among several for the problems treated here,
and there are deployments — I discuss them explicitly in Chapters 4 and 13 — where a
conventional signed database is the better engineering answer. My aim is that a reader
who finishes this book can make that judgment for their own system, not that they reach
a predetermined conclusion.

The book is organized in four parts. Part I establishes the problem and the necessary
background: why asset identity fails today, what the ledger machinery offers, and how
identity models built for people and organizations must be adapted for hardware.
Part II is the architectural core: the identity layer, the lifecycle event model, the
defect-mapping and integrity-verification mechanism, and the scalability analysis for
fleet-sized deployments. Part III treats security and trust — the threat model,
the post-quantum question that thirty-year asset lifetimes force on us, and the
regulatory and privacy interfaces. Part IV applies the framework: a worked pilot
architecture for solar, the extension to wind and storage, the economics, and the open
problems.

Readers can take different paths through it. An engineer designing a system should
read Parts I and II in order, then Chapter 8, and treat the rest as reference. A
policy or market reader can move from Chapter 1 directly to Chapters 10 and 13. A
researcher looking for problems will find Chapter 14 written for them, but the honest
answer is that the open problems are scattered through every chapter, flagged where
they occur.

I have accumulated debts in writing this. Colleagues who reviewed draft chapters,
the practitioners who shared field experience of counterfeit components and warranty
disputes on condition of anonymity, and the anonymous proposal reviewers whose
skepticism improved the structure of Part III — all have my thanks. Errors that remain
are mine.

Nagnath Savant  
Pune, Maharashtra, India

\newpage
