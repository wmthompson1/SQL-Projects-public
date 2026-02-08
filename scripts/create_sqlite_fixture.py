#!/usr/bin/env python3
"""
Create a minimal SQLite fixture for hf-space-inventory-sqlgen/app_schema/manufacturing.db
This creates the `schema_*` tables expected by the NCM elevation entry point and
inserts a few rows (Quality, Finance perspectives and basic concepts/fields).
"""
import sqlite3
import os

DB_PATH = os.path.join("hf-space-inventory-sqlgen", "app_schema", "manufacturing.db")

def ensure_dir(path):
    d = os.path.dirname(path)
    if d and not os.path.exists(d):
        os.makedirs(d, exist_ok=True)

def main():
    ensure_dir(DB_PATH)
    conn = sqlite3.connect(DB_PATH)
    cur = conn.cursor()

    cur.executescript('''
    PRAGMA foreign_keys = OFF;
    CREATE TABLE IF NOT EXISTS schema_concepts (
        concept_id INTEGER PRIMARY KEY AUTOINCREMENT,
        concept_name TEXT UNIQUE,
        description TEXT
    );

    CREATE TABLE IF NOT EXISTS schema_concept_fields (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        concept_id INTEGER,
        table_name TEXT,
        field_name TEXT,
        FOREIGN KEY(concept_id) REFERENCES schema_concepts(concept_id)
    );

    CREATE TABLE IF NOT EXISTS schema_intents (
        intent_id INTEGER PRIMARY KEY AUTOINCREMENT,
        intent_name TEXT UNIQUE,
        description TEXT
    );

    CREATE TABLE IF NOT EXISTS schema_perspectives (
        perspective_id INTEGER PRIMARY KEY AUTOINCREMENT,
        perspective_name TEXT UNIQUE,
        description TEXT
    );

    CREATE TABLE IF NOT EXISTS schema_intent_perspectives (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        intent_id INTEGER,
        perspective_id INTEGER,
        intent_factor_weight INTEGER DEFAULT 1,
        FOREIGN KEY(intent_id) REFERENCES schema_intents(intent_id),
        FOREIGN KEY(perspective_id) REFERENCES schema_perspectives(perspective_id)
    );

    CREATE TABLE IF NOT EXISTS schema_perspective_concepts (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        perspective_id INTEGER,
        concept_id INTEGER,
        FOREIGN KEY(perspective_id) REFERENCES schema_perspectives(perspective_id),
        FOREIGN KEY(concept_id) REFERENCES schema_concepts(concept_id)
    );

    CREATE TABLE IF NOT EXISTS schema_intent_concepts (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        intent_id INTEGER,
        concept_id INTEGER,
        intent_factor_weight INTEGER DEFAULT 1,
        FOREIGN KEY(intent_id) REFERENCES schema_intents(intent_id),
        FOREIGN KEY(concept_id) REFERENCES schema_concepts(concept_id)
    );
    ''')

    # Insert minimal perspectives, intents, concepts and fields
    perspectives = [
        ("Quality", "Quality perspective"),
        ("Finance", "Finance perspective"),
    ]
    for name, desc in perspectives:
        cur.execute("INSERT OR IGNORE INTO schema_perspectives (perspective_name, description) VALUES (?, ?)", (name, desc))

    intents = [
        ("Solder", "Solder pattern intent placeholder"),
    ]
    for name, desc in intents:
        cur.execute("INSERT OR IGNORE INTO schema_intents (intent_name, description) VALUES (?, ?)", (name, desc))

    concepts = [
        ("MATERIAL_NON_CONFORMANCE", "Material-centric defect tracking"),
        ("FINANCIAL_LIABILITY_NCM", "Financial liability from NCM events"),
        ("PRODUCTION_DEFECT", "Generic production defect")
    ]
    for name, desc in concepts:
        cur.execute("INSERT OR IGNORE INTO schema_concepts (concept_name, description) VALUES (?, ?)", (name, desc))

    # Get ids
    conn.commit()
    def get_one(query, params=()):
        cur.execute(query, params)
        r = cur.fetchone()
        return r[0] if r else None

    # Link intent->perspectives
    intent_id = get_one("SELECT intent_id FROM schema_intents WHERE intent_name = 'Solder'")
    quality_id = get_one("SELECT perspective_id FROM schema_perspectives WHERE perspective_name = 'Quality'")
    finance_id = get_one("SELECT perspective_id FROM schema_perspectives WHERE perspective_name = 'Finance'")
    if intent_id and quality_id:
        cur.execute("INSERT OR IGNORE INTO schema_intent_perspectives (intent_id, perspective_id, intent_factor_weight) VALUES (?, ?, 1)", (intent_id, quality_id))
    if intent_id and finance_id:
        cur.execute("INSERT OR IGNORE INTO schema_intent_perspectives (intent_id, perspective_id, intent_factor_weight) VALUES (?, ?, 1)", (intent_id, finance_id))

    # Link perspectives -> concepts
    ncm_id = get_one("SELECT concept_id FROM schema_concepts WHERE concept_name = 'MATERIAL_NON_CONFORMANCE'")
    fin_ncm_id = get_one("SELECT concept_id FROM schema_concepts WHERE concept_name = 'FINANCIAL_LIABILITY_NCM'")
    defect_id = get_one("SELECT concept_id FROM schema_concepts WHERE concept_name = 'PRODUCTION_DEFECT'")
    if quality_id and ncm_id:
        cur.execute("INSERT OR IGNORE INTO schema_perspective_concepts (perspective_id, concept_id) VALUES (?, ?)", (quality_id, ncm_id))
        cur.execute("INSERT OR IGNORE INTO schema_perspective_concepts (perspective_id, concept_id) VALUES (?, ?)", (quality_id, defect_id))
    if finance_id and fin_ncm_id:
        cur.execute("INSERT OR IGNORE INTO schema_perspective_concepts (perspective_id, concept_id) VALUES (?, ?)", (finance_id, fin_ncm_id))
        cur.execute("INSERT OR IGNORE INTO schema_perspective_concepts (perspective_id, concept_id) VALUES (?, ?)", (finance_id, defect_id))

    # Add concept fields
    fields = [
        (ncm_id, 'stg_non_conformant_materials', 'severity'),
        (ncm_id, 'stg_non_conformant_materials', 'cost_impact'),
        (defect_id, 'stg_product_defects', 'severity'),
        (defect_id, 'stg_product_defects', 'defect_type'),
        (defect_id, 'stg_product_defects', 'cost_impact'),
    ]
    for cid, tbl, fld in fields:
        if cid:
            cur.execute("INSERT OR IGNORE INTO schema_concept_fields (concept_id, table_name, field_name) VALUES (?, ?, ?)", (cid, tbl, fld))

    conn.commit()
    conn.close()
    print(f"Created minimal SQLite fixture at {DB_PATH}")

if __name__ == '__main__':
    main()
