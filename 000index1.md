# venv
PS C:\Users\williamt\source\skillsinc\skills-inc-org\SQL-Projects> Get-ChildItem .\.venv\Scripts -Force | Select-Object Name

Name
----
activate
activate.bat
Activate.ps1
deactivate.bat
pip.exe
pip3.11.exe
pip3.exe
python.exe
pythonw.exe

PS C:\Users\williamt\source\skillsinc\skills-inc-org\SQL-Projects> & .\.venv\Scripts\python.exe -m pip install --upgrade pip
Requirement already satisfied: pip in c:\users\williamt\source\skillsinc\skills-inc-org\sql-projects\.venv\lib\site-packages (24.0)
Collecting pip
  Using cached pip-25.3-py3-none-any.whl.metadata (4.7 kB)
Using cached pip-25.3-py3-none-any.whl (1.8 MB)
Installing collected packages: pip
  Attempting uninstall: pip
    Found existing installation: pip 24.0
    Uninstalling pip-24.0:
      Successfully uninstalled pip-24.0
Successfully installed pip-25.3

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