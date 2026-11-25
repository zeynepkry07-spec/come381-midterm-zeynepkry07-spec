CREATE TABLE customer (
    customer_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(150)
);

CREATE TABLE book (
    book_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR(200),
    author VARCHAR(100),
    price NUMERIC(10,2),
    stock_quantity INTEGER
);

CREATE TABLE orders (
    order_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    order_date DATE,
    FOREIGN KEY (customer_id)
        REFERENCES customer(customer_id)
);

CREATE TABLE order_item (
    order_id INTEGER,
    book_id INTEGER,
    quantity INTEGER,
    unit_price NUMERIC(10,2),
    PRIMARY KEY (order_id, book_id),
    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),
    FOREIGN KEY (book_id)
        REFERENCES book(book_id)
);
