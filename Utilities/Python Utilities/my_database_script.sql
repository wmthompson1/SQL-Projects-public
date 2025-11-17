-- This is a sample SQL script
CREATE TABLE users (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE
);
INSERT INTO users (id, name, email) VALUES (1, 'Alice', 'alice@example.com');
