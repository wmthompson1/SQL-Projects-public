# Git WIP (Work-In-Progress) Branch Workflow

## Overview

This guide helps you manage work-in-progress (WIP) branches for saving and sharing local changes before they're ready for a formal pull request.

## Quick Start

### Push Local Changes to a WIP Branch

```bash
# Method 1: Use the helper script (recommended)
.\scripts\create_wip_branch.ps1

# Method 2: Manual commands
git checkout -b wip/local-changes_$(date +%Y%m%d-%H%M%S)
git add .
git commit -m "WIP: saving local changes"
git push -u origin wip/local-changes_$(date +%Y%m%d-%H%M%S)
```

### PowerShell Version

```powershell
# Create WIP branch with timestamp
$timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
$branchName = "wip/local-changes_$timestamp"
git checkout -b $branchName
git add .
git commit -m "WIP: saving local changes"
git push -u origin $branchName
```

## Understanding the Command

### Original Command Breakdown

```bash
git push -u origin wip/local-changes_20260205-163530
```

- `git push`: Uploads local commits to remote repository
- `-u`: Sets upstream tracking (short for `--set-upstream`)
- `origin`: The remote repository name
- `wip/local-changes_20260205-163530`: The branch name
  - `wip/` prefix: Convention for work-in-progress branches
  - `local-changes`: Descriptive name
  - `20260205-163530`: Timestamp (YYYYMMDD-HHMMSS)

### What `-u` (--set-upstream) Does

The `-u` flag creates a tracking relationship between your local branch and the remote branch. After running this once:

```bash
# First time (with -u)
git push -u origin wip/local-changes_20260205-163530

# Subsequent pushes (no -u needed)
git push  # automatically pushes to tracked remote branch
```

## WIP Branch Naming Convention

### Recommended Patterns

1. **With Timestamp** (prevents conflicts):
   ```
   wip/local-changes_20260205-163530
   wip/feature-name_20260205-163530
   wip/bugfix-auth_20260205-163530
   ```

2. **With Username** (for team environments):
   ```
   wip/williamt/local-changes
   wip/williamt/feature-x
   ```

3. **Descriptive Names**:
   ```
   wip/exploring-new-api
   wip/testing-performance-fix
   wip/draft-documentation
   ```

## Common Workflows

### Scenario 1: Save Current Work Before Switching Tasks

```bash
# Save everything to a WIP branch
git checkout -b wip/pausing-feature-x_$(date +%Y%m%d-%H%M%S)
git add .
git commit -m "WIP: pausing work on feature X"
git push -u origin wip/pausing-feature-x_$(date +%Y%m%d-%H%M%S)

# Switch to another task
git checkout main
git checkout -b feature/urgent-fix
```

### Scenario 2: Share Unfinished Work with Team

```bash
# Create WIP branch with descriptive name
git checkout -b wip/draft-api-integration
git add .
git commit -m "WIP: draft API integration - needs review"
git push -u origin wip/draft-api-integration

# Share the branch name with your team
# They can review with: git fetch && git checkout wip/draft-api-integration
```

### Scenario 3: Backup Before Risky Changes

```bash
# Create backup WIP branch
git checkout -b wip/backup-before-refactor_$(date +%Y%m%d-%H%M%S)
git add .
git commit -m "WIP: backup before major refactor"
git push -u origin wip/backup-before-refactor_$(date +%Y%m%d-%H%M%S)

# Return to main branch and make changes
git checkout main
# ... make risky changes ...
```

### Scenario 4: Resume Work from WIP Branch

```bash
# List all WIP branches
git branch -a | grep wip/

# Fetch and checkout a WIP branch
git fetch origin
git checkout wip/local-changes_20260205-163530

# Continue working
# ... make changes ...
git add .
git commit -m "WIP: continued work"
git push  # no -u needed, already tracking
```

## PowerShell Script Example

Save this as `create_wip_branch.ps1`:

```powershell
# Get current branch name
$currentBranch = git branch --show-current

# Generate timestamp
$timestamp = Get-Date -Format "yyyyMMdd-HHmmss"

# Ask for description
$description = Read-Host "Enter WIP description (default: local-changes)"
if ([string]::IsNullOrWhiteSpace($description)) {
    $description = "local-changes"
}

# Create branch name
$wipBranch = "wip/${description}_${timestamp}"

Write-Host "Creating WIP branch: $wipBranch" -ForegroundColor Cyan

# Create and switch to WIP branch
git checkout -b $wipBranch

# Stage all changes
git add .

# Commit
$commitMsg = "WIP: $description from $currentBranch"
git commit -m $commitMsg

# Push with upstream tracking
git push -u origin $wipBranch

Write-Host "✅ Successfully pushed to $wipBranch" -ForegroundColor Green
Write-Host "To resume: git checkout $wipBranch" -ForegroundColor Yellow
```

## Best Practices

### DO ✅

1. **Use timestamps** to avoid branch name conflicts
2. **Include descriptive names** beyond just "local-changes"
3. **Commit frequently** to WIP branches (they're meant to be rough)
4. **Delete WIP branches** after merging to keep repository clean
5. **Use WIP prefix** to clearly indicate the branch status

### DON'T ❌

1. **Don't merge WIP branches directly to main** - convert to proper feature branches first
2. **Don't keep WIP branches forever** - they're temporary by nature
3. **Don't use WIP branches for code review** - create proper PRs instead
4. **Don't share sensitive data** in WIP branch commits
5. **Don't rebase WIP branches** if others are using them

## Cleaning Up WIP Branches

### Delete Local WIP Branch

```bash
git branch -d wip/local-changes_20260205-163530
```

### Delete Remote WIP Branch

```bash
git push origin --delete wip/local-changes_20260205-163530
```

### Delete All Local WIP Branches (be careful!)

```bash
# List them first
git branch | grep wip/

# Delete each one
git branch | grep wip/ | xargs git branch -D
```

### Find Stale WIP Branches

```bash
# Show branches with last commit date
git for-each-ref --sort=-committerdate refs/heads/wip/ --format='%(committerdate:short) %(refname:short)'

# On remote
git for-each-ref --sort=-committerdate refs/remotes/origin/wip/ --format='%(committerdate:short) %(refname:short)'
```

## Troubleshooting

### Error: "fatal: 'origin' does not appear to be a git repository"

```bash
# Check remote configuration
git remote -v

# Add origin if missing
git remote add origin https://github.com/Skills-Inc-Org/SQL-Projects.git
```

### Error: "src refspec wip/... does not match any"

The branch doesn't exist locally. Create it first:

```bash
git checkout -b wip/local-changes_20260205-163530
git add .
git commit -m "WIP: initial commit"
git push -u origin wip/local-changes_20260205-163530
```

### Error: "Updates were rejected because the tip of your current branch is behind"

Someone else pushed to the same WIP branch:

```bash
# Pull changes first
git pull origin wip/local-changes_20260205-163530

# Then push
git push
```

### Can't Find Your WIP Branch

```bash
# Fetch all remote branches
git fetch --all

# List all WIP branches
git branch -a | grep wip/

# Checkout the branch
git checkout wip/local-changes_20260205-163530
```

## Converting WIP to Feature Branch

When your WIP work is ready for proper review:

```bash
# 1. Create a new feature branch from your WIP branch
git checkout wip/local-changes_20260205-163530
git checkout -b feature/add-new-functionality

# 2. Clean up commits (optional, but recommended)
git rebase -i HEAD~5  # Interactive rebase last 5 commits

# 3. Push feature branch
git push -u origin feature/add-new-functionality

# 4. Create Pull Request on GitHub

# 5. Delete WIP branch after PR is merged
git branch -d wip/local-changes_20260205-163530
git push origin --delete wip/local-changes_20260205-163530
```

## Quick Reference

| Task | Command |
|------|---------|
| Create WIP branch | `git checkout -b wip/name_$(date +%Y%m%d-%H%M%S)` |
| Commit changes | `git add . && git commit -m "WIP: description"` |
| Push new WIP branch | `git push -u origin wip/name_timestamp` |
| Push to existing WIP | `git push` |
| List WIP branches | `git branch -a \| grep wip/` |
| Delete local WIP | `git branch -D wip/name` |
| Delete remote WIP | `git push origin --delete wip/name` |
| Resume WIP work | `git checkout wip/name_timestamp` |

## Related Documentation

- [PowerShell_Python_Scripts.md](../Documentation/PowerShell_Python_Scripts.md) - PowerShell command syntax
- [Git Branching Best Practices](https://git-scm.com/book/en/v2/Git-Branching-Branching-Workflows)

## Summary

WIP branches are your safety net for:
- 💾 Backing up unfinished work
- 🔄 Switching between tasks
- 🤝 Sharing draft code with teammates
- 🧪 Experimenting without fear

Use the timestamp naming convention (`wip/description_YYYYMMDD-HHMMSS`) to avoid conflicts and make it easy to track when changes were made.
