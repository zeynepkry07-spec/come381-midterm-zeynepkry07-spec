\set VERBOSITY verbose

-- İşlem öncesindeki fiyatlar
SELECT product_id, name, price
FROM product
WHERE category = 'Sıcak İçecek'
ORDER BY product_id;

BEGIN;

-- Sıcak içeceklerin fiyatını 5 TL artır
UPDATE product
SET price = price + 5
WHERE category = 'Sıcak İçecek';

-- Güncellenen fiyatları göster
SELECT product_id, name, price
FROM product
WHERE category = 'Sıcak İçecek'
ORDER BY product_id;

-- Var olmayan 999 numaralı ürünü siparişe eklemeyi dene
INSERT INTO order_item (order_id, product_id, quantity)
VALUES (1, 999, 1);

-- Yapılan değişiklikleri geri al
ROLLBACK;

-- Fiyatların eski haline döndüğünü doğrula
SELECT product_id, name, price
FROM product
WHERE category = 'Sıcak İçecek'
ORDER BY product_id;
