<#
Extract table DDLs from SQL Server databases using metadata.

Outputs per-database, per-schema files under the output directory.

Usage examples in README.md

Sample Call: ./Extract-DatabaseSchema.ps1 -ServerInstance "SQL-LAB-1" -Databases @("LIVE", "LiveAccounting") -OutputDir ".\schema-output" -UseIntegratedAuth

#>


param(
    [Parameter(Mandatory=$true)] [string] $ServerInstance,
    [Parameter(Mandatory=$true)] [string[]] $Databases,
    [Parameter(Mandatory=$false)] [string] $OutputDir = ".\schema-output",
    [Parameter(Mandatory=$false)] [switch] $UseIntegratedAuth,
    [Parameter(Mandatory=$false)] [switch] $TrustServerCertificate,
    [Parameter(Mandatory=$false)] [string[]] $TableFilter,
    [Parameter(Mandatory=$false)] [switch] $PromptForSqlCredential,
    [Parameter(Mandatory=$false)] [string] $Username,
    [Parameter(Mandatory=$false)] [string] $Password
)

function Ensure-SqlServerModule {
    if (-not (Get-Module -ListAvailable -Name SqlServer)) {
        Write-Host "SqlServer module not found — attempting to install from PSGallery..."
        try {
            Install-Module -Name SqlServer -Scope CurrentUser -Force -AllowClobber -ErrorAction Stop
        } catch {
            Throw "Failed to install SqlServer module. Install manually and re-run. $_"
        }
    }
}

Ensure-SqlServerModule

Import-Module SqlServer -ErrorAction Stop

if (-not (Test-Path $OutputDir)) { New-Item -Path $OutputDir -ItemType Directory -Force | Out-Null }

foreach ($db in $Databases) {
    $dbOut = Join-Path $OutputDir $db
    if (-not (Test-Path $dbOut)) { New-Item -Path $dbOut -ItemType Directory -Force | Out-Null }

    $tablesQuery = @"
SELECT TABLE_SCHEMA, TABLE_NAME
FROM [$db].INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_SCHEMA, TABLE_NAME
"@

    # If requested, prompt for SQL username/password (secure prompt) when SQL auth is desired.
    if ($PromptForSqlCredential -and -not $Username) {
        $cred = Get-Credential -Message 'Enter SQL username and password for SQL authentication'
        $Username = $cred.UserName
        $Password = $cred.GetNetworkCredential().Password
    }

    # Build connection string. Use Integrated Security or SQL auth as requested.
    $connString = "Server=$ServerInstance;Database=$db;"
    if ($UseIntegratedAuth) {
        # Use the current process identity for Integrated Security. To run as a different Windows account,
        # run PowerShell using RunAs under that account. Passing alternate Windows credentials programmatically
        # is not supported by Invoke-Sqlcmd in a cross-version-safe way, so we avoid prompting for Windows creds here.
        $connString += 'Integrated Security=SSPI;'
    } elseif ($Username) {
        $connString += "User ID=$Username;Password=$Password;"
    }
    if ($TrustServerCertificate) { $connString += 'TrustServerCertificate=True;' }

    function Exec-Query {
        param([string]$Query)
        if ($Credential) {
            # If a PSCredential is provided, attempt to use it with Invoke-Sqlcmd (may require appropriate module support)
            return Invoke-Sqlcmd -ConnectionString $connString -Credential $Credential -Query $Query -ErrorAction Stop
        } else {
            return Invoke-Sqlcmd -ConnectionString $connString -Query $Query -ErrorAction Stop
        }
    }

    Write-Host "Querying table list for database: $db"
    $tables = Exec-Query -Query $tablesQuery

    # Apply table filters if provided. Accepts wildcard patterns (e.g. RECEIVABLE*, dbo.RECEIVABLE, *.RECEIVABLE)
    if ($TableFilter -and $TableFilter.Count -gt 0) {
        $patterns = $TableFilter
        $filtered = @()
        foreach ($row in $tables) {
            $full = "$($row.TABLE_SCHEMA).$($row.TABLE_NAME)"
            $matched = $false
            foreach ($p in $patterns) {
                $pat = $p
                # If the user did not include a wildcard, assume they want exact match on table name or schema.table
                if ($pat -notlike '*[*?]*' -and $pat -notlike '*.*') {
                    # match against table name
                    $pat = "$pat"
                }
                # normalize: if pattern contains a dot use it directly, otherwise match either schema.table or table name
                if ($pat -like '*.*') {
                    # allow wildcard usage in pattern
                    if ($full -like $pat) { $matched = $true; break }
                } else {
                    if ($row.TABLE_NAME -like $pat -or $full -like "*$pat*") { $matched = $true; break }
                }
            }
            if ($matched) { $filtered += $row }
        }
        $tables = $filtered
        Write-Host "TableFilter applied — $(($tables).Count) tables will be processed"
    }

    foreach ($row in $tables) {
        $schema = $row.TABLE_SCHEMA
        $table = $row.TABLE_NAME
        Write-Host "Building DDL for $db.$schema.$table"

        $colQuery = @"
SELECT COLUMN_NAME, ORDINAL_POSITION, IS_NULLABLE, DATA_TYPE,
       CHARACTER_MAXIMUM_LENGTH, NUMERIC_PRECISION, NUMERIC_SCALE, COLUMN_DEFAULT
FROM [$db].INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = '$schema' AND TABLE_NAME = '$table'
ORDER BY ORDINAL_POSITION
"@
        $cols = Exec-Query -Query $colQuery

        # Identity detection and more detailed type info
        $colDetailsQuery = @"
SELECT c.name AS ColumnName, ty.name AS DataType, c.max_length, c.precision, c.scale, c.is_identity
FROM [$db].sys.columns c
JOIN [$db].sys.tables t ON c.object_id = t.object_id
JOIN [$db].sys.types ty ON c.user_type_id = ty.user_type_id
WHERE t.name = '$table' AND SCHEMA_NAME(t.schema_id) = '$schema'
"@
        $colDetails = Exec-Query -Query $colDetailsQuery

        # Build CREATE TABLE
        $create = "CREATE TABLE [$schema].[$table] (`n"
        $colLines = @()
        foreach ($c in $cols) {
            $name = $c.COLUMN_NAME
            $meta = $colDetails | Where-Object { $_.ColumnName -eq $name }
            $datatype = $c.DATA_TYPE.ToLower()
            $typeStr = $datatype
            switch ($datatype) {
                'varchar' { if ($c.CHARACTER_MAXIMUM_LENGTH -eq -1) { $typeStr = 'VARCHAR(MAX)' } else { $typeStr = "VARCHAR($($c.CHARACTER_MAXIMUM_LENGTH))" } }
                'nvarchar' { if ($c.CHARACTER_MAXIMUM_LENGTH -eq -1) { $typeStr = 'NVARCHAR(MAX)' } else { $typeStr = "NVARCHAR($($c.CHARACTER_MAXIMUM_LENGTH))" } }
                'varbinary' { if ($c.CHARACTER_MAXIMUM_LENGTH -eq -1) { $typeStr = 'VARBINARY(MAX)' } else { $typeStr = "VARBINARY($($c.CHARACTER_MAXIMUM_LENGTH))" } }
                'char' { $typeStr = "CHAR($($c.CHARACTER_MAXIMUM_LENGTH))" }
                'nchar' { $typeStr = "NCHAR($($c.CHARACTER_MAXIMUM_LENGTH))" }
                'decimal' { $typeStr = "DECIMAL($($c.NUMERIC_PRECISION),$($c.NUMERIC_SCALE))" }
                default { $typeStr = $datatype }
            }
            $isIdentity = $false
            if ($meta -and $meta.is_identity -eq 1) { $isIdentity = $true }
            $identitySuffix = ''
            if ($isIdentity) { $identitySuffix = ' IDENTITY(1,1)' }

            $nullStr = if ($c.IS_NULLABLE -eq 'YES') { 'NULL' } else { 'NOT NULL' }
            $default = ''
            if ($c.COLUMN_DEFAULT) { $default = " DEFAULT $($c.COLUMN_DEFAULT)" }

            $colLines += "    [$name] $typeStr$identitySuffix$default $nullStr"
        }
        $create += ($colLines -join ",`n") + "`n)"

        # Primary key
        $pkQuery = @"
SELECT kc.name AS PKName, col.name AS ColumnName, ic.key_ordinal
FROM [$db].sys.key_constraints kc
JOIN [$db].sys.index_columns ic ON kc.parent_object_id = ic.object_id AND kc.unique_index_id = ic.index_id
JOIN [$db].sys.columns col ON ic.object_id = col.object_id AND ic.column_id = col.column_id
JOIN [$db].sys.tables t ON kc.parent_object_id = t.object_id
WHERE kc.type = 'PK' AND t.name = '$table' AND SCHEMA_NAME(t.schema_id) = '$schema'
ORDER BY ic.key_ordinal
"@
        $pkRows = Exec-Query -Query $pkQuery
        if ($pkRows.Count -gt 0) {
            $pkName = ($pkRows | Select-Object -First 1).PKName
            $pkCols = ($pkRows | Sort-Object key_ordinal | ForEach-Object { "[$($_.ColumnName)]" }) -join ', '
            $create += "`n`nALTER TABLE [$schema].[$table] ADD CONSTRAINT [$pkName] PRIMARY KEY ($pkCols);"
        }

        # Foreign keys
        $fkQuery = @"
SELECT fk.name AS FKName, sch2.name AS RefSchema, t2.name AS RefTable, pc.name AS ParentCol, rc.name AS RefCol, fkc.constraint_column_id
FROM [$db].sys.foreign_keys fk
JOIN [$db].sys.foreign_key_columns fkc ON fk.object_id = fkc.constraint_object_id
JOIN [$db].sys.tables t ON fk.parent_object_id = t.object_id
JOIN [$db].sys.schemas sch ON t.schema_id = sch.schema_id
JOIN [$db].sys.tables t2 ON fk.referenced_object_id = t2.object_id
JOIN [$db].sys.schemas sch2 ON t2.schema_id = sch2.schema_id
JOIN [$db].sys.columns pc ON fkc.parent_object_id = pc.object_id AND fkc.parent_column_id = pc.column_id
JOIN [$db].sys.columns rc ON fkc.referenced_object_id = rc.object_id AND fkc.referenced_column_id = rc.column_id
WHERE sch.name = '$schema' AND t.name = '$table'
ORDER BY fk.name, fkc.constraint_column_id
"@
        $fkRows = Exec-Query -Query $fkQuery
        if ($fkRows.Count -gt 0) {
            $grouped = $fkRows | Group-Object FKName
            foreach ($g in $grouped) {
                $fkName = $g.Name
                $refSchema = ($g.Group | Select-Object -First 1).RefSchema
                $refTable = ($g.Group | Select-Object -First 1).RefTable
                $parentCols = ($g.Group | Sort-Object constraint_column_id | ForEach-Object { "[$($_.ParentCol)]" }) -join ', '
                $refCols = ($g.Group | Sort-Object constraint_column_id | ForEach-Object { "[$($_.RefCol)]" }) -join ', '
                $create += "`n`nALTER TABLE [$schema].[$table] ADD CONSTRAINT [$fkName] FOREIGN KEY ($parentCols) REFERENCES [$refSchema].[$refTable]($refCols);"
            }
        }

        $outFile = Join-Path $dbOut ("$schema.$table.sql")
        Set-Content -Path $outFile -Value $create -Force -Encoding UTF8
    }
}

Write-Host "Schema extraction complete. Files written to: $OutputDir"
