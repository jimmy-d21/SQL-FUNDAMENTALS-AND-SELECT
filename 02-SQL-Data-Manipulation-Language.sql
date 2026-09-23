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


-- Example 3 — Insert Multiple Rows in a Single Query
-- GOAL: Insert three new products into the products table using one INSERT statement.
-- Insert three products at once
INSERT INTO products (name, price, stock_quantity, is_available)
VALUES 
  ('Cheese Dog', 95.00, 30, true),
  ('Milk Tea', 110.00, 45, true),
  ('Onion Rings', 75.00, 20, true);

-- Verify inserted data
SELECT id, name, price, stock_quantity, is_available
FROM products
WHERE id >= 4;

-- Command Result:
-- INSERT 0 3

-- Verification Query Result:
-- id | name        | price  | stock_quantity | is_available
-- ---+-------------+--------+----------------+--------------
-- 4  | Cheese Dog  |  95.00 |             30 | t
-- 5  | Milk Tea    | 110.00 |             45 | t
-- 6  | Onion Rings |  75.00 |             20 | t