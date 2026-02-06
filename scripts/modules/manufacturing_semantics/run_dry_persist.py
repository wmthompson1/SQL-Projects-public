#!/usr/bin/env python3
"""
run_dry_persist.py

Helper to run the SQLite->Arango persistence script in a dry-run by
setting TEST_MODE and SKIP_PERSIST env vars in-process to avoid shell
quoting issues on Windows/PowerShell.

Usage:
    python run_dry_persist.py
"""
import os
import runpy

os.environ["TEST_MODE"] = "1"
os.environ["SKIP_PERSIST"] = "1"

script_path = os.path.join(os.path.dirname(__file__), "020_Entry_Point_Persist_SQLite_to_Arango.py")
runpy.run_path(script_path, run_name='__main__')
