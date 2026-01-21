You're looking in the **VS Code settings**, but GitHub repository secrets are in the **GitHub web interface**. Here's how to find them:

## Navigate to GitHub Repository Secrets

### Step 1: Open GitHub in Browser

````powershell
# Open your repository in default browser
Start-Process "https://github.com/Skills-Inc-Org/SQL-Projects"
````

### Step 2: Navigate to Settings

1. **Click "Settings" tab** (top right, next to "Insights")
   - If you don't see "Settings", you may not have admin access to the repository
   - Contact the repository owner to grant you admin/write permissions

### Step 3: Navigate to Secrets

In the left sidebar under "Security":

```
Settings (page)
├── General
├── Collaborators and teams
├── ...
└── Security (section)
    ├── Code security and analysis
    ├── Deploy keys
    ├── Secrets and variables  ← Click here
    │   ├── Actions  ← Click here
    │   ├── Codespaces
    │   └── Dependabot
    └── ...
```

**Full path:** `Settings` → `Secrets and variables` → `Actions`

**Direct URL:**
```
https://github.com/Skills-Inc-Org/SQL-Projects/settings/secrets/actions
```

---

## Adding Secrets for ArangoDB

### Click "New repository secret" button

Add these four secrets:

| Secret Name | Secret Value | Notes |
|-------------|--------------|-------|
| `ARANGO_HOST` | `http://your-arango-server:8529` | **Not localhost** - must be accessible from GitHub Actions runners |
| `ARANGO_USER` | `root` | Or dedicated service account |
| `ARANGO_PASSWORD` | `Se206attle_rocks` | From your [`.env`](.env ) file |
| `ARANGO_DB` | `manufacturing_graph` | Database name |

---

## Important: ArangoDB Host Configuration

**Problem:** GitHub Actions runs on **GitHub's servers**, not your local machine.

**Solutions:**

### Option 1: Self-Hosted Runner (Recommended)

Set up a GitHub Actions runner **on your network** that can access `sql-lab-1` and your local ArangoDB:

````powershell
# Install GitHub Actions runner on a Windows server in your network
# Follow: https://docs.github.com/en/actions/hosting-your-own-runners/adding-self-hosted-runners

# Then set ARANGO_HOST to internal server:
# ARANGO_HOST=http://internal-arango-server:8529
````

**Update workflows to use self-hosted runner:**

````yaml
jobs:
  sync-graph:
    runs-on: self-hosted  # Changed from windows-latest
    # ...existing code...
````

### Option 2: Cloud-Hosted ArangoDB

Deploy ArangoDB to a cloud service accessible from GitHub:

- **ArangoDB Cloud** (Oasis): https://cloud.arangodb.com
- **Azure Container Instances**
- **AWS ECS/Fargate**
- **DigitalOcean App Platform**

Then set `ARANGO_HOST` to the public URL:
```
ARANGO_HOST=https://your-instance.arangodb.cloud:8529
```

### Option 3: Expose Local ArangoDB (Not Recommended for Production)

Use a secure tunnel service temporarily for testing:

````powershell
# Install ngrok: https://ngrok.com/download
choco install ngrok

# Expose local ArangoDB
ngrok http 8529

# Use ngrok URL in GitHub secrets
# ARANGO_HOST=https://abc123.ngrok.io
````

**⚠️ Security Warning:** Only use for testing. Requires authentication and HTTPS in production.

---

## Verify Secret Access

After adding secrets, check workflow runs can access them:

````yaml
name: Test Secrets Access

on:
  workflow_dispatch:

jobs:
  test:
    runs-on: windows-latest
    
    steps:
      - name: Test secret access
        run: |
          echo "ARANGO_HOST is set: ${{ secrets.ARANGO_HOST != '' }}"
          echo "ARANGO_USER is set: ${{ secrets.ARANGO_USER != '' }}"
          echo "ARANGO_PASSWORD is set: ${{ secrets.ARANGO_PASSWORD != '' }}"
          echo "ARANGO_DB is set: ${{ secrets.ARANGO_DB != '' }}"
        env:
          # Don't print actual values - GitHub masks them anyway
          ARANGO_HOST: ${{ secrets.ARANGO_HOST }}
````

---

## Troubleshooting Access Issues

### Issue: "Settings tab not visible"

**Cause:** You don't have admin permissions  
**Solution:** Ask repository owner to:
1. Go to `Settings` → `Collaborators and teams`
2. Add you with **Admin** or **Write** role

### Issue: "Cannot add secrets"

**Cause:** Insufficient permissions  
**Solution:** Need **Admin** role on repository

### Issue: "Secrets not accessible in workflow"

**Cause:** Workflow syntax error or secret name mismatch  
**Solution:** 
- Ensure secret names match exactly (case-sensitive)
- Use `${{ secrets.SECRET_NAME }}` syntax
- Check workflow syntax is valid YAML

---

## Summary

**VS Code Settings ≠ GitHub Repository Secrets**

To configure GitHub Actions secrets:

1. ✅ Open repository in 