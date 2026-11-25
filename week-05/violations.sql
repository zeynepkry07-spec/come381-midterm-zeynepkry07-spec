\set VERBOSITY verbose

-- Test 1: NOT NULL violation
INSERT INTO customer (full_name, email)
VALUES (NULL, 'test@example.com');

-- Test 2: UNIQUE violation
INSERT INTO customer (full_name, email)
VALUES ('Test Customer', 'duplicate@example.com');

INSERT INTO customer (full_name, email)
VALUES ('Another Customer', 'duplicate@example.com');

-- Test 3: Positive price violation
INSERT INTO book (title, author, price, stock_quantity)
VALUES ('Test Book', 'Test Author', -50, 10);

-- Test 4: Negative stock violation
INSERT INTO book (title, author, price, stock_quantity)
VALUES ('Stock Test', 'Test Author', 100, -5);

-- Test 5: Invalid status violation
INSERT INTO book (title, author, price, stock_quantity, status)
VALUES ('Status Test', 'Test Author', 100, 10, 'invalid');

-- Test 6: Invalid delivery date
INSERT INTO orders (customer_id, order_date, delivery_date)
VALUES (
    (SELECT customer_id FROM customer
     WHERE email = 'duplicate@example.com'),
    '2026-10-20',
    '2026-10-10'
);

-- Test 7: Foreign key violation
INSERT INTO orders (customer_id, order_date)
VALUES (999999, '2026-10-20');

-- Remove successful test data
DELETE FROM customer
WHERE email = 'duplicate@example.com';
