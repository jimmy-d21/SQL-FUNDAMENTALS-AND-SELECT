-- Remove tables if they already exist to start fresh
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

-- 1. Create Customers Table
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50),
    signup_date DATE NOT NULL
);

-- 2. Create Products Table
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price NUMERIC(10, 2) NOT NULL,
    stock_quantity INT NOT NULL
);

-- 3. Create Orders Table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount NUMERIC(10, 2) NOT NULL,
    status VARCHAR(20) NOT NULL
);

-- Populate Customers
INSERT INTO customers (first_name, last_name, email, city, country, signup_date) VALUES
('John', 'Smith', 'john.smith@example.com', 'New York', 'USA', '2023-01-15'),
('Maria', 'Cruz', 'maria.cruz@example.com', 'Manila', 'Philippines', '2023-02-20'),
('David', 'Lee', NULL, 'Toronto', 'Canada', '2023-03-10'),
('Anna', 'Müller', 'anna.m@example.de', 'Berlin', 'Germany', '2023-04-05'),
('Kenji', 'Sato', 'kenji.s@example.jp', 'Tokyo', 'Japan', '2023-05-12'),
('Sarah', 'Connor', 'sarah.c@example.com', 'New York', 'USA', '2023-06-18'),
('Carlos', 'Gomez', NULL, 'Madrid', 'Spain', '2023-07-22');

-- Populate Products
INSERT INTO products (product_name, category, price, stock_quantity) VALUES
('Wireless Mouse', 'Electronics', 25.50, 150),
('Mechanical Keyboard', 'Electronics', 85.00, 40),
('USB-C Cable', 'Electronics', 12.00, 200),
('Ergonomic Chair', 'Furniture', 250.00, 15),
('Standing Desk', 'Furniture', 450.00, 8),
('Coffee Mug', 'Kitchenware', 15.00, 0),
('Stainless Steel Bottle', 'Kitchenware', 22.00, 75);

-- Populate Orders
INSERT INTO orders (customer_id, order_date, total_amount, status) VALUES
(1, '2024-01-10', 110.50, 'Completed'),
(2, '2024-01-12', 250.00, 'Completed'),
(1, '2024-01-15', 25.50, 'Shipped'),
(3, '2024-01-20', 450.00, 'Pending'),
(4, '2024-02-01', 85.00, 'Cancelled'),
(5, '2024-02-05', 37.00, 'Completed'),
(2, '2024-02-10', 12.00, 'Pending');


-- Example 1 — Select All Columns from Customers
-- GOAL: Retrieve every column and row from customers
SELECT * 
FROM customers;

-- Result:
-- customer_id | first_name | last_name | email                  | city     | country     | signup_date
-- 1           | John       | Smith     | john.smith@example.com | New York | USA         | 2023-01-15
-- 2           | Maria      | Cruz      | maria.cruz@example.com  | Manila   | Philippines | 2023-02-20
-- 3           | David      | Lee       | NULL                   | Toronto  | Canada      | 2023-03-10
-- 4           | Anna       | Müller    | anna.m@example.de      | Berlin   | Germany     | 2023-04-05
-- 5           | Kenji      | Sato      | kenji.s@example.jp     | Tokyo    | Japan       | 2023-05-12
-- 6           | Sarah      | Connor    | sarah.c@example.com    | New York | USA         | 2023-06-18
-- 7           | Carlos     | Gomez     | NULL                   | Madrid   | Spain       | 2023-07-22


-- Example 2 — Select Specific Columns
-- GOAL: Retrieve specific columns
SELECT first_name, last_name, email 
FROM customers;

-- Result:
-- first_name | last_name | email
-- John       | Smith     | john.smith@example.com
-- Maria      | Cruz      | maria.cruz@example.com
-- David      | Lee       | NULL
-- Anna       | Müller    | anna.m@example.de
-- Kenji      | Sato      | kenji.s@example.jp
-- Sarah      | Connor    | sarah.c@example.com
-- Carlos     | Gomez     | NULL


-- Example 3 — Select Product Names and Prices
-- GOAL: Retrieve product details
SELECT product_name, price 
FROM products;

-- Result:
-- product_name          | price
-- Wireless Mouse        | 25.50
-- Mechanical Keyboard   | 85.00
-- USB-C Cable           | 12.00
-- Ergonomic Chair       | 250.00
-- Standing Desk         | 450.00
-- Coffee Mug            | 15.00
-- Stainless Steel Bottle | 22.00


-- Example 4 — Rename Column Output Using Column Aliases
-- GOAL: Using 'AS' to rename column headers in the output
SELECT 
    product_name AS Item, 
    price AS Cost_in_USD 
FROM products;

-- Result:
-- Item                   | cost_in_usd
-- Wireless Mouse        | 25.50
-- Mechanical Keyboard   | 85.00
-- USB-C Cable           | 12.00
-- Ergonomic Chair       | 250.00
-- Standing Desk         | 450.00
-- Coffee Mug            | 15.00
-- Stainless Steel Bottle | 22.00


-- Example 5 — Perform Arithmetic Calculations in SELECT
-- GOAL: Calculating 90% of price to show discounted price
SELECT product_name, price, price * 0.90 AS discounted_price 
FROM products;

-- Result:
-- product_name          | price  | discounted_price
-- Wireless Mouse        | 25.50  | 22.9500
-- Mechanical Keyboard   | 85.00  | 76.5000
-- USB-C Cable           | 12.00  | 10.8000
-- Ergonomic Chair       | 250.00 | 225.0000
-- Standing Desk         | 450.00 | 405.0000
-- Coffee Mug            | 15.00  | 13.5000
-- Stainless Steel Bottle | 22.00  | 19.8000


-- Example 6 — Combine First and Last Names (String Concatenation)
-- GOAL: Concatenating strings in PostgreSQL using ||
SELECT first_name || ' ' || last_name AS full_name 
FROM customers;

-- Result:
-- full_name
-- John Smith
-- Maria Cruz
-- David Lee
-- Anna Müller
-- Kenji Sato
-- Sarah Connor
-- Carlos Gomez


-- Example 7 — Select Unique Categories Using DISTINCT
-- Select distinct categories
SELECT DISTINCT category 
FROM products;

-- Result:
-- category
-- Kitchenware
-- Electronics
-- Furniture


-- Example 8 — Calculate Total Inventory Value Per Product
-- GOAL: Multiply two columns together
SELECT 
    product_name, 
    price, stock_quantity, 
    (price * stock_quantity) AS total_inventory_value 
FROM products;

-- Result:
-- product_name          | price  | stock_quantity | total_inventory_value
-- Wireless Mouse        | 25.50  | 150            | 3825.00
-- Mechanical Keyboard   | 85.00  | 40             | 3400.00
-- USB-C Cable           | 12.00  | 200            | 2400.00
-- Ergonomic Chair       | 250.00 | 15             | 3750.00
-- Standing Desk         | 450.00 | 8              | 3600.00
-- Coffee Mug            | 15.00  | 0              | 0.00
-- Stainless Steel Bottle | 22.00  | 75             | 1650.00


-- Example 9 — Find Unique Customer Countries
-- GOAL: Find unique countries
SELECT DISTINCT country 
FROM customers;

-- Result:
-- country
-- Germany
-- USA
-- Philippines
-- Japan
-- Canada
-- Spain


-- Example 10 — Select Order Status Options
-- GOAL: Get unique statuses
SELECT DISTINCT status 
FROM orders;

-- Result:
-- status
-- Cancelled
-- Completed
-- Pending
-- Shipped


-- Example 11 — Filter Exact Match with WHERE (=)
-- GOAL: Filter rows using WHERE and equality operator
SELECT * 
FROM customers 
WHERE country = 'USA';

-- Result:
-- customer_id | first_name | last_name | email                  | city     | country | signup_date
-- 1           | John       | Smith     | john.smith@example.com | New York | USA     | 2023-01-15
-- 6           | Sarah      | Connor    | sarah.c@example.com    | New York | USA     | 2023-06-18


-- Example 12 — Filter Products Greater Than a Price (>)
-- GOAL: Filter for prices strictly greater than 50
SELECT product_name, price 
FROM products 
WHERE price > 50.00;

-- Result:
-- product_name        | price
-- Mechanical Keyboard | 85.00
-- Ergonomic Chair     | 250.00
-- Standing Desk       | 450.00


-- Example 13 — Filter Products Less Than or Equal To (<=)
-- GOAL: Filter using <= operator
SELECT product_name, price 
FROM products 
WHERE price <= 25.50;

-- Result:
-- product_name          | price
-- Wireless Mouse        | 25.50
-- USB-C Cable           | 12.00
-- Coffee Mug            | 15.00
-- Stainless Steel Bottle | 22.00


-- Example 14 — Filter with Not Equal Operator (<>)
-- GOAL: Select non-electronics products
SELECT product_name, category 
FROM products 
WHERE category <> 'Electronics';

-- Result:
-- product_name          | category
-- Ergonomic Chair       | Furniture
-- Standing Desk         | Furniture
-- Coffee Mug            | Kitchenware
-- Stainless Steel Bottle | Kitchenware


-- Example 15 — Filter Orders using Less Than (<)
-- GOAL: Orders under $100
SELECT order_id, total_amount, status 
FROM orders 
WHERE total_amount < 100.00;

-- Result:
-- order_id | total_amount | status
-- 3        | 25.50        | Shipped
-- 5        | 85.00        | Cancelled
-- 6        | 37.00        | Completed
-- 7        | 12.00        | Pending


-- Example 16 — Filter with AND Condition
-- GOAL: Both conditions must be TRUE
SELECT product_name, category, price 
FROM products 
WHERE category = 'Electronics' AND price < 50.00;

-- Result:
-- product_name  | category    | price
-- Wireless Mouse | Electronics | 25.50
-- USB-C Cable    | Electronics | 12.00


-- Example 17 — Filter with OR Condition
-- GOAL: Either condition can be TRUE
SELECT first_name, last_name, country 
FROM customers 
WHERE country = 'USA' OR country = 'Germany';

-- Result:
-- first_name | last_name | country
-- John       | Smith     | USA
-- Anna       | Müller    | Germany
-- Sarah      | Connor    | USA


-- Example 18 — Combine AND with OR Using Parentheses
-- GOAL: Use parentheses to group logical conditions correctly
SELECT product_name, category, stock_quantity 
FROM products 
WHERE (category = 'Electronics' OR category = 'Furniture') 
  AND stock_quantity > 10;

-- Result:
-- product_name       | category    | stock_quantity
-- Wireless Mouse     | Electronics | 150
-- Mechanical Keyboard| Electronics | 40
-- USB-C Cable        | Electronics | 200
-- Ergonomic Chair    | Furniture   | 15


-- Example 19 — Filter Using NOT Operator
-- GOAL: Negating a condition
SELECT first_name, country 
FROM customers 
WHERE NOT (country = 'USA');

-- Result:
-- first_name | country
-- Maria      | Philippines
-- David      | Canada
-- Anna       | Germany
-- Kenji      | Japan
-- Carlos     | Spain


-- Example 20 — Filter Orders by Greater Than or Equal To Date (>=)
-- GOAL: Filtering dates
SELECT order_id, order_date, total_amount 
FROM orders 
WHERE order_date >= '2024-02-01';

-- Result:
-- order_id | order_date | total_amount
-- 5        | 2024-02-01 | 85.00
-- 6        | 2024-02-05 | 37.00
-- 7        | 2024-02-10 | 12.00


-- Example 21 — Filter Multiple Specific Values with IN
-- GOAL: Match against a list of options using IN
SELECT first_name, country 
FROM customers 
WHERE country IN ('USA', 'Japan', 'Germany');

-- Result:
-- first_name | country
-- John       | USA
-- Anna       | Germany
-- Kenji      | Japan
-- Sarah      | USA


-- Example 22 — Exclude Multiple Values using NOT IN
-- GOAL: Find customers who do NOT live in USA or Canada.
-- Exclude specific list of options
SELECT first_name, country 
FROM customers 
WHERE country NOT IN ('USA', 'Canada');

-- Result:
-- first_name | country
-- Maria      | Philippines
-- Anna       | Germany
-- Kenji      | Japan
-- Carlos     | Spain


-- Example 23 — Filter Values in a Range using BETWEEN
-- GOAL: Find products priced between $20.00 and $100.00 inclusive.
-- Range filter with BETWEEN
SELECT product_name, price 
FROM products 
WHERE price BETWEEN 20.00 AND 100.00;

-- Result:
-- product_name          | price
-- Wireless Mouse        | 25.50
-- Mechanical Keyboard   | 85.00
-- Stainless Steel Bottle | 22.00


-- Example 24 — Pattern Matching with LIKE (%)
-- GOAL: Find products whose name starts with the letter 'S'.
-- Find matching prefixes using % wild-card
SELECT product_name 
FROM products 
WHERE product_name LIKE 'S%';

-- Result:
-- product_name
-- Standing Desk
-- Stainless Steel Bottle


-- Example 25 — Case-Insensitive Pattern Matching with ILIKE
-- GOAL: Search for customers whose city contains 'york' regardless of uppercase/lowercase.
-- ILIKE is PostgreSQL-specific for case-insensitive pattern matching
SELECT first_name, city 
FROM customers 
WHERE city ILIKE '%york%';

-- Result:
-- first_name | city
-- John       | New York
-- Sarah      | New York


-- Example 26 — Pattern Matching Single Character with Underscore (_)
-- GOAL: Find products where the second letter of the category name is 'u'.
-- _ wildcard matches exactly one character
SELECT product_name, category 
FROM products 
WHERE category LIKE '_u%';

-- Result:
-- product_name   | category
-- Ergonomic Chair| Furniture
-- Standing Desk  | Furniture


-- Example 27 — Filter Missing Data with IS NULL
-- GOAL: Find all customers who do NOT have an email address recorded.
-- Check for missing/NULL values
SELECT first_name, last_name, email 
FROM customers 
WHERE email IS NULL;

-- Result:
-- first_name | last_name | email
-- David      | Lee       | NULL
-- Carlos     | Gomez     | NULL


-- Example 28 — Filter Existing Data with IS NOT NULL
-- GOAL: Find all customers who have a valid email address listed.
-- Filter out NULL values
SELECT first_name, email 
FROM customers 
WHERE email IS NOT NULL;

-- Result:
-- first_name | email
-- John       | john.smith@example.com
-- Maria      | maria.cruz@example.com
-- Anna       | anna.m@example.de
-- Kenji      | kenji.s@example.jp
-- Sarah      | sarah.c@example.com


-- Example 29 — Filter Out Matching Patterns using NOT LIKE
-- GOAL: Find products whose names do NOT contain the word 'Wireless'.
-- Negating pattern match
SELECT product_name 
FROM products 
WHERE product_name NOT LIKE '%Wireless%';

-- Result:
-- product_name
-- Mechanical Keyboard
-- USB-C Cable
-- Ergonomic Chair
-- Standing Desk
-- Coffee Mug
-- Stainless Steel Bottle


-- Example 30 — Combine Range and Exclusion Filters
-- GOAL: Find orders with total_amount between $20 and $300 AND status IS NOT 'Cancelled'.
-- Combining BETWEEN, AND, and NOT EQUAL
SELECT order_id, total_amount, status 
FROM orders 
WHERE (total_amount BETWEEN 20.00 AND 300.00) 
  AND status <> 'Cancelled';

-- Result:
-- order_id | total_amount | status
-- 1        | 110.50       | Completed
-- 2        | 250.00       | Completed
-- 3        | 25.50        | Shipped
-- 6        | 37.00        | Completed


-- Example 31 — Sort Results Ascending with ORDER BY
-- GOAL: List all products sorted by price from lowest to highest.
-- Sorting rows ascending (ASC)
SELECT product_name, price 
FROM products 
ORDER BY price ASC;

-- Result:
-- product_name          | price
-- USB-C Cable           | 12.00
-- Coffee Mug            | 15.00
-- Stainless Steel Bottle | 22.00
-- Wireless Mouse        | 25.50
-- Mechanical Keyboard   | 85.00
-- Ergonomic Chair       | 250.00
-- Standing Desk         | 450.00


-- Example 32 — Sort Results Descending with ORDER BY DESC
-- GOAL: List orders sorted by total amount from highest to lowest.
-- Sort descending (DESC)
SELECT order_id, total_amount, status 
FROM orders 
ORDER BY total_amount DESC;

-- Result:
-- order_id | total_amount | status
-- 4        | 450.00       | Pending
-- 2        | 250.00       | Completed
-- 1        | 110.50       | Completed
-- 5        | 85.00        | Cancelled
-- 6        | 37.00        | Completed
-- 3        | 25.50        | Shipped
-- 7        | 12.00        | Pending