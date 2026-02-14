"""SQLMesh seed runner demo

Implements `process_operation_seed` used during SQLMesh seed processing and
runs a quick local test on `Utilities/SQLMesh/seeds/skills_synthetic/OPERATION.csv`.

If the OPERATION seed doesn't exist, a small sample CSV is created first.
"""
from __future__ import annotations
import hashlib
from pathlib import Path
import pandas as pd


def process_operation_seed(df: pd.DataFrame, salt: str = "east_wall_2026") -> pd.DataFrame:
    # Hash the Vendor Link deterministically with MD5 and fixed 32 chars
    if "VENDOR_ID" in df.columns:
        df["VENDOR_ID"] = df["VENDOR_ID"].apply(
            lambda x: hashlib.md5((str(x) + salt).encode()).hexdigest().ljust(32)[:32]
        )
    return df


def ensure_sample_seed(path: Path):
    if path.exists():
        return
    sample = pd.DataFrame([
        {"OPERATION_ID": 1, "VENDOR_ID": "V123", "OPERATION_RESOURCE": "MILL"},
        {"OPERATION_ID": 2, "VENDOR_ID": "V456", "OPERATION_RESOURCE": "DRILL"},
    ])
    path.parent.mkdir(parents=True, exist_ok=True)
    sample.to_csv(path, index=False)
    print(f"Wrote sample seed: {path}")


def main():
    base = Path(__file__).resolve().parent
    seed_dir = base / "seeds" / "skills_synthetic"
    seed_file = seed_dir / "OPERATION.csv"
    anon_file = seed_dir / "OPERATION_anon.csv"

    ensure_sample_seed(seed_file)

    df = pd.read_csv(seed_file)
    print("Original:")
    print(df.head().to_string(index=False))

    df_anon = process_operation_seed(df)
    df_anon.to_csv(anon_file, index=False)

    print("Anonymized (first rows):")
    print(df_anon.head().to_string(index=False))
    print(f"Wrote anonymized seed to: {anon_file}")


if __name__ == "__main__":
    main()
