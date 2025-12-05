Credential runbook — how this extractor collects credentials

Overview
- The extractor supports three authentication modes:
  1. Integrated (default): uses the current PowerShell process Windows identity (no prompt).
  2. Integrated with RunAs: run PowerShell as a different Windows account (e.g., "Run as different user") and run the script; this uses that account's identity.
  3. SQL Authentication: provide credentials via `-PromptForSqlCredential` (interactive) or `-Username`/`-Password` (non-interactive).

Why we don't programmatically accept alternate Windows credentials
- `Invoke-Sqlcmd` and the SqlServer module do not provide a reliable, cross-version way to accept a PSCredential for Windows authentication and impersonate a different Windows user when opening connections.
- For safety and predictability we require either running PowerShell under the target Windows account (RunAs) or using SQL auth.

Recommended runs
- Use integrated auth (no prompt) when running as your user with appropriate DB permissions:

```powershell
.\extract-schema.ps1 -ServerInstance 'sql-lab-1' -Databases 'LIVE' -OutputDir .\output
```

- If you need to run as a different Windows account, use RunAs (example):

```powershell
# Shift+Right-click Explorer on PowerShell and choose "Run as different user"
# Then run the script normally (no -UseIntegratedAuth flag needed)
.\extract-schema.ps1 -ServerInstance 'sql-lab-1' -Databases 'LIVE' -OutputDir .\output
```

- Use `-PromptForSqlCredential` to securely enter SQL username/password (interactive):

```powershell
.\extract-schema.ps1 -ServerInstance 'sql-lab-1' -Databases 'LIVE' -PromptForSqlCredential -OutputDir .\output
```

- Non-interactive SQL auth (only when you must automate and can secure the secret):

```powershell
.\extract-schema.ps1 -ServerInstance 'sql-lab-1' -Databases 'LIVE' -Username 'svc_extract' -Password 'REDACTED' -OutputDir .\output
```

Security notes
- Prefer integrated auth or interactive prompts over passing plaintext passwords on the command line.
- If automating, store secrets in a secure vault (KeyVault, Credential Manager, or encrypted file) and retrieve them at runtime; I can add a helper for KeyVault if you use Azure.

If you'd like, I can:
- Add a `-TableFilter` option to limit output to specific tables.
- Add a helper to retrieve credentials from Windows Credential Manager or Azure KeyVault.

*** End of runbook
