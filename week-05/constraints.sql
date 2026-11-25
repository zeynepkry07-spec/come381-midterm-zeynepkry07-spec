-- Musterinin adi ve e-posta adresi bos olamaz.
ALTER TABLE customer
    ALTER COLUMN full_name SET NOT NULL,
    ALTER COLUMN email SET NOT NULL;

-- Her musterinin e-posta adresi benzersiz olmalidir.
ALTER TABLE customer
    ADD CONSTRAINT uq_customer_email UNIQUE (email);

-- Kitabin adi, yazari ve fiyati bos olamaz.
ALTER TABLE book
    ALTER COLUMN title SET NOT NULL,
    ALTER COLUMN author SET NOT NULL,
    ALTER COLUMN price SET NOT NULL;

-- Kitap fiyati sifirdan buyuk olmalidir.
ALTER TABLE book
    ADD CONSTRAINT chk_book_price CHECK (price > 0);

-- Stok miktari negatif olamaz.
ALTER TABLE book
    ADD CONSTRAINT chk_book_stock CHECK (stock_quantity >= 0);

-- Ayni yazar ve kitap adi tekrar edemez.
ALTER TABLE book
    ADD CONSTRAINT uq_book_title_author UNIQUE (title, author);

-- Kitabin satis durumu belirlenen degerlerden biri olmalidir.
ALTER TABLE book
    ADD COLUMN status VARCHAR(20) NOT NULL DEFAULT 'active';

ALTER TABLE book
    ADD CONSTRAINT chk_book_status
    CHECK (status IN ('active', 'inactive', 'discontinued'));

-- Siparis tarihi bos olamaz.
ALTER TABLE orders
    ALTER COLUMN order_date SET NOT NULL;

-- Siparis teslim tarihi siparis tarihinden once olamaz.
ALTER TABLE orders
    ADD COLUMN delivery_date DATE;

ALTER TABLE orders
    ADD CONSTRAINT chk_orders_delivery_date
    CHECK (delivery_date >= order_date);

-- Siparis miktari ve birim fiyat bos olamaz.
ALTER TABLE order_item
    ALTER COLUMN quantity SET NOT NULL,
    ALTER COLUMN unit_price SET NOT NULL;

-- Siparis miktari en az bir olmalidir.
ALTER TABLE order_item
    ADD CONSTRAINT chk_order_item_quantity CHECK (quantity > 0);

-- Birim fiyat pozitif olmalidir.
ALTER TABLE order_item
    ADD CONSTRAINT chk_order_item_price CHECK (unit_price > 0);

-- Siparisi bulunan musteri silinemez.
ALTER TABLE orders
    DROP CONSTRAINT orders_customer_id_fkey,
    ADD CONSTRAINT fk_orders_customer
    FOREIGN KEY (customer_id)
    REFERENCES customer(customer_id)
    ON DELETE RESTRICT;

-- Siparis silinirse siparis kalemleri de silinir.
ALTER TABLE order_item
    DROP CONSTRAINT order_item_order_id_fkey,
    ADD CONSTRAINT fk_order_item_orders
    FOREIGN KEY (order_id)
    REFERENCES orders(order_id)
    ON DELETE CASCADE;

-- Sipariste bulunan kitap silinemez.
ALTER TABLE order_item
    DROP CONSTRAINT order_item_book_id_fkey,
    ADD CONSTRAINT fk_order_item_book
    FOREIGN KEY (book_id)
    REFERENCES book(book_id)
    ON DELETE RESTRICT;
