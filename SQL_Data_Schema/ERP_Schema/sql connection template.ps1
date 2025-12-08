# Import the functions
. .\SqlConnection.ps1

# Windows Auth (your current setup)
$conn = New-SqlConnection -ServerInstance "SQL-LAB-1" -Database "LIVE"

# Execute query
$results = Invoke-SqlQuery -Connection $conn -Query @"
    SELECT TABLE_SCHEMA, TABLE_NAME, TABLE_TYPE
    FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_TYPE = 'BASE TABLE'
"@

$results | Format-Table

# Close connection
Close-SqlConnection -Connection $conn