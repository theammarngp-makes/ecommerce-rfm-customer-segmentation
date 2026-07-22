# 📄 Dataset Overview
## E-Commerce RFM Customer Segmentation

---

## 📊 Dataset Profile & Source

The dataset used in this project originates from the **Olist Brazilian E-Commerce Public Dataset** hosted on Kaggle. It contains anonymized commercial records of **94,989 unique customers** who placed orders on the platform between **2016 and 2018**.

- **Dataset Source:** Kaggle / Olist Brazilian E-Commerce
- **Time Horizon:** September 2016 – October 2018
- **Geographic Coverage:** 27 Brazilian States across 4,119 Municipalities
- **Total Unique Customers:** 94,989 `customer_unique_id` entities
- **Total Gross Revenue Analyzed:** 15,737,667.52 BRL

---

## 🗂️ Relational Table Summary

To construct the unified customer-level RFM metrics, 5 core relational tables were joined:

| Table Name | Primary Key | Foreign Keys | Row Count | Primary Role in RFM Analysis |
|---|---|---|:---:|---|
| `olist_customers_dataset` | `customer_id` | N/A | 99,441 | Maps transient `customer_id` per order to permanent `customer_unique_id` entity. |
| `olist_orders_dataset` | `order_id` | `customer_id` | 99,441 | Provides `order_purchase_timestamp` for Recency & order status filtering (`!= 'canceled'`). |
| `olist_order_items_dataset` | `order_id`, `order_item_id` | `product_id`, `seller_id` | 112,650 | Provides product `price` and `freight_value` for Monetary calculation. |
| `olist_products_dataset` | `product_id` | N/A | 32,951 | Supplies product categories for category-level spend breakdowns. |
| `olist_order_payments_dataset` | `order_id`, `payment_sequential` | N/A | 103,886 | Contains payment types, installment counts, and transaction payment values. |

---

## 🔑 Crucial Architectural Distinction: `customer_id` vs. `customer_unique_id`

```
+-----------------------------------------------------------------------------------+
|                        OLIST CUSTOMER IDENTITY ARCHITECTURE                      |
+-----------------------------------------------------------------------------------+
|  - customer_id: Transient identifier generated FOR EACH ORDER.                    |
|  - customer_unique_id: Permanent identifier representing THE REAL HUMAN BUYER.    |
|                                                                                   |
|  * CRITICAL FOR RFM: Grouping by customer_id would incorrectly treat every order  |
|    as a brand-new customer (Frequency = 1). RFM metrics MUST group by               |
|    customer_unique_id to accurately calculate multi-order frequency!              |
+-----------------------------------------------------------------------------------+
```
