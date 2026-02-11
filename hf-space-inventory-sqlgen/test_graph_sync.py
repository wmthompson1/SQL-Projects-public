#!/usr/bin/env python3
"""Test graph_sync dry run functionality"""

import traceback
from graph_sync import sync_graph

try:
    print("Testing graph_sync dry run...")
    report = sync_graph(dry_run=True)
    print("\n" + "="*50)
    print(report.summary())
    print("="*50)
    
    if report.success:
        print("\n✅ Dry run SUCCESSFUL")
    else:
        print("\n❌ Dry run FAILED")
        print("Errors:")
        for err in report.errors:
            print(f"  - {err}")
            
except Exception as e:
    print(f"\n❌ Exception occurred: {e}")
    print("\nFull traceback:")
    traceback.print_exc()
