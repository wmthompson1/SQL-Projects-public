# Quick Reference: Push Local Changes to WIP Branch

## The Command You Mentioned

```bash
git push -u origin wip/local-changes_20260205-163530
```

## What This Does

1. **`git push`** - Uploads your local commits to the remote repository (GitHub)
2. **`-u`** - Sets up tracking so future pushes don't need to specify the branch
3. **`origin`** - The name of your remote repository (typically GitHub)
4. **`wip/local-changes_20260205-163530`** - The branch name
   - `wip/` - Prefix indicating "work in progress"
   - `local-changes` - Description of what's in the branch
   - `20260205-163530` - Timestamp (Feb 5, 2026 at 4:35:30 PM)

## Complete Workflow

### Step 1: Make Sure You're on the Right Branch

```bash
# Check current branch
git branch

# If not on WIP branch, create it
git checkout -b wip/local-changes_20260205-163530
```

### Step 2: Stage Your Changes

```bash
# Stage all changes
git add .

# Or stage specific files
git add path/to/file1.txt path/to/file2.py
```

### Step 3: Commit Your Changes

```bash
# Commit with a message
git commit -m "WIP: describe your changes here"
```

### Step 4: Push to Remote

```bash
# First time pushing this branch (use -u)
git push -u origin wip/local-changes_20260205-163530

# Subsequent pushes (no -u needed)
git push
```

## Using PowerShell (Windows)

### Quick Method

```powershell
# Navigate to repository
cd C:\Users\williamt\source\skillsinc\skills-inc-org\SQL-Projects

# Use the helper script
.\scripts\create_wip_branch.ps1 -Description "local-changes"
```

This automatically:
- ✅ Creates a branch with timestamp
- ✅ Stages all changes
- ✅ Commits with WIP message
- ✅ Pushes to remote with tracking

### Manual Method

```powershell
# Create timestamp
$timestamp = Get-Date -Format "yyyyMMdd-HHmmss"

# Create and switch to WIP branch
git checkout -b "wip/local-changes_$timestamp"

# Stage all changes
git add .

# Commit
git commit -m "WIP: local changes"

# Push with tracking
git push -u origin "wip/local-changes_$timestamp"
```

## Troubleshooting

### Error: "src refspec ... does not match any"

This means the branch doesn't exist locally yet. Create it first:

```bash
git checkout -b wip/local-changes_20260205-163530
```

### Error: "No commits yet"

You need to commit changes before pushing:

```bash
git add .
git commit -m "WIP: initial changes"
git push -u origin wip/local-changes_20260205-163530
```

### Error: "Updates were rejected"

The remote has changes you don't have locally. Pull first:

```bash
git pull origin wip/local-changes_20260205-163530
git push
```

### Want to Push Without Committing?

You can't push without commits. Either:

1. **Commit your changes** (recommended for WIP branches)
   ```bash
   git add .
   git commit -m "WIP: work in progress"
   git push -u origin wip/local-changes_20260205-163530
   ```

2. **Stash and create empty branch** (not recommended)
   ```bash
   git stash
   git checkout -b wip/local-changes_20260205-163530
   git push -u origin wip/local-changes_20260205-163530
   git stash pop
   ```

## When to Use WIP Branches

✅ **DO use WIP branches for:**
- Backing up work in progress
- Switching between tasks
- Sharing draft code with teammates
- Experimenting without fear of breaking things

❌ **DON'T use WIP branches for:**
- Final code ready for production
- Code review (use proper feature branches/PRs instead)
- Long-term storage (clean them up after merging)

## After Creating Your WIP Branch

### Continue Working

```bash
# Make more changes
# ... edit files ...

# Commit and push again
git add .
git commit -m "WIP: more changes"
git push  # no -u needed, already tracking
```

### Resume Work Later

```bash
# List WIP branches
git branch -a | grep wip/

# Checkout your WIP branch
git checkout wip/local-changes_20260205-163530

# Or use helper script
.\scripts\create_wip_branch.ps1 -Resume -Description "local-changes_20260205-163530"
```

### Clean Up When Done

```bash
# Delete local branch
git branch -D wip/local-changes_20260205-163530

# Delete remote branch
git push origin --delete wip/local-changes_20260205-163530

# Or use helper script
.\scripts\create_wip_branch.ps1 -Delete -Description "local-changes_20260205-163530"
```

## Helper Commands

```bash
# List all WIP branches
git branch -a | grep wip/

# Or use helper script
.\scripts\create_wip_branch.ps1 -List

# Show last commit on each WIP branch
git for-each-ref --sort=-committerdate refs/heads/wip/ --format='%(committerdate:short) %(refname:short)'

# Check what would be pushed
git diff origin/wip/local-changes_20260205-163530

# Check status
git status
```

## Related Documentation

- [Git_WIP_Branch_Workflow.md](../Documentation/Git_WIP_Branch_Workflow.md) - Complete workflow guide
- [PowerShell_Python_Scripts.md](../Documentation/PowerShell_Python_Scripts.md) - PowerShell syntax help

## Quick Commands Cheat Sheet

| Action | Command |
|--------|---------|
| Create WIP branch | `git checkout -b wip/name_timestamp` |
| Stage changes | `git add .` |
| Commit changes | `git commit -m "WIP: description"` |
| Push (first time) | `git push -u origin wip/name_timestamp` |
| Push (subsequent) | `git push` |
| List WIP branches | `git branch -a \| grep wip/` |
| Resume WIP | `git checkout wip/name_timestamp` |
| Delete WIP | `git branch -D wip/name && git push origin --delete wip/name` |

---

**Need help?** See the full documentation at `Documentation/Git_WIP_Branch_Workflow.md`
