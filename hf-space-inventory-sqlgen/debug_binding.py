#!/usr/bin/env python3
"""Debug binding key lookup"""

import os
import json
import sqlite3

# Check manifest
manifest_path = 'app_schema/ground_truth/reviewer_manifest.json'
print("="*60)
print("MANIFEST CHECK")
print("="*60)
with open(manifest_path, 'r') as f:
    manifest = json.load(f)

print(f"\nManifest entries ({len(manifest.get('approved_snippets', {}))} total):")
for key, entry in manifest.get('approved_snippets', {}).items():
    file_path = entry.get('file_path', '')
    full_path = os.path.join('app_schema/ground_truth', file_path)
    exists = os.path.exists(full_path)
    print(f"\n  {key}:")
    print(f"    file_path: {file_path}")
    print(f"    full_path: {full_path}")
    print(f"    exists: {exists}")
    if exists:
        with open(full_path, 'r') as sf:
            content = sf.read().strip()
            print(f"    SQL length: {len(content)} chars")
            print(f"    First 50 chars: {content[:50]}")

# Check queries in database
print("\n" + "="*60)
print("DATABASE QUERIES CHECK")
print("="*60)

conn = sqlite3.connect('app_schema/manufacturing.db')
cursor = conn.cursor()

# Get categories
categories = cursor.execute("SELECT * FROM saved_query_categories").fetchall()
print(f"\nCategories: {categories}")

# Get queries
queries = cursor.execute("SELECT category_id, query_name, SUBSTR(query_text, 1, 50) as preview FROM saved_queries").fetchall()
print(f"\nQueries ({len(queries)} total):")
for q in queries:
    print(f"  Category {q[0]}: {q[1]} - {q[2]}...")

conn.close()
