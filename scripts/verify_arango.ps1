Write-Host "`n=== VERIFYING ARANGODB STATUS ===" -ForegroundColor Cyan
Write-Host "docker ps (arangodb containers):"
docker ps --filter "name=arangodb" --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"

Write-Host "`n=== SETTING ENVIRONMENT VARIABLES ===" -ForegroundColor Cyan
$env:ARANGO_HOST = "localhost"
$env:ARANGO_PORT = "8529"
$env:ARANGO_DB = "manufacturing_graph"  # point to DB where we persisted
$env:SQLITE_PATH = "hf-space-inventory-sqlgen/app_schema/manufacturing.db"

Write-Host "ARANGO_HOST: $env:ARANGO_HOST"
Write-Host "ARANGO_PORT: $env:ARANGO_PORT"
Write-Host "ARANGO_DB: $env:ARANGO_DB"
Write-Host "SQLITE_PATH: $env:SQLITE_PATH"

Write-Host "`n=== VERIFYING SQLITE DATABASE ===" -ForegroundColor Cyan
if (Test-Path $env:SQLITE_PATH) {
    Write-Host "✅ SQLite database found at: $env:SQLITE_PATH" -ForegroundColor Green
    & .\.venv\Scripts\python.exe -c 'import sqlite3,sys; db=r"'+$env:SQLITE_PATH+'"; conn=sqlite3.connect(db); conn.row_factory=None; cur=conn.cursor(); try: print("intent_count:", cur.execute("SELECT COUNT(*) FROM schema_intents").fetchone()[0]); except Exception as e: print("intent_count: ERROR", e); try: print("concept_count:", cur.execute("SELECT COUNT(*) FROM schema_concepts").fetchone()[0]); except Exception as e: print("concept_count: ERROR", e); try: print("field_count:", cur.execute("SELECT COUNT(*) FROM schema_concept_fields").fetchone()[0]); except Exception as e: print("field_count: ERROR", e)'
} else {
    Write-Host "❌ SQLite database NOT found at: $env:SQLITE_PATH" -ForegroundColor Red
}

Write-Host "`n=== RUNNING REFACTORED SCRIPT ===" -ForegroundColor Cyan
# Activate venv and run the entrypoint
& .\.venv\Scripts\Activate.ps1; \
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
$edgeName = 'manufacturing_semantic_layer_edges'
try {
    $edgeCount = Invoke-RestMethod -Method Get -Uri "http://localhost:8529/_db/$env:ARANGO_DB/_api/collection/$edgeName/count"
    Write-Host "Edges: $($edgeCount.count)" -ForegroundColor $(if ($edgeCount.count -gt 0) { 'Green' } else { 'Red' })
} catch {
    Write-Host "Failed to get edge count: $_" -ForegroundColor Red
}

Write-Host "`n=== EDGE-TO-VERTEX RATIO ===" -ForegroundColor Cyan
if ($vertexCount.count -gt 0) {
    $ratio = [math]::Round($edgeCount.count / $vertexCount.count, 2)
    $color = if ($ratio -ge 1.5 -and $ratio -le 2.5) { 'Green' } else { 'Yellow' }
    Write-Host "Ratio: $ratio" -ForegroundColor $color
    Write-Host "Expected: 1.5 - 2.0 for healthy semantic density"
} else {
    Write-Host "⚠️ Cannot calculate ratio - no vertices found" -ForegroundColor Red
}

Write-Host "`n=== VERIFYING CAN_MEAN EDGES ===" -ForegroundColor Cyan
$body = @{ query = "FOR edge IN manufacturing_semantic_layer_edges FILTER edge.edge_type == 'CAN_MEAN' LIMIT 5 RETURN edge" } | ConvertTo-Json
try {
    $canMeanResult = Invoke-RestMethod -Method Post -Uri "http://localhost:8529/_db/$env:ARANGO_DB/_api/cursor" -ContentType 'application/json' -Body $body
    $count = $canMeanResult.result.Count
    Write-Host "Sample CAN_MEAN edges found: $count"
    $canMeanResult.result | ForEach-Object { Write-Host "  $($_._from) -> $($_._to)" -ForegroundColor Cyan }
} catch {
    Write-Host "Failed to run CAN_MEAN query: $_" -ForegroundColor Red
}

Write-Host "`n=== VERIFICATION COMPLETE ===" -ForegroundColor Green
