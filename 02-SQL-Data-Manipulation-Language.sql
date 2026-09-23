-- Example 1 — Insert a Single Row with All Columns Specified
-- GOAL: Insert a single new customer record into the customers table by explicitly providing values for all available columns.
-- Insert a single new customer
INSERT INTO customers (id, name, email, membership_level, created_at)
VALUES (4, 'Diana Prince', 'diana@example.com', 'Premium', '2026-09-22');

-- Verify inserted data
SELECT id, name, email, membership_level, created_at
FROM customers
WHERE id = 4;


-- Command Result:
-- INSERT 0 1

-- Verification Query Result:
-- id | name         | email             | membership_level | created_at
-- ---+--------------+-------------------+------------------+------------
-- 4  | Diana Prince | diana@example.com | Premium          | 2026-09-22


-- Example 2 — Insert a Single Row Omitting Auto-Incrementing Primary Key
-- GOAL: Insert a new customer without specifying the id column, letting PostgreSQL automatically generate the primary key value using SERIAL.
-- Insert a customer letting PostgreSQL handle the ID
INSERT INTO customers (name, email, membership_level, created_at)
VALUES ('Evan Wright', 'evan@example.com', 'Standard', '2026-09-22');

-- Verify inserted data
SELECT id, name, email, membership_level, created_at
FROM customers
WHERE email = 'evan@example.com';

-- Command Result:
-- INSERT 0 1

-- Verification Query Result:
-- id | name        | email            | membership_level | created_at
-- ---+-------------+------------------+------------------+------------
-- 5  | Evan Wright | evan@example.com | Standard         | 2026-09-22