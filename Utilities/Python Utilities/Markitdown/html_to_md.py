#!/usr/bin/env python3
"""
tools/html_to_md.py
Convert HTML files to Markdown (sample or full run).
    this: Utilities/Python Utilities/Markitdown/html_to_md.py
Usage:
    python tools/html_to_md.py --source "Visual Mfg Help Files/VM" --dest "Documentation/Help-md" --sample 3

    html files see:  SQL-Projects/Visual Mfg Help Files/VM/
"""
import argparse
import os
import shutil
import sys
from pathlib import Path
from urllib.parse import urljoin, urlparse

# Try Markitdown, then markdownify, then html2text
converter = None
converter_name = None
try:
    import markitdown
    # markitdown package may expose different class names (Markitdown / MarkItDown / MarkitDown)
    cls = getattr(markitdown, 'Markitdown', None) or getattr(markitdown, 'MarkItDown', None) or getattr(markitdown, 'MarkitDown', None)
    if cls is None:
        raise AttributeError('markitdown class not found')
    def _markitdown_converter(html):
        # Try several invocation patterns depending on markitdown version
        # 1) cls(html) -> instance with no-arg method to return markdown
        # 2) cls() -> instance where method accepts html
        # 3) cls(html) itself returns string
        try:
            inst = cls(html)
            # If inst has a zero-arg method returning markdown
            for m in ('to_markdown', 'convert', 'markdown', 'render'):
                if hasattr(inst, m):
                    meth = getattr(inst, m)
                    try:
                        # call without args
                        return meth()
                    except TypeError:
                        # try with html argument
                        try:
                            return meth(html)
                        except Exception:
                            pass
            # If inst is a plain string or has __str__ representation
            if isinstance(inst, str):
                return inst
            return str(inst)
        except TypeError:
            # Try no-arg constructor then call method with html
            try:
                inst = cls()
                for m in ('to_markdown', 'convert', 'markdown', 'render'):
                    if hasattr(inst, m):
                        meth = getattr(inst, m)
                        try:
                            return meth(html)
                        except Exception:
                            continue
            except Exception:
                pass
        # As a last resort, if cls itself is callable and accepts html, call it
        if callable(cls):
            try:
                out = cls(html)
                if isinstance(out, str):
                    return out
                return str(out)
            except Exception:
                pass
        raise AttributeError('markitdown conversion failed')

    converter = _markitdown_converter
    converter_name = "markitdown"
    # Probe quickly to ensure the markitdown variant works; if it fails, trigger fallback
    try:
        _ = converter("<p>test</p>")
    except Exception:
        raise
except Exception:
    try:
        from markdownify import markdownify as md_conv
        converter = lambda html: md_conv(html, heading_style="ATX")
        converter_name = "markdownify"
    except Exception:
        try:
            import html2text
            h = html2text.HTML2Text()
            h.ignore_links = False
            converter = lambda html: h.handle(html)
            converter_name = "html2text"
        except Exception:
            print("No suitable HTML->Markdown converter installed. Install 'markitdown' or 'markdownify' or 'html2text'.")
            sys.exit(1)

print(f"Using converter: {converter_name}")

def copy_local_asset(src_path: Path, dest_path: Path):
    dest_path.parent.mkdir(parents=True, exist_ok=True)
    try:
        shutil.copy2(src_path, dest_path)
    except Exception as e:
        print(f"Warning: failed to copy asset {src_path} -> {dest_path}: {e}")

def html_to_md_file(src_file: Path, src_root: Path, dest_root: Path):
    rel = src_file.relative_to(src_root)
    dest_file = dest_root.joinpath(rel).with_suffix('.md')
    dest_file.parent.mkdir(parents=True, exist_ok=True)

    html = src_file.read_text(encoding="utf-8", errors="ignore")
    md = converter(html)

    # Try to copy local image assets referenced in the HTML (simple heuristic)
    # Look for src="..." and src='...' occurrences for local relative paths
    import re
    for m in re.findall(r'src=[\'"]([^\'"]+)[\'"]', html, flags=re.I):
        p = m.strip()
        parsed = urlparse(p)
        if parsed.scheme == "" and not p.startswith("//") and not p.startswith("data:"):
            src_asset = (src_file.parent / p).resolve()
            if src_asset.exists():
                rel_asset_dest = dest_file.parent / Path(p)
                copy_local_asset(src_asset, rel_asset_dest)
                # adjust link in markdown if necessary (leave as-is; relative path preserved)

    dest_file.write_text(md, encoding="utf-8")
    return dest_file

def gather_html_files(src_root: Path):
    return sorted([p for p in src_root.rglob("*.htm*") if p.is_file()])

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--source", "-s", required=True, help="Source folder containing HTML files")
    ap.add_argument("--dest", "-d", required=True, help="Destination folder for Markdown output")
    ap.add_argument("--sample", type=int, default=0, help="If >0, only convert this many files (for preview)")
    ap.add_argument("--overwrite", action="store_true", help="Overwrite existing .md files")
    args = ap.parse_args()

    src_root = Path(args.source).resolve()
    dest_root = Path(args.dest).resolve()

    if not src_root.exists():
        print("Source folder does not exist:", src_root)
        sys.exit(1)

    files = gather_html_files(src_root)
    if not files:
        print("No HTML files found under", src_root)
        sys.exit(0)

    if args.sample > 0:
        files = files[: args.sample]

    converted = []
    for f in files:
        dest_file = dest_root.joinpath(f.relative_to(src_root)).with_suffix(".md")
        if dest_file.exists() and not args.overwrite:
            print("Skipping existing:", dest_file)
            continue
        out = html_to_md_file(f, src_root, dest_root)
        converted.append(out)
        print("Converted:", f, "->", out)

    print(f"Converted {len(converted)} files. Output root: {dest_root}")

if __name__ == "__main__":
    main()