import duckdb
conn = duckdb.connect('Utilities/SQLMesh/local.db')
conn.execute("""
CREATE TABLE IF NOT EXISTS labor_ticket_batch_processing (
    ticket_id INTEGER,
    batch_id INTEGER,
    labor_hours DECIMAL(10,2),
    created_at TIMESTAMP
)
""")
conn.execute("""
INSERT INTO labor_ticket_batch_processing VALUES
    (1,100,8.50,'2026-01-01 09:00:00'),
    (2,100,6.00,'2026-01-01 10:00:00'),
    (3,101,7.50,'2026-01-02 09:00:00')
""")
conn.close()
print("✓ Created production table in Utilities/SQLMesh/local.db")