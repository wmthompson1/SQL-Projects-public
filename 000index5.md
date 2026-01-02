#policy requires dev emv**
cd  "C:\Users\williamt\source\skillsinc\skills-inc-org\SQL-Projects"

# 1. Activate virtual environment
.\.venv\Scripts\Activate.

# app - background

# 2. Verify Python and install requirements if needed
python --version
pip install -r .\hf-space-inventory-sqlgen\requirements.txt

# 3. Navigate to the app directory
cd hf-space-inventory-sqlgen

# 4. Run the app to test schema paths
python app.py