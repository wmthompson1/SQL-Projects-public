"""Anonymize seed CSVs using ANONYMIZATION_POLICY.

Usage:
  python anonymize_seeds.py --input path/to/operation.csv --table OPERATION --output path/to/operation_anon.csv

The script supports two actions in the manifest:
 - hash: deterministic hashing with salt and fixed length
 - fake: use Faker provider to generate fake values

"""
from __future__ import annotations
import argparse
import hashlib
import sys
from pathlib import Path
import pandas as pd

try:
    from faker import Faker
except Exception:
    Faker = None

from Utilities.SQLMesh.anon_policy import ANONYMIZATION_POLICY


def deterministic_hash(value, salt: str, length: int = 32) -> str:
    if pd.isna(value):
        return value
    h = hashlib.sha256((str(value) + salt).encode("utf-8")).hexdigest()
    if length <= len(h):
        return h[:length]
    return h.ljust(length, "0")


def apply_policy(df: pd.DataFrame, table_name: str) -> pd.DataFrame:
    policy = ANONYMIZATION_POLICY.get(table_name, {})
    fake = Faker() if Faker is not None else None

    for col, rule in policy.items():
        if col not in df.columns:
            continue

        if rule.get("action") == "hash":
            salt = rule.get("salt", "")
            length = int(rule.get("length", 32))
            df[col] = df[col].apply(lambda x: deterministic_hash(x, salt, length))

        elif rule.get("action") == "fake":
            if fake is None:
                raise RuntimeError("Faker is required for 'fake' actions. Add Faker to your environment.")
            provider_name = rule.get("provider")
            if not provider_name:
                raise RuntimeError(f"No provider specified for fake action on column {col}")
            provider = getattr(fake, provider_name, None)
            if provider is None:
                raise RuntimeError(f"Faker has no provider named '{provider_name}'")
            df[col] = [provider() for _ in range(len(df))]

    return df


def main(argv=None):
    p = argparse.ArgumentParser(description="Anonymize seed CSV using manifest policy")
    p.add_argument("--input", "-i", required=True, help="Input CSV path")
    p.add_argument("--table", "-t", required=True, help="Table name in manifest (e.g. OPERATION)")
    p.add_argument("--output", "-o", help="Output CSV path (defaults to input_anon.csv)")
    args = p.parse_args(argv)

    inp = Path(args.input)
    if not inp.exists():
        print(f"Input file not found: {inp}")
        sys.exit(2)

    out = Path(args.output) if args.output else inp.with_name(inp.stem + "_anon" + inp.suffix)

    df = pd.read_csv(inp)
    df_an = apply_policy(df, args.table)
    df_an.to_csv(out, index=False)
    print(f"Wrote anonymized seed to: {out}")


if __name__ == "__main__":
    main()
