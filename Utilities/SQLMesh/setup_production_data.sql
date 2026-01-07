CREATE TABLE IF NOT EXISTS labor_ticket_batch_processing (
    ticket_id INTEGER,
    batch_id INTEGER,
    labor_hours DECIMAL(10,2),
    created_at TIMESTAMP
);

INSERT INTO labor_ticket_batch_processing VALUES
    (1, 100, 8.5, '2026-01-01 09:00:00'),
    (2, 100, 6.0, '2026-01-01 10:00:00'),
    (3, 101, 7.5, '2026-01-02 09:00:00');