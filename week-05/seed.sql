INSERT INTO customer (full_name, email) VALUES
('Elif Yilmaz', 'elif@example.com'),
('Deniz Kaya', 'deniz@example.com'),
('Ece Demir', 'ece@example.com'),
('Mert Aydin', 'mert@example.com'),
('Selin Arslan', 'selin@example.com');

INSERT INTO book (title, author, price, stock_quantity, status) VALUES
('Pride and Prejudice', 'Jane Austen', 250, 20, 'active'),
('1984', 'George Orwell', 180, 15, 'active'),
('The Little Prince', 'Antoine de Saint-Exupery', 120, 30, 'active'),
('Jane Eyre', 'Charlotte Bronte', 300, 10, 'active'),
('The Great Gatsby', 'F. Scott Fitzgerald', 200, 0, 'inactive');

INSERT INTO orders (customer_id, order_date, delivery_date)
SELECT customer_id, '2026-10-15', '2026-10-18'
FROM customer WHERE email = 'elif@example.com';

INSERT INTO orders (customer_id, order_date, delivery_date)
SELECT customer_id, '2026-10-16', '2026-10-20'
FROM customer WHERE email = 'deniz@example.com';

INSERT INTO orders (customer_id, order_date, delivery_date)
SELECT customer_id, '2026-10-17', NULL
FROM customer WHERE email = 'ece@example.com';

INSERT INTO order_item (order_id, book_id, quantity, unit_price)
SELECT o.order_id, b.book_id, 2, b.price
FROM orders o CROSS JOIN book b
WHERE o.order_date = '2026-10-15'
AND b.title = 'Pride and Prejudice';

INSERT INTO order_item (order_id, book_id, quantity, unit_price)
SELECT o.order_id, b.book_id, 1, b.price
FROM orders o CROSS JOIN book b
WHERE o.order_date = '2026-10-15'
AND b.title = '1984';

INSERT INTO order_item (order_id, book_id, quantity, unit_price)
SELECT o.order_id, b.book_id, 1, b.price
FROM orders o CROSS JOIN book b
WHERE o.order_date = '2026-10-16'
AND b.title = '1984';

INSERT INTO order_item (order_id, book_id, quantity, unit_price)
SELECT o.order_id, b.book_id, 3, b.price
FROM orders o CROSS JOIN book b
WHERE o.order_date = '2026-10-17'
AND b.title = 'Jane Eyre';
