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


-- Example 1 — Select All Columns from Customers Goal
-- Retrieve every column and row from customers
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


-- Example 2 — Select Specific Columns Goal
-- Retrieve specific columns
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