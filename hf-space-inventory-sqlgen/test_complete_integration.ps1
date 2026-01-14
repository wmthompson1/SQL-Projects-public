Write-Host "`n🧪 Complete Ground Truth Integration Test Suite" -ForegroundColor Cyan
Write-Host "=" * 60 -ForegroundColor Cyan
Write-Host ""

$ErrorCount = 0
$BaseUrl = "http://localhost:5000"

# Set UTF-8 encoding for Python
$env:PYTHONIOENCODING = "utf-8"

# ============================================================================
# PHASE 1: STATIC TESTS (App Stopped)
# ============================================================================

Write-Host "PHASE 1: Static File & Integration Tests" -ForegroundColor Yellow
Write-Host "-" * 60 -ForegroundColor Yellow

# Test 1: File Existence
Write-Host "`n1️⃣ Testing file existence..." -ForegroundColor Cyan
$requiredFiles = @(
    "ground_truth_queries.sql",
    "ground_truth_integration.py",
    "app.py"
)

foreach ($file in $requiredFiles) {
    if (Test-Path $file) {
        Write-Host "   ✅ Found: $file" -ForegroundColor Green
    } else {
        Write-Host "   ❌ Missing: $file" -ForegroundColor Red
        $ErrorCount++
    }
}

# Test 2: Ground Truth Query Manager
Write-Host "`n2️⃣ Testing GroundTruthQueryManager..." -ForegroundColor Cyan
$test2 = @"
from ground_truth_integration import GroundTruthQueryManager

try:
    manager = GroundTruthQueryManager('ground_truth_queries.sql')
    queries = manager.get_all_queries()
    print('PASS: Loaded', len(queries), 'queries')
    
    for name, query_dict in queries.items():
        if 'sql' not in query_dict:
            print('FAIL: Query missing sql field:', name)
        if 'category' not in query_dict:
            print('FAIL: Query missing category field:', name)
    
    choices = manager.export_for_gradio()
    if len(choices) == len(queries):
        print('PASS: Gradio export has', len(choices), 'options')
    else:
        print('FAIL: Gradio export mismatch')
        
except Exception as e:
    print('FAIL:', str(e))
"@

$result2 = python -X utf8 -c $test2 2>&1
if ($result2 -like "*FAIL*") {
    Write-Host "   ❌ Ground Truth Manager test failed" -ForegroundColor Red
    Write-Host "   $result2" -ForegroundColor Gray
    $ErrorCount++
} else {
    Write-Host "   ✅ Ground Truth Manager working" -ForegroundColor Green
    $result2 -split "`n" | ForEach-Object { Write-Host "      $_" -ForegroundColor Gray }
}

# Test 3: App Imports
Write-Host "`n3️⃣ Testing app.py imports..." -ForegroundColor Cyan
$test3 = @"
try:
    from app import app, query_mgr
    from pydantic import BaseModel
    
    if query_mgr is None:
        print('FAIL: query_mgr not initialized')
    else:
        print('PASS: query_mgr loaded with', len(query_mgr.queries), 'queries')
    
    from app import MCPToolRequest, MCPToolResponse
    print('PASS: MCP Pydantic models imported')
    
except ImportError as e:
    print('FAIL: Import error -', str(e))
except AttributeError as e:
    print('FAIL: Attribute error -', str(e))
except Exception as e:
    print('FAIL:', str(e))
"@

$result3 = python -X utf8 -c $test3 2>&1
if ($result3 -like "*FAIL*") {
    Write-Host "   ❌ App imports test failed" -ForegroundColor Red
    Write-Host "   $result3" -ForegroundColor Gray
    $ErrorCount++
} else {
    Write-Host "   ✅ App imports successful" -ForegroundColor Green
    $result3 -split "`n" | ForEach-Object { Write-Host "      $_" -ForegroundColor Gray }
}

# Test 4: Query Content Validation
Write-Host "`n4️⃣ Testing query content..." -ForegroundColor Cyan
$test4 = @"
from ground_truth_integration import GroundTruthQueryManager

manager = GroundTruthQueryManager('ground_truth_queries.sql')
queries = manager.get_all_queries()

expected = [
    'Basic Filtering - Labor Hours > 7',
    'Aggregation - Total Hours by Batch',
    'Join Pattern - Labor with Batch Info',
    'Date Range - Last 30 Days',
    'Subquery - Batches with High Average Hours',
    'Window Function - Running Total Hours'
]

missing = [e for e in expected if e not in queries]
if missing:
    print('FAIL: Missing queries:', ', '.join(missing))
else:
    print('PASS: All expected queries present')
    
for name, query_dict in queries.items():
    sql = query_dict.get('sql', '')
    if len(sql.strip()) < 20:
        print('FAIL: Query has short SQL:', name)
    if 'SELECT' not in sql.upper():
        print('FAIL: Query missing SELECT:', name)
"@

$result4 = python -X utf8 -c $test4 2>&1
if ($result4 -like "*FAIL*") {
    Write-Host "   ❌ Query content validation failed" -ForegroundColor Red
    Write-Host "   $result4" -ForegroundColor Gray
    $ErrorCount++
} else {
    Write-Host "   ✅ Query content valid" -ForegroundColor Green
    $result4 -split "`n" | ForEach-Object { Write-Host "      $_" -ForegroundColor Gray }
}

# Test 5: Check for MCP Endpoints in app.py
Write-Host "`n5️⃣ Checking app.py for MCP endpoints..." -ForegroundColor Cyan
$appContent = Get-Content app.py -Raw
$requiredEndpoints = @(
    '@app.post("/mcp/tools/get_example_queries"',
    '@app.post("/mcp/tools/get_example_query"',
    'class MCPToolRequest',
    'class MCPToolResponse'
)

foreach ($endpoint in $requiredEndpoints) {
    if ($appContent -like "*$endpoint*") {
        Write-Host "   ✅ Found: $endpoint" -ForegroundColor Green
    } else {
        Write-Host "   ❌ Missing: $endpoint" -ForegroundColor Red
        $ErrorCount++
    }
}

# Phase 1 Summary
Write-Host "`n" + ("=" * 60) -ForegroundColor Cyan
if ($ErrorCount -eq 0) {
    Write-Host "✅ Phase 1: All static tests passed!" -ForegroundColor Green
} else {
    Write-Host "❌ Phase 1: $ErrorCount test(s) failed" -ForegroundColor Red
    Write-Host "`nFix errors before proceeding to Phase 2" -ForegroundColor Yellow
    exit 1
}

# ...rest of Phase 2 tests remain the same...