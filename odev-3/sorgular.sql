-- Q1: Fiyatı 50 TL'den fazla olan ürünler hangileridir?
-- Ürünleri fiyatlarına göre pahalıdan ucuza sıralar.
SELECT name, price
FROM product
WHERE price > 50
ORDER BY price DESC;

-- Q2: YBS bölümündeki müşteriler kimlerdir?
-- YBS müşterilerini alfabetik olarak sıralar.
SELECT full_name, department
FROM customer
WHERE department = 'YBS'
ORDER BY full_name ASC;

-- Q3: Sipariş numarası, tarihi ve müşteri adı nedir?
-- Sipariş ve müşteri tablolarını birleştirir.
SELECT o.order_id, o.order_date, c.full_name
FROM orders o
JOIN customer c ON o.customer_id = c.customer_id
ORDER BY o.order_id;

-- Q4: Siparişlerde hangi üründen kaç adet vardır?
-- Sipariş kalemlerini ürün isimleriyle birlikte gösterir.
SELECT oi.order_id, p.name, oi.quantity
FROM order_item oi
JOIN product p ON oi.product_id = p.product_id
ORDER BY oi.order_id, p.name;

-- Q5: Her müşteri kaç sipariş vermiştir?
-- Sipariş vermeyen müşterileri de sonuca dahil eder.
SELECT c.full_name, COUNT(o.order_id) AS siparis_sayisi
FROM customer c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name
ORDER BY siparis_sayisi DESC, c.full_name;

-- Q6: Her ürün kategorisinin ortalama fiyatı nedir?
-- Ürünleri kategorilerine göre gruplandırarak ortalama hesaplar.
SELECT category, ROUND(AVG(price), 2) AS ortalama_fiyat
FROM product
GROUP BY category
ORDER BY category;
