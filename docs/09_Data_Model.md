# 📄 Data Model & Entity Relationship Architecture
## E-Commerce RFM Customer Segmentation

---

## 📐 Entity Relationship Diagram (ERD) Overview

The underlying analytical model connects five relational tables to aggregate transactional line items into permanent customer entities.

```
+------------------------------+             +------------------------------+
|     olist_customers_dataset  |             |      olist_orders_dataset    |
+------------------------------+             +------------------------------+
| customer_id (PK)             | 1 -------- N| customer_id (FK)             |
| customer_unique_id           |             | order_id (PK)                |
| customer_zip_code_prefix     |             | order_status                 |
| customer_city                |             | order_purchase_timestamp     |
| customer_state               |             | order_delivered_customer_date|
+------------------------------+             +------------------------------+
                                                            |
                                                            | 1
                                                            |
                                                            | N
                                             +------------------------------+
                                             |  olist_order_items_dataset   |
                                             +------------------------------+
                                             | order_id (FK)                |
                                             | order_item_id (PK)           |
                                             | product_id (FK)              |
                                             | seller_id (FK)               |
                                             | price                        |
                                             | freight_value                |
                                             +------------------------------+
                                                            |
                                                            | N
                                                            |
                                                            | 1
                                             +------------------------------+
                                             |   olist_products_dataset     |
                                             +------------------------------+
                                             | product_id (PK)              |
                                             | product_category_name        |
                                             +------------------------------+
```

---

## 🔗 Join Paths & Relationships

1. **`customers` to `orders` (1:N):**
   - Joined on `c.customer_id = o.customer_id`.
   - Links transient purchase order IDs to permanent `customer_unique_id` attributes.

2. **`orders` to `order_items` (1:N):**
   - Joined on `o.order_id = oi.order_id`.
   - One order can contain multiple items. Product prices and freight charges are summed at the order and customer level.

3. **`order_items` to `products` (N:1):**
   - Joined on `oi.product_id = p.product_id`.
   - Attaches product catalog taxonomy and categories to order line items.

4. **`orders` to `order_payments` (1:N):**
   - Joined on `o.order_id = op.order_id`.
   - Captures transaction payment types (credit card, boleto, voucher) and installment details.

---

## 🛡️ Business Data Integrity Rules

- **Canceled Order Exclusion:** All queries enforce `WHERE order_status != 'canceled'` to prevent invalid transactions from inflating recency or monetary values.
- **Gross Monetary Formula:** Monetary value is defined as `SUM(price + freight_value)` to capture true total customer financial outlay.
