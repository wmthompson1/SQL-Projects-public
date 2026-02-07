<#
.SYNOPSIS
    Create and push a work-in-progress (WIP) branch with timestamp.

.DESCRIPTION
    This script helps manage WIP (work-in-progress) branches by:
    - Creating a new branch with timestamp to avoid conflicts
    - Staging and committing all current changes
    - Pushing the branch to remote with upstream tracking
    - Providing clear status messages

.PARAMETER Description
    Description for the WIP branch (e.g., "local-changes", "feature-draft")
    Default: "local-changes"

.PARAMETER NoCommit
    Create and push branch without committing changes (branch must already exist)

.PARAMETER Message
    Custom commit message (default: "WIP: {description}")

.PARAMETER List
    List all WIP branches (local and remote)

.PARAMETER Delete
    Delete a WIP branch (both local and remote)

.PARAMETER Resume
    Checkout an existing WIP branch

.EXAMPLE
    .\scripts\create_wip_branch.ps1
    Creates WIP branch with default name and timestamp

.EXAMPLE
    .\scripts\create_wip_branch.ps1 -Description "api-refactor"
    Creates wip/api-refactor_20260205-163530

.EXAMPLE
    .\scripts\create_wip_branch.ps1 -List
    Lists all WIP branches

.EXAMPLE
    .\scripts\create_wip_branch.ps1 -Delete -Description "local-changes_20260205-163530"
    Deletes the specified WIP branch

.EXAMPLE
    .\scripts\create_wip_branch.ps1 -Resume -Description "local-changes_20260205-163530"
    Resumes work on the specified WIP branch

.NOTES
    File Name      : create_wip_branch.ps1
    Prerequisite   : Git repository with remote configured
    Purpose        : Simplify WIP branch workflow with automatic timestamps
#>

[CmdletBinding(DefaultParameterSetName='Create')]
param(
    [Parameter(ParameterSetName='Create', Position=0)]
    [Parameter(ParameterSetName='Resume')]
    [Parameter(ParameterSetName='Delete')]
    [string]$Description = "local-changes",
    
    [Parameter(ParameterSetName='Create')]
    [switch]$NoCommit,
    
    [Parameter(ParameterSetName='Create')]
    [string]$Message,
    
    [Parameter(ParameterSetName='List')]
    [switch]$List,
    
    [Parameter(ParameterSetName='Delete')]
    [switch]$Delete,
    
    [Parameter(ParameterSetName='Resume')]
    [switch]$Resume
)

# Color output functions
function Write-Success($msg) { Write-Host "✅ $msg" -ForegroundColor Green }
function Write-Info($msg) { Write-Host "ℹ️  $msg" -ForegroundColor Cyan }
function Write-Warning2($msg) { Write-Host "⚠️  $msg" -ForegroundColor Yellow }
function Write-Error2($msg) { Write-Host "❌ $msg" -ForegroundColor Red }

# Check if in git repository
function Test-GitRepository {
    try {
        $null = git rev-parse --git-dir 2>&1
        return $?
    } catch {
        return $false
    }
}

# List WIP branches
function Show-WipBranches {
    Write-Info "WIP Branches (Local):"
    $localWip = git branch | Select-String "wip/"
    if ($localWip) {
        $localWip | ForEach-Object {
            $branch = $_.ToString().Trim()
            $lastCommit = git log -1 --format="%ar" $branch 2>$null
            Write-Host "  $branch" -ForegroundColor Yellow -NoNewline
            Write-Host " (last commit: $lastCommit)" -ForegroundColor Gray
        }
    } else {
        Write-Host "  (none)" -ForegroundColor Gray
    }
    
    Write-Host ""
    Write-Info "WIP Branches (Remote):"
    $remoteWip = git branch -r | Select-String "origin/wip/"
    if ($remoteWip) {
        $remoteWip | ForEach-Object {
            $branch = $_.ToString().Trim()
            $branchName = $branch -replace "origin/", ""
            $lastCommit = git log -1 --format="%ar" $branch 2>$null
            Write-Host "  $branch" -ForegroundColor Yellow -NoNewline
            Write-Host " (last commit: $lastCommit)" -ForegroundColor Gray
        }
    } else {
        Write-Host "  (none)" -ForegroundColor Gray
    }
}

# Delete WIP branch
function Remove-WipBranch {
    param([string]$branchDesc)
    
    # Check if branch name already has wip/ prefix
    if ($branchDesc -match "^wip/") {
        $branchName = $branchDesc
    } else {
        $branchName = "wip/$branchDesc"
    }
    
    Write-Info "Attempting to delete: $branchName"
    
    # Check if branch exists locally
    $localExists = git branch --list $branchName
    if ($localExists) {
        Write-Info "Deleting local branch: $branchName"
        git branch -D $branchName
        if ($LASTEXITCODE -eq 0) {
            Write-Success "Deleted local branch"
        } else {
            Write-Error2 "Failed to delete local branch"
        }
    } else {
        Write-Warning2 "Local branch not found"
    }
    
    # Check if branch exists on remote
    $remoteExists = git ls-remote --heads origin $branchName 2>$null
    if ($remoteExists) {
        Write-Info "Deleting remote branch: $branchName"
        git push origin --delete $branchName
        if ($LASTEXITCODE -eq 0) {
            Write-Success "Deleted remote branch"
        } else {
            Write-Error2 "Failed to delete remote branch"
        }
    } else {
        Write-Warning2 "Remote branch not found"
    }
}

# Resume WIP branch
function Resume-WipBranch {
    param([string]$branchDesc)
    
    # Check if branch name already has wip/ prefix
    if ($branchDesc -match "^wip/") {
        $branchName = $branchDesc
    } else {
        $branchName = "wip/$branchDesc"
    }
    
    Write-Info "Attempting to resume: $branchName"
    
    # Try to checkout locally first
    $localExists = git branch --list $branchName
    if ($localExists) {
        git checkout $branchName
        if ($LASTEXITCODE -eq 0) {
            Write-Success "Resumed work on: $branchName"
            return
        }
    }
    
    # Try to fetch and checkout from remote
    Write-Info "Branch not found locally, checking remote..."
    git fetch origin
    $remoteExists = git ls-remote --heads origin $branchName 2>$null
    if ($remoteExists) {
        git checkout -b $branchName origin/$branchName
        if ($LASTEXITCODE -eq 0) {
            Write-Success "Checked out remote branch: $branchName"
            return
        }
    }
    
    Write-Error2 "Branch not found: $branchName"
    Write-Info "Available WIP branches:"
    Show-WipBranches
}

# Main script
if (-not (Test-GitRepository)) {
    Write-Error2 "Not a git repository. Please run this from a git repository."
    exit 1
}

# Handle different parameter sets
switch ($PSCmdlet.ParameterSetName) {
    'List' {
        Show-WipBranches
        exit 0
    }
    
    'Delete' {
        Remove-WipBranch -branchDesc $Description
        exit 0
    }
    
    'Resume' {
        Resume-WipBranch -branchDesc $Description
        exit 0
    }
    
    'Create' {
        # Get current branch name
        $currentBranch = git branch --show-current
        if (-not $currentBranch) {
            Write-Error2 "Could not determine current branch"
            exit 1
        }
        
        Write-Info "Current branch: $currentBranch"
        
        # Generate timestamp
        $timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
        
        # Create branch name
        $wipBranch = "wip/${Description}_${timestamp}"
        
        Write-Info "Creating WIP branch: $wipBranch"
        
        # Check if there are any changes
        $status = git status --porcelain
        if (-not $status -and -not $NoCommit) {
            Write-Warning2 "No changes to commit. Working tree is clean."
            $response = Read-Host "Create empty WIP branch anyway? (y/N)"
            if ($response -ne 'y' -and $response -ne 'Y') {
                Write-Info "Cancelled."
                exit 0
            }
        }
        
        # Create and switch to WIP branch
        git checkout -b $wipBranch
        if ($LASTEXITCODE -ne 0) {
            Write-Error2 "Failed to create branch"
            exit 1
        }
        
        if (-not $NoCommit) {
            # Stage all changes
            Write-Info "Staging all changes..."
            git add .
            
            # Commit
            if ($Message) {
                $commitMsg = $Message
            } else {
                $commitMsg = "WIP: $Description from $currentBranch"
            }
            
            Write-Info "Committing: $commitMsg"
            git commit -m $commitMsg
            
            if ($LASTEXITCODE -ne 0) {
                Write-Warning2 "Commit failed. Branch created but not committed."
            }
        }
        
        # Push with upstream tracking
        Write-Info "Pushing to remote..."
        git push -u origin $wipBranch
        
        if ($LASTEXITCODE -eq 0) {
            Write-Success "Successfully pushed to: $wipBranch"
            Write-Host ""
            Write-Host "📌 To resume later:" -ForegroundColor Cyan
            Write-Host "   git checkout $wipBranch" -ForegroundColor White
            Write-Host "   or" -ForegroundColor Gray
            Write-Host "   .\scripts\create_wip_branch.ps1 -Resume -Description `"${Description}_${timestamp}`"" -ForegroundColor White
            Write-Host ""
            Write-Host "🗑️  To delete when done:" -ForegroundColor Cyan
            Write-Host "   .\scripts\create_wip_branch.ps1 -Delete -Description `"${Description}_${timestamp}`"" -ForegroundColor White
        } else {
            Write-Error2 "Failed to push branch"
            exit 1
        }
    }
}
