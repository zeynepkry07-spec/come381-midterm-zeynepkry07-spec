-- Q1: Selection
SELECT *
FROM book
WHERE price > 200;

-- Q2: Projection
SELECT DISTINCT title, author
FROM book;

-- Q3: Join
SELECT c.full_name, o.order_id, o.order_date
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id;

-- Q4: Multiple joins
SELECT c.full_name, b.title, oi.quantity
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_item oi ON o.order_id = oi.order_id
JOIN book b ON oi.book_id = b.book_id;

-- Q5: Union
SELECT book_id FROM book WHERE price > 200
UNION
SELECT book_id FROM book WHERE stock_quantity > 15;

-- Q6: Intersection
SELECT book_id FROM book WHERE status = 'active'
INTERSECT
SELECT book_id FROM book WHERE price > 200;

-- Q7: Difference
SELECT customer_id FROM customer
EXCEPT
SELECT customer_id FROM orders;

-- Q8: Aggregation
SELECT order_id, SUM(quantity * unit_price) AS total_amount
FROM order_item
GROUP BY order_id;
