import duckdb
import pandas as pd

# Connect to your local database
conn = duckdb.connect('local. db')

# Read CSV
df = pd.read_csv('seeds/inventory_transactions.csv')

# Create table from CSV
conn.execute("""
    CREATE TABLE IF NOT EXISTS inventory_transactions AS 
    SELECT * FROM df
""")

# Verify
result = conn.execute("SELECT COUNT(*) FROM inventory_transactions").fetchone()
print(f"✓ Loaded {result[0]} rows into inventory_transactions")

conn.close()