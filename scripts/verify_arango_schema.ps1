Write-Host "`n=== VERIFYING ARANGODB STATUS ===" -ForegroundColor Cyan
Write-Host "docker ps (arangodb containers):"
docker ps --filter "name=arangodb" --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

Write-Host "`n=== SETTING ENVIRONMENT VARIABLES ===" -ForegroundColor Cyan
$env:ARANGO_HOST = "localhost"
$env:ARANGO_PORT = "8529"
$env:ARANGO_DB = "manufacturing_schema"
$env:SQLITE_PATH = "hf-space-inventory-sqlgen/app_schema/manufacturing.db"

Write-Host "ARANGO_HOST: $env:ARANGO_HOST"
Write-Host "ARANGO_PORT: $env:ARANGO_PORT"
Write-Host "ARANGO_DB: $env:ARANGO_DB"
Write-Host "SQLITE_PATH: $env:SQLITE_PATH"

Write-Host "`n=== RUNNING REFACTORED SCRIPT ===" -ForegroundColor Cyan
& .\.venv\Scripts\python.exe Utilities\SQLMesh\seeds\twinning_export\twinning_export\026_Entry_Point_NCM_Elevation_ArangoDB.py

Write-Host "`n=== VERIFYING ARANGODB COLLECTIONS ===" -ForegroundColor Cyan
$api = "http://localhost:8529/_db/$env:ARANGO_DB/_api/collection"
try {
    $collections = Invoke-RestMethod -Method Get -Uri $api
    Write-Host "Available collections:" -ForegroundColor Yellow
    $collections.result | ForEach-Object { Write-Host "  - $($_.name)" }
} catch {
    Write-Host "Failed to list collections:" $_ -ForegroundColor Red
}

Write-Host "`n=== VERTEX COUNT ===" -ForegroundColor Cyan
$vertexName = 'manufacturing_semantic_layer_node'
try {
    $vertexCount = Invoke-RestMethod -Method Get -Uri "http://localhost:8529/_db/$env:ARANGO_DB/_api/collection/$vertexName/count"
    Write-Host "Vertices: $($vertexCount.count)" -ForegroundColor $(if ($vertexCount.count -gt 0) { 'Green' } else { 'Red' })
} catch {
    Write-Host "Failed to get vertex count: $_" -ForegroundColor Red
}

Write-Host "`n=== EDGE COUNT ===" -ForegroundColor Cyan
$edgeName = 'manufacturing_graph_edges'
try {
    $edgeCount = Invoke-RestMethod -Method Get -Uri "http://localhost:8529/_db/$env:ARANGO_DB/_api/collection/$edgeName/count"
    Write-Host "Edges: $($edgeCount.count)" -ForegroundColor $(if ($edgeCount.count -gt 0) { 'Green' } else { 'Red' })
} catch {
    Write-Host "Failed to get edge count: $_" -ForegroundColor Red
}

Write-Host "`n=== VERIFICATION COMPLETE ===" -ForegroundColor Green
