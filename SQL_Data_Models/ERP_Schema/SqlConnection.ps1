# =============================================
# SQL Server Connection Helper
# Purpose: Reusable SQL Server connection management
# =============================================

<#
.SYNOPSIS
    SQL Server connection helper with credential management

.EXAMPLE
    # Import the connection functions
    . .\SqlConnection.ps1
    
    # Connect using Windows Authentication
    $conn = New-SqlConnection -ServerInstance "SQL-LAB-1" -Database "LIVE"
    
    # Execute query
    $results = Invoke-SqlQuery -Connection $conn -Query "SELECT TOP 10 * FROM INFORMATION_SCHEMA.TABLES"
    
    # Close connection
    Close-SqlConnection -Connection $conn

.EXAMPLE
    # Connect using SQL Authentication
    $cred = Get-Credential
    $conn = New-SqlConnection -ServerInstance "SQL-LAB-1" -Database "LIVE" -Credential $cred
    
    # Execute with parameters
    $query = "SELECT * FROM MyTable WHERE Column1 = @Value"
    $params = @{ Value = "Test" }
    $results = Invoke-SqlQuery -Connection $conn -Query $query -Parameters $params
#>

function New-SqlConnection {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string]$ServerInstance,
        
        [Parameter(Mandatory=$true)]
        [string]$Database,
        
        [Parameter(Mandatory=$false)]
        [PSCredential]$Credential,
        
        [Parameter(Mandatory=$false)]
        [int]$ConnectionTimeout = 30
    )
    
    try {
        # Build connection string
        $connString = "Server=$ServerInstance;Database=$Database;Connection Timeout=$ConnectionTimeout;"
        
        if ($Credential) {
            # SQL Authentication
            $username = $Credential.UserName
            $password = $Credential.GetNetworkCredential().Password
            $connString += "User ID=$username;Password=$password;"
        } else {
            # Windows Authentication
            $connString += "Integrated Security=True;"
        }
        
        # Create and open connection
        $connection = New-Object System.Data.SqlClient.SqlConnection($connString)
        $connection.Open()
        
        Write-Verbose "Connected to $ServerInstance.$Database"
        
        return $connection
        
    } catch {
        Write-Error "Failed to connect to SQL Server: $_"
        throw
    }
}

function Close-SqlConnection {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [System.Data.SqlClient.SqlConnection]$Connection
    )
    
    if ($Connection.State -eq 'Open') {
        $Connection.Close()
        $Connection.Dispose()
        Write-Verbose "Connection closed"
    }
}

function Invoke-SqlQuery {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [System.Data.SqlClient.SqlConnection]$Connection,
        
        [Parameter(Mandatory=$true)]
        [string]$Query,
        
        [Parameter(Mandatory=$false)]
        [hashtable]$Parameters,
        
        [Parameter(Mandatory=$false)]
        [int]$CommandTimeout = 30
    )
    
    try {
        $command = $Connection.CreateCommand()
        $command.CommandText = $Query
        $command.CommandTimeout = $CommandTimeout
        
        # Add parameters if provided
        if ($Parameters) {
            foreach ($key in $Parameters.Keys) {
                $param = $command.Parameters.AddWithValue("@$key", $Parameters[$key])
                Write-Verbose "Added parameter: @$key = $($Parameters[$key])"
            }
        }
        
        # Execute and return results
        $adapter = New-Object System.Data.SqlClient.SqlDataAdapter($command)
        $dataset = New-Object System.Data.DataSet
        [void]$adapter.Fill($dataset)
        
        return $dataset.Tables[0]
        
    } catch {
        Write-Error "Query execution failed: $_"
        throw
    }
}

function Invoke-SqlNonQuery {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [System.Data.SqlClient.SqlConnection]$Connection,
        
        [Parameter(Mandatory=$true)]
        [string]$Query,
        
        [Parameter(Mandatory=$false)]
        [hashtable]$Parameters,
        
        [Parameter(Mandatory=$false)]
        [int]$CommandTimeout = 30
    )
    
    try {
        $command = $Connection.CreateCommand()
        $command.CommandText = $Query
        $command.CommandTimeout = $CommandTimeout
        
        # Add parameters if provided
        if ($Parameters) {
            foreach ($key in $Parameters.Keys) {
                [void]$command.Parameters.AddWithValue("@$key", $Parameters[$key])
            }
        }
        
        # Execute non-query (INSERT, UPDATE, DELETE)
        $rowsAffected = $command.ExecuteNonQuery()
        
        Write-Verbose "Rows affected: $rowsAffected"
        return $rowsAffected
        
    } catch {
        Write-Error "Non-query execution failed: $_"
        throw
    }
}

function Test-SqlConnection {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string]$ServerInstance,
        
        [Parameter(Mandatory=$true)]
        [string]$Database,
        
        [Parameter(Mandatory=$false)]
        [PSCredential]$Credential
    )
    
    try {
        $conn = New-SqlConnection -ServerInstance $ServerInstance -Database $Database -Credential $Credential
        $isOpen = ($conn.State -eq 'Open')
        Close-SqlConnection -Connection $conn
        
        return $isOpen
        
    } catch {
        return $false
    }
}

# Example usage (commented out)
<#
# Import functions
. .\SqlConnection.ps1

# Test connection
if (Test-SqlConnection -ServerInstance "SQL-LAB-1" -Database "LIVE") {
    Write-Host "✓ Connection test successful" -ForegroundColor Green
} else {
    Write-Host "✗ Connection test failed" -ForegroundColor Red
}

# Connect and query
$conn = New-SqlConnection -ServerInstance "SQL-LAB-1" -Database "LIVE"

try {
    # Simple query
    $tables = Invoke-SqlQuery -Connection $conn -Query "SELECT TABLE_SCHEMA, TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE'"
    Write-Host "Found $($tables.Rows.Count) tables"
    
    # Parameterized query
    $query = "SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @TableName"
    $columns = Invoke-SqlQuery -Connection $conn -Query $query -Parameters @{ TableName = "MyTable" }
    
    # Non-query (example - commented out for safety)
    # $rowsAffected = Invoke-SqlNonQuery -Connection $conn -Query "UPDATE MyTable SET Column1 = @Value WHERE ID = @ID" -Parameters @{ Value = "NewValue"; ID = 123 }
    
} finally {
    Close-SqlConnection -Connection $conn
}
#>
