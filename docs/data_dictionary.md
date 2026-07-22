# 📄 Data Dictionary & Schema Documentation
## E-Commerce RFM Customer Segmentation

---

## 🗂️ Data Dictionary Overview

This data dictionary documents all primary source tables, processed dataset schema, calculated RFM attributes, and output segment aggregates used across the analytics pipeline.

---

## 1. Primary Source Tables (Olist E-Commerce Database)

### 1.1 `olist_customers_dataset`
Contains customer identity mapping between order-level identifiers and permanent customer entities.

| Column Name | Data Type | Nullable | Description & Constraints | Business Logic & Usage |
|---|---|:---:|---|---|
| `customer_id` | VARCHAR(32) | NO | Primary Key per order transaction. | **Transient order-level ID.** Used to join with `olist_orders_dataset`. |
| `customer_unique_id` | VARCHAR(32) | NO | **Permanent Customer Entity Key.** | **Unique Human Identifier.** Crucial grouping key for RFM metric aggregation. |
| `customer_zip_code_prefix` | INT | YES | 5-digit zip code prefix of customer address. | Geographic location attribute. |
| `customer_city` | VARCHAR(64) | YES | City name of customer residence. | Regional logistics and sales analysis. |
| `customer_state` | VARCHAR(2) | YES | 2-letter Brazilian state code (e.g., SP, RJ, MG). | Regional shipping and tax analysis. |

---

### 1.2 `olist_orders_dataset`
Contains purchase timestamps, order statuses, and fulfillment dates.

| Column Name | Data Type | Nullable | Description & Constraints | Business Logic & Usage |
|---|---|:---:|---|---|
| `order_id` | VARCHAR(32) | NO | Primary Key per order. | Unique transaction identifier. |
| `customer_id` | VARCHAR(32) | NO | Foreign Key linking to `customers`. | Relational join key. |
| `order_status` | VARCHAR(16) | NO | Status of order (`delivered`, `canceled`, etc.). | **Filtered in RFM (`!= 'canceled'`)** to exclude invalid revenue. |
| `order_purchase_timestamp` | DATETIME | NO | Exact timestamp when order was placed. | **Core Recency Source.** Used to calculate days since last order. |

---

### 1.3 `olist_order_items_dataset`
Contains itemized product transactions, unit prices, and freight fees.

| Column Name | Data Type | Nullable | Description & Constraints | Business Logic & Usage |
|---|---|:---:|---|---|
| `order_id` | VARCHAR(32) | NO | Foreign Key linking to `orders`. | Order grouping key. |
| `order_item_id` | INT | NO | Sequential item number within order. | Composite primary key component. |
| `product_id` | VARCHAR(32) | NO | Foreign Key linking to `products`. | Product taxonomy join key. |
| `price` | DECIMAL(10,2) | NO | Unit price of item in BRL. | Monetary component. |
| `freight_value` | DECIMAL(10,2) | NO | Shipping freight charge in BRL. | Monetary component (`SUM(price + freight_value)`). |

---

## 2. Processed Analytical Outputs

### 2.1 `RFM.csv` (Customer-Level Calculated RFM Metrics)

| Column Name | Data Type | Description | Formula / Calculation |
|---|---|---|---|
| `customer_unique_id` | VARCHAR(32) | Unique permanent customer ID | Grouping entity key |
| `Recency` | INT | Days since last purchase | `DATEDIFF(snapshot_date, MAX(purchase_date))` |
| `Frequency` | INT | Distinct order count | `COUNT(DISTINCT order_id)` |
| `Monetary` | DECIMAL(10,2) | Total financial outlay (BRL) | `SUM(price + freight_value)` |
| `R_score` | INT (1-5) | Recency score quintile | `NTILE(5) OVER (ORDER BY Recency ASC)` |
| `F_score` | INT (1-5) | Frequency score custom bin | Custom CASE binning (1, 3, 4, 5) |
| `M_score` | INT (1-5) | Monetary score quintile | `NTILE(5) OVER (ORDER BY Monetary DESC)` |
| `rfm_id` | VARCHAR(3) | Concatenated RFM score string | `CONCAT(R_score, F_score, M_score)` |
| `customer_segment` | VARCHAR(32) | Assigned behavioral segment name | Business rule classification logic |

---

### 2.2 `RFM Segmentation Analysis.csv` (Segment Aggregates)

| Column Name | Data Type | Description | Aggregation Formula |
|---|---|---|---|
| `customer_segment` | VARCHAR(32) | Segment classification name | Categorical grouping key |
| `total_customers` | INT | Total unique users in segment | `COUNT(*)` |
| `avg_revenue` | DECIMAL(10,2) | Segment ARPU (BRL) | `AVG(monetary)` |
| `total_revenue` | DECIMAL(10,2) | Segment cumulative revenue (BRL) | `SUM(monetary)` |
| `revenue_percentage` | DECIMAL(5,2) | Segment share of gross revenue (%) | `total_revenue * 100.0 / SUM(total_revenue)` |
