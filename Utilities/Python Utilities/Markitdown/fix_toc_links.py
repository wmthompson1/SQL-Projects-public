from pathlib import Path
base = Path(__file__).parent
p = base / 'VISUALINVENTORY_TOC.md'
if not p.exists():
    print('VISUALINVENTORY_TOC.md not found at', p)
    raise SystemExit(1)
s = p.read_text(encoding='utf-8')
new = s.replace('](#$', '](#')
new = new.replace('](#$', '](#')
if new != s:
    p.write_text(new, encoding='utf-8')
    print('Patched TOC links at', p)
else:
    print('No changes needed')
