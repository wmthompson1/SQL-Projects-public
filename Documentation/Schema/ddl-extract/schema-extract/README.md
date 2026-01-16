Schema extract — instructions

Purpose:
- Extract authoritative schema (tables, columns, PKs, FKs) from large SQL Server instances (LIVE, LIVEAccounting) and write per-table CREATE scripts.

How to run:
1. Open PowerShell (pwsh) on a machine that can reach the SQL Server `sql-lab-1`.
2. From the workspace root, run the extractor with integrated auth (preferred). `-UseIntegratedAuth` is a switch — do NOT pass a string value.

```powershell
.\Documentation\Data Models\ddl\schema-extract\extract-schema.ps1 \
  -ServerInstance 'sql-lab-1' \
  -Databases 'LIVE','LIVEAccounting' \
  -OutputDir '.\Documentation\Data Models\ddl\schema-extract\output' \
  -UseIntegratedAuth
```

If you hit an SSL/SPN error ("target principal name is incorrect"), add the `-TrustServerCertificate` switch to accept the server certificate for the connection:

```powershell
.\Documentation\Data Models\ddl\schema-extract\extract-schema.ps1 \
  -ServerInstance 'sql-lab-1' \
  -Databases 'LIVE' \
  -OutputDir '.\Documentation\Data Models\ddl\schema-extract\output' \
  -UseIntegratedAuth -TrustServerCertificate
```

Or with SQL auth (sa or service account). For interactive prompting of SQL credentials use `-PromptForSqlCredential` (recommended):

```powershell
.\Documentation\Data Models\ddl\schema-extract\extract-schema.ps1 \
  -ServerInstance 'sql-lab-1' \
  -Databases 'LIVE','LIVEAccounting' \
  -OutputDir '.\Documentation\Data Models\ddl\schema-extract\output' \
  -PromptForSqlCredential
```
You can limit extraction to specific tables using `-TableFilter`. This accepts wildcard patterns or schema.table patterns. Examples:

```powershell
& '.\Documentation\Data Models\ddl\schema-extract\extract-schema.ps1' \
  -ServerInstance 'sql-lab-1' \
  -Databases 'LIVE' \
  -TableFilter 'RECEIVABLE*' \
  -OutputDir '.\Documentation\Data Models\ddl\schema-extract\output' \
  -PromptForSqlCredential

& '.\Documentation\Data Models\ddl\schema-extract\extract-schema.ps1' \
  -ServerInstance 'sql-lab-1' \
  -Databases 'LIVE' \
  -TableFilter 'dbo.RECEIVABLE','dbo.RECEIVABLE_LINE' \
  -OutputDir '.\Documentation\Data Models\ddl\schema-extract\output' \
  -PromptForSqlCredential
```

Or non-interactive SQL auth with `-Username`/`-Password` (less secure):

```powershell
.\Documentation\Data Models\ddl\schema-extract\extract-schema.ps1 \
  -ServerInstance 'sql-lab-1' \
  -Databases 'LIVE','LIVEAccounting' \
  -OutputDir '.\Documentation\Data Models\ddl\schema-extract\output' \
  -Username 'myuser' -Password 'mypassword'
```

Notes:
- The script uses `Invoke-Sqlcmd` from the `SqlServer` PowerShell module. If it's missing the script will attempt to install it (requires internet and admin privileges).
- `-UseIntegratedAuth` uses the current PowerShell process identity. If you must run the extraction as a different Windows user, start PowerShell with RunAs under that account — do not expect the script to programmatically reauthenticate a Windows account.
- For very large schemas, you may prefer to extract one database at a time.
- The generated CREATE TABLE statements are assembled from metadata and may need manual tuning (types, defaults, constraints). They are intended as authoritative starting points.
