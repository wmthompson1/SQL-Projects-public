from pathlib import Path
base = Path(__file__).parent
md = base / 'VISUALINVENTORY.md'
toc = base / 'VISUALINVENTORY_TOC.md'
if not md.exists():
    print('VISUALINVENTORY.md not found at', md); raise SystemExit(1)
if not toc.exists():
    print('VISUALINVENTORY_TOC.md not found at', toc); raise SystemExit(1)
md_text = md.read_text(encoding='utf-8')
toc_text = toc.read_text(encoding='utf-8')
anchors = md_text.count("<a id=")
toc_links = toc_text.count('](#')
toc_entries = sum(1 for l in toc_text.splitlines() if l.strip().startswith('- ['))
print(f'Anchors in VISUALINVENTORY.md: {anchors}')
print(f'TOC link occurrences (](#): {toc_links}')
print(f'TOC bullet entries (- [): {toc_entries}')
