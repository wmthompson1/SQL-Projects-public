# Export-SchemaDocumentation.ps1
# Purpose: Extract ERP schema metadata and export to multiple formats
# Output: CSV (LucidChart), Markdown (documentation), JSON (Copilot/MCP)

[CmdletBinding()]
param(
    [Parameter(Mandatory=$false)]
    [string]$ServerInstance = "YOUR_SQL_SERVER",
    
    [Parameter(Mandatory=$false)]
    [string]$Database = "YOUR_ERP_DATABASE",
    
    [Parameter(Mandatory=$false)]
    [ValidateSet('CSV', 'Markdown', 'JSON', 'All')]
    [string]$OutputFormat = 'All',
    
    [Parameter(Mandatory=$false)]
    [string]$OutputPath = $PSScriptRoot,
    
    [Parameter(Mandatory=$false)]
    [switch]$IncludeViews,
    
    [Parameter(Mandatory=$false)]
    [string[]]$ExcludeSchemas = @('sys', 'INFORMATION_SCHEMA')
)

$ErrorActionPreference = "Stop"

# Import SQL Server module if available
if (-not (Get-Module -Name SqlServer -ListAvailable)) {
    Write-Warning "SqlServer module not found. Install with: Install-Module -Name SqlServer -Scope CurrentUser"
    Write-Output "Attempting to use Invoke-Sqlcmd from older SQLPS module..."
}

# Build query from extract_schema.sql
$QueryPath = Join-Path $PSScriptRoot "extract_schema.sql"
if (-not (Test-Path $QueryPath)) {
    throw "Schema extraction query not found: $QueryPath"
}

$Query = Get-Content $QueryPath -Raw

# Add runtime filters
$WhereClause = @()
if (-not $IncludeViews) {
    $WhereClause += "t.TABLE_TYPE = 'BASE TABLE'"
}
if ($ExcludeSchemas.Count -gt 0) {
    $SchemaList = ($ExcludeSchemas | ForEach-Object { "'$_'" }) -join ','
    $WhereClause += "t.TABLE_SCHEMA NOT IN ($SchemaList)"
}

if ($WhereClause.Count -gt 0) {
    $FilterClause = "AND " + ($WhereClause -join " AND ")
    $Query = $Query -replace "WHERE \(1=1\)", "WHERE (1=1) $FilterClause"
}

Write-Output "Connecting to $ServerInstance.$Database..."

try {
    # Execute query
    $SchemaData = Invoke-Sqlcmd -ServerInstance $ServerInstance -Database $Database -Query $Query -ErrorAction Stop
    
    if ($SchemaData.Count -eq 0) {
        Write-Warning "No schema data returned. Check your filters and database connection."
        exit 1
    }
    
    Write-Output "Retrieved $($SchemaData.Count) schema rows"
    
    # Export CSV
    if ($OutputFormat -in @('CSV', 'All')) {
        $CsvPath = Join-Path $OutputPath "schema_export.csv"
        $SchemaData | Export-Csv -Path $CsvPath -NoTypeInformation -Encoding UTF8
        Write-Output "✓ CSV exported: $CsvPath"
    }
    
    # Export Markdown
    if ($OutputFormat -in @('Markdown', 'All')) {
        $MdPath = Join-Path $OutputPath "schema_export.md"
        
        $MdContent = @"
# ERP Schema Reference
**Generated:** $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")  
**Database:** $ServerInstance.$Database  
**Total Columns:** $($SchemaData.Count)

---

"@
        
        # Group by table
        $TableGroups = $SchemaData | Group-Object -Property TABLE_SCHEMA, TABLE_NAME
        
        foreach ($TableGroup in $TableGroups) {
            $Schema = $TableGroup.Group[0].TABLE_SCHEMA
            $Table = $TableGroup.Group[0].TABLE_NAME
            $TableType = $TableGroup.Group[0].TABLE_TYPE
            
            $MdContent += "`n## $Schema.$Table`n"
            $MdContent += "_Type: $TableType_`n`n"
            
            # Create markdown table
            $MdContent += "| Column | Data Type | Nullable | Key | FK Reference | Description |`n"
            $MdContent += "|--------|-----------|----------|-----|--------------|-------------|`n"
            
            foreach ($Col in $TableGroup.Group | Sort-Object ORDINAL_POSITION) {
                $DataType = $Col.DATA_TYPE
                if ($Col.CHARACTER_MAXIMUM_LENGTH) {
                    $DataType += "($($Col.CHARACTER_MAXIMUM_LENGTH))"
                } elseif ($Col.NUMERIC_PRECISION) {
                    $DataType += "($($Col.NUMERIC_PRECISION),$($Col.NUMERIC_SCALE))"
                }
                
                $KeyType = ""
                if ($Col.CONSTRAINT_TYPE -eq 'PRIMARY KEY') { $KeyType = "🔑 PK" }
                elseif ($Col.CONSTRAINT_TYPE -eq 'FOREIGN KEY') { $KeyType = "🔗 FK" }
                elseif ($Col.CONSTRAINT_TYPE -eq 'UNIQUE') { $KeyType = "⚡ UQ" }
                
                $FkRef = ""
                if ($Col.FK_TABLE_NAME) {
                    $FkRef = "$($Col.FK_TABLE_SCHEMA).$($Col.FK_TABLE_NAME).$($Col.FK_COLUMN_NAME)"
                }
                
                $Description = if ($Col.COLUMN_DESCRIPTION) { $Col.COLUMN_DESCRIPTION } else { "" }
                
                $MdContent += "| $($Col.COLUMN_NAME) | $DataType | $($Col.IS_NULLABLE) | $KeyType | $FkRef | $Description |`n"
            }
            
            $MdContent += "`n"
        }
        
        $MdContent | Out-File -FilePath $MdPath -Encoding UTF8
        Write-Output "✓ Markdown exported: $MdPath"
    }
    
    # Export JSON
    if ($OutputFormat -in @('JSON', 'All')) {
        $JsonPath = Join-Path $OutputPath "schema_export.json"
        
        # Structure as nested objects for better consumption
        $JsonStructure = @{
            metadata = @{
                generated = Get-Date -Format "o"
                server = $ServerInstance
                database = $Database
                totalTables = ($SchemaData | Select-Object -Unique TABLE_SCHEMA, TABLE_NAME).Count
                totalColumns = $SchemaData.Count
            }
            tables = @()
        }
        
        $TableGroups = $SchemaData | Group-Object -Property TABLE_SCHEMA, TABLE_NAME
        
        foreach ($TableGroup in $TableGroups) {
            $TableObj = @{
                schema = $TableGroup.Group[0].TABLE_SCHEMA
                name = $TableGroup.Group[0].TABLE_NAME
                type = $TableGroup.Group[0].TABLE_TYPE
                columns = @()
            }
            
            foreach ($Col in $TableGroup.Group | Sort-Object ORDINAL_POSITION) {
                $ColObj = @{
                    name = $Col.COLUMN_NAME
                    ordinal = $Col.ORDINAL_POSITION
                    dataType = $Col.DATA_TYPE
                    maxLength = $Col.CHARACTER_MAXIMUM_LENGTH
                    precision = $Col.NUMERIC_PRECISION
                    scale = $Col.NUMERIC_SCALE
                    nullable = ($Col.IS_NULLABLE -eq 'YES')
                    default = $Col.COLUMN_DEFAULT
                    constraintType = $Col.CONSTRAINT_TYPE
                    constraintName = $Col.CONSTRAINT_NAME
                    description = $Col.COLUMN_DESCRIPTION
                }
                
                if ($Col.FK_TABLE_NAME) {
                    $ColObj.foreignKey = @{
                        schema = $Col.FK_TABLE_SCHEMA
                        table = $Col.FK_TABLE_NAME
                        column = $Col.FK_COLUMN_NAME
                    }
                }
                
                $TableObj.columns += $ColObj
            }
            
            $JsonStructure.tables += $TableObj
        }
        
        $JsonStructure | ConvertTo-Json -Depth 10 | Out-File -FilePath $JsonPath -Encoding UTF8
        Write-Output "✓ JSON exported: $JsonPath"
    }
    
    Write-Output "`nSchema export complete!"
    
} catch {
    Write-Error "Schema export failed: $_"
    Write-Error $_.ScriptStackTrace
    exit 1
}
