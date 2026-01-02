## Structure for app files
hf-space-inventory-sqlgen/
├── app_schema/              ← Moved from root
│   ├── manufacturing.db
│   ├── schema_sqlite.sql
│   ├── schema_local.sql
│   ├── schema.sql
│   └── queries/
│       ├── index.json
│       ├── equipment_reliability.sql
│       ├── production_analytics.sql
│       ├── quality_control.sql
│       ├── supplier_performance.sql
│       └── template_category.sql
├── app.py                   ← Updated paths
├── schema_graph.py          ← Updated paths
├── DATABASE_SETUP.md        ← Updated docs
└── CUSTOMIZABLE_INPUTS.md   ← Updated docs