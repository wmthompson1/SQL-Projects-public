BOE Receivable - .xls → .xlsx Converter
======================================

Purpose
-
This small utility set converts legacy `.xls` files to modern `.xlsx` files so the pipeline can use the ImportExcel-based V4 flow (no COM Excel automation).

Files
-
- `Convert-XlsToXlsx.ps1` — Converts a single `.xls` to `.xlsx` using ACE OLE DB to read and `Export-Excel` (ImportExcel) to write.
- `Convert-AllXlsToXlsx.ps1` — Wrapper that auto-detects `.xls` files in the configured `Input` folder and converts them in batch.
- `BOEReceivableProcessFilesV4.ps1` — ImportExcel-based processing pipeline (reads .xlsx files).

Prerequisites
-
- PowerShell 7+ recommended (works in Windows PowerShell too).
- ACE OLE DB provider installed (Microsoft.ACE.OLEDB.16.0 or 12.0). Install Access Database Engine if missing.
- `ImportExcel` PowerShell module installed on the BI server:

  Install-Module ImportExcel -Scope CurrentUser

Directory layout (expected)
-
- `Utilities\Powershell Utilities\` — scripts live here
- `...\Input\` — place incoming files (.xls / .xlsx)
- `...\Process\` — working copies created by scripts
- `...\ProcessComplete\` — originals moved here after conversion/processing
- `...\Logs\` — diagnostic logs

Basic usage
-
1. Convert a single file:

```powershell
pwsh .\Utilities\Powershell Utilities\Convert-XlsToXlsx.ps1 -InXls 'C:\path\file.xls' -OutXlsx 'C:\path\file.xlsx'
```

2. Convert all `.xls` files from the repository `Input` folder (wrapper):

```powershell
pwsh .\Utilities\Powershell Utilities\Convert-AllXlsToXlsx.ps1
```

3. Run the V4 pipeline (reads .xlsx files):

```powershell
pwsh .\Utilities\Powershell Utilities\BOEReceivableProcessFilesV4.ps1
```

Notes & recommendations
-
- The wrapper will create a timestamped copy in `Process` and write a `BOE_Excel_Convert.log` entry for each file.
- After conversion the original `.xls` files are moved to `ProcessComplete` to avoid re-processing.
- If you plan to schedule this under SQL Agent, run manual tests first as the service account to confirm file system permissions and module availability.

If you want, I can add a small scheduled-job example (SCHTASKS) or an SQL Agent step template.
