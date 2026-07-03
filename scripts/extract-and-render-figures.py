#!/usr/bin/env python3
"""Extract Mermaid figures from manuscript chapters and render to PNG/SVG."""

import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
MANUSCRIPT = ROOT / "manuscript"
OUTPUT = ROOT / "output" / "figures"
MMDC = ROOT / "node_modules" / ".bin" / "mmdc"

CHAPTER_FILES = sorted(
    list((MANUSCRIPT / "01-part-i-foundations").glob("ch*.md"))
    + list((MANUSCRIPT / "02-part-ii-architecture").glob("ch*.md"))
    + list((MANUSCRIPT / "03-part-iii-security-and-trust").glob("ch*.md"))
    + list((MANUSCRIPT / "04-part-iv-application-and-deployment").glob("ch*.md"))
)

FIGURE_CAPTION_RE = re.compile(
    r"\*\*Figure\s+(\d+\.\d+)\*\*\s+(.+?)(?=\n\n```mermaid|\Z)",
    re.DOTALL,
)
MERMAID_RE = re.compile(r"```mermaid\n(.*?)```", re.DOTALL)


def slugify(text: str) -> str:
    text = text.lower().strip()
    text = re.sub(r"[^a-z0-9]+", "-", text)
    return text.strip("-")[:60]


def extract_figures(md_path: Path) -> list[dict]:
    content = md_path.read_text(encoding="utf-8")
    captions = {
        m.group(1): " ".join(m.group(2).split())
        for m in FIGURE_CAPTION_RE.finditer(content)
    }
    figures = []
    for i, m in enumerate(MERMAID_RE.finditer(content), start=1):
        mermaid = m.group(1).strip()
        # Find nearest preceding caption by position
        preceding = content[: m.start()]
        cap_matches = list(FIGURE_CAPTION_RE.finditer(preceding))
        if cap_matches:
            fig_id = cap_matches[-1].group(1)
            caption = captions.get(fig_id, cap_matches[-1].group(2).strip())
        else:
            fig_id = f"unknown-{i}"
            caption = f"Figure from {md_path.name}"
        figures.append(
            {
                "id": fig_id,
                "caption": caption,
                "mermaid": mermaid,
                "chapter_file": md_path.name,
            }
        )
    return figures


def sanitize_for_render(mermaid_src: str) -> str:
    """Minimal fixes so strict Mermaid CLI parses manuscript diagrams."""
    lines = []
    in_sequence = mermaid_src.strip().startswith("sequenceDiagram")
    for line in mermaid_src.splitlines():
        if in_sequence and ("->>" in line or "-->>" in line):
            # Semicolons and := break sequence-diagram message parsing
            if ": " in line:
                head, msg = line.split(": ", 1)
                msg = msg.replace(":=", "=").replace(";", ",")
                line = f"{head}: {msg}"
        lines.append(line)
    return "\n".join(lines)


def render_mermaid(mermaid_src: str, out_png: Path, out_svg: Path) -> None:
    render_src = sanitize_for_render(mermaid_src)
    mmd_path = out_png.with_suffix(".mmd")
    mmd_path.write_text(mermaid_src + "\n", encoding="utf-8")
    render_path = out_png.with_suffix(".render.mmd")
    render_path.write_text(render_src + "\n", encoding="utf-8")
    for fmt, out in [("png", out_png), ("svg", out_svg)]:
        cmd = [
            str(MMDC),
            "-i",
            str(render_path),
            "-o",
            str(out),
            "-b",
            "white",
            "-w",
            "2400",
            "-H",
            "1800",
            "-s",
            "2",
        ]
        if fmt == "svg":
            cmd = [str(MMDC), "-i", str(render_path), "-o", str(out), "-b", "white"]
        subprocess.run(cmd, check=True, capture_output=True, text=True)


def main() -> int:
    if not MMDC.exists():
        print("mmdc not found; run: npm install @mermaid-js/mermaid-cli", file=sys.stderr)
        return 1

    OUTPUT.mkdir(parents=True, exist_ok=True)
    index_lines = [
        "# Manuscript Figures — Chapter-wise Export",
        "",
        "Rendered from Mermaid source in the manuscript. Each figure includes:",
        "- `.mmd` — editable Mermaid source (as in the book)",
        "- `.png` — high-resolution raster (2400px width, scale 2)",
        "- `.svg` — vector for print/redraw",
        "- `.md` — caption card with embedded image",
        "",
        "---",
        "",
    ]

    total = 0
    for ch_path in CHAPTER_FILES:
        ch_slug = ch_path.stem  # e.g. ch01-the-asset-identity-problem
        ch_out = OUTPUT / ch_slug
        ch_out.mkdir(parents=True, exist_ok=True)
        figures = extract_figures(ch_path)
        if not figures:
            continue

        index_lines.append(f"## {ch_slug}")
        index_lines.append("")

        for fig in figures:
            fig_id = fig["id"]
            base = f"figure-{fig_id.replace('.', '-')}"
            mmd_file = ch_out / f"{base}.mmd"
            png_file = ch_out / f"{base}.png"
            svg_file = ch_out / f"{base}.svg"
            md_file = ch_out / f"{base}.md"

            mmd_file.write_text(fig["mermaid"] + "\n", encoding="utf-8")
            try:
                render_mermaid(fig["mermaid"], png_file, svg_file)
            except subprocess.CalledProcessError as e:
                print(f"WARN: failed {fig_id} in {ch_slug}: {e.stderr}", file=sys.stderr)
                continue

            caption = fig["caption"]
            md_file.write_text(
                f"# Figure {fig_id}\n\n"
                f"**{caption}**\n\n"
                f"Source chapter: `{fig['chapter_file']}`\n\n"
                f"![Figure {fig_id}]({base}.png)\n\n"
                f"## Mermaid source\n\n"
                f"```mermaid\n{fig['mermaid']}\n```\n",
                encoding="utf-8",
            )
            index_lines.append(
                f"- **Figure {fig_id}** — {caption}  \n"
                f"  `{ch_slug}/{base}.png` · `{ch_slug}/{base}.svg` · `{ch_slug}/{base}.mmd`"
            )
            total += 1
        index_lines.append("")

    (OUTPUT / "README.md").write_text("\n".join(index_lines), encoding="utf-8")
    print(f"Rendered {total} figures to {OUTPUT}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
