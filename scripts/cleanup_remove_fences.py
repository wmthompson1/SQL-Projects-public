import pathlib

STAGING_DIR = pathlib.Path("Utilities/SQLMesh/models/staging")

def clean_file(path: pathlib.Path):
    text = path.read_text(encoding="utf-8")
    lines = text.splitlines()
    cleaned = [ln for ln in lines if not ln.strip().startswith('```')]
    # also remove lines that are exactly backticks with extra backticks
    cleaned = [ln for ln in cleaned if ln.strip() != '````sql' and ln.strip() != '````']
    path.write_text("\n".join(cleaned) + "\n", encoding="utf-8")

def main():
    for p in STAGING_DIR.glob("*.sql"):
        print(f"Cleaning {p}")
        clean_file(p)

if __name__ == '__main__':
    main()
