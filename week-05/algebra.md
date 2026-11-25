# Relational Algebra

## Q1 - Selection (σ)
σ(price > 200)(book)

Returns books costing more than 200.

## Q2 - Projection (π)
π(title, author)(book)

Returns book titles and authors.

## Q3 - Join (⋈)
π(full_name, order_id, order_date)
(customer ⋈ orders)

Returns customers and their orders.

## Q4 - Multiple Joins
π(full_name, title, quantity)
(customer ⋈ orders ⋈ order_item ⋈ book)

Returns customers, purchased books and quantities.

## Q5 - Union (∪)
π(book_id)(σ(price > 200)(book))
∪
π(book_id)(σ(stock_quantity > 15)(book))

Returns books satisfying either condition.

## Q6 - Intersection (∩)
π(book_id)(σ(status = 'active')(book))
∩
π(book_id)(σ(price > 200)(book))

Returns active books costing more than 200.

## Q7 - Difference (−)
π(customer_id)(customer)
−
π(customer_id)(orders)

Returns customers without orders.

## Q8 - Aggregation (γ)
γ(order_id, SUM(quantity * unit_price) → total_amount)(order_item)

Returns the total amount of each order.
