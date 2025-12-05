-- main database schema
folder url: https
Documentation\Data Models\ddl\schema-extract\output\LIVE\README.md
Quick index: the full per-table CREATE scripts are in this folder. To help find files quickly I added `TABLE_INDEX.md` which maps table name → filename (e.g. `PAYABLE` → `dbo.PAYABLE.sql`).

To (re)generate the index locally run:

```powershell
pwsh -NoProfile -ExecutionPolicy Bypass -Command "& 'Documentation/Data Models/ddl/schema-extract/output/LIVE/generate_table_index.ps1'"
```

Output: `Documentation/Data Models/ddl/schema-extract/output/LIVE/TABLE_INDEX.md`