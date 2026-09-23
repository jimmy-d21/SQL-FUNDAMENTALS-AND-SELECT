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