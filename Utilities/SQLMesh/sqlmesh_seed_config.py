"""SQLMesh seed hook: run anonymization on seeds before `sqlmesh plan`.

Place this file in your project and call `run_seed_anonymizer()` from your
SQLMesh project pre-plan hook (or invoke it from CI) to ensure anonymized
seeds are produced automatically.

Example usage in a SQLMesh project file (python):

    from Utilities.SQLMesh.sqlmesh_seed_config import run_seed_anonymizer
    run_seed_anonymizer(Path("Utilities/SQLMesh/seeds/skills_synthetic"))

The hook reads CSVs named `<TABLE>.csv` for each table in
`ANONYMIZATION_POLICY` and writes `<TABLE>_anon.csv` next to the original.
"""
from __future__ import annotations
from pathlib import Path
import pandas as pd
from typing import Optional

from Utilities.SQLMesh.anon_policy import ANONYMIZATION_POLICY
from Utilities.SQLMesh.seeds.anonymize_seeds import apply_policy


def run_seed_anonymizer(seed_dir: Optional[Path | str] = None, overwrite: bool = False) -> list[Path]:
    """Run anonymization for all tables in the manifest.

    Args:
        seed_dir: directory containing seed CSVs (defaults to Utilities/SQLMesh/seeds/skills_synthetic).
        overwrite: if True, replace original CSVs; otherwise write `<name>_anon.csv`.

    Returns:
        List of output file paths written.
    """
    base = Path(seed_dir) if seed_dir is not None else (Path(__file__).parent / "seeds" / "skills_synthetic")
    outputs: list[Path] = []

    for table in ANONYMIZATION_POLICY.keys():
        csv_name = f"{table}.csv"
        src = base / csv_name
        if not src.exists():
            continue

        df = pd.read_csv(src)
        df_an = apply_policy(df, table)

        if overwrite:
            out = src
        else:
            out = src.with_name(src.stem + "_anon" + src.suffix)

        df_an.to_csv(out, index=False)
        outputs.append(out)

    return outputs


if __name__ == "__main__":
    import sys
    seed_path = Path(sys.argv[1]) if len(sys.argv) > 1 else None
    written = run_seed_anonymizer(seed_path)
    if written:
        print("Wrote anonymized seeds:")
        for p in written:
            print(" -", p)
    else:
        print("No seeds found for anonymization in manifest.")
