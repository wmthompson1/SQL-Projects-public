# # Documentation\Data Models\ddl\schema-extract
# $cred = Get-Credential -UserName 'sa' -Message 'add sql-lab-1\sa password'
# $folder = Join-Path $env:USERPROFILE '.sql'
# New-Item -Path $folder -ItemType Directory -Force | Out-Null
# $cred | Export-Clixml -Path (Join-Path $folder 'sql-lab-1-sa.cred.xml')

$cred = Import-Clixml -Path "$env:USERPROFILE\.sql\sql-lab-1-sa.cred.xml"
& '.\Documentation\Data Models\ddl\schema-extract\extract-schema.ps1' `
  -ServerInstance 'sql-lab-1' `
  -Databases 'LIVE' `
  -Username $cred.UserName `
  -Password $cred.GetNetworkCredential().Password `
  -OutputDir '.\Documentation\Data Models\ddl\schema-extract\output'