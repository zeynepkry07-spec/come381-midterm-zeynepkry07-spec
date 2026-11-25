# ON DELETE Policies

## 1. Customer - Orders: RESTRICT

Foreign key: fk_orders_customer

A customer cannot be deleted while associated orders exist.
This policy protects customer order history and prevents orphan records.

## 2. Orders - Order Item: CASCADE

Foreign key: fk_order_item_orders

When an order is deleted, its associated order items are automatically deleted.
Order items cannot exist independently of an order.

## 3. Book - Order Item: RESTRICT

Foreign key: fk_order_item_book

A book cannot be deleted while it is referenced by an order item.
This policy preserves historical order information.

## Design Decision

CASCADE is used for dependent records.
RESTRICT is used to protect customer and book references.
SET NULL was not selected because these relationships require valid references.
