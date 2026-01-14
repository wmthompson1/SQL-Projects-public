## Gradio endpoint (app) 1
cd hf-space-inventory-sqlgen; python app.py

## Gradio endpoint (app) 2
cd hf-space-inventory-sqlgen; Start-Process python -ArgumentList "app.py" -WindowStyle Hidden

**If you need to restart it or it's not running, you can use:**
```cd hf-space-inventory-sqlgen
python app.py
```

**Or to run it in the background:**

```
Start-Process -FilePath "python" -ArgumentList "hf-space-inventory-sqlgen/app.py"
```

# Switch to main
git checkout main

# Pull latest (includes the merged PR)
git pull origin main

# If you're on a feature branch and want to rebase/update it with latest main
git checkout your-feature-branch
git rebase main
# or
git merge main