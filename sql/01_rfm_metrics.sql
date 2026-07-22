-- =============================================================================
-- Script Name: 01_rfm_metrics.sql
-- Description: Base Customer RFM Metrics Calculation Query
-- Author: Mohammad Ammar (Principal Data Analytics Consultant)
-- Project: E-Commerce RFM Customer Segmentation (Project 2 of BI Suite)
-- Target Engine: MySQL 8.0+ / PostgreSQL 12+ / Snowflake
-- Dataset: Olist Brazilian E-Commerce Public Dataset
-- =============================================================================
-- Business Purpose:
--   Calculates fundamental Recency, Frequency, and Monetary (RFM) metrics for
--   every unique customer entity (customer_unique_id) across historical order data.
--
-- Key Logic & Data Integrity:
--   1. Recency: Days elapsed from platform max purchase timestamp to customer's
--      most recent completed order timestamp.
--   2. Frequency: Count of distinct non-canceled order IDs per customer.
--   3. Monetary: Total financial outlay (product price + freight charges).
--   4. Filter: Excludes canceled orders (order_status != 'canceled').
--   5. Entity Granularity: Groups by customer_unique_id (permanent human buyer)
--      rather than transient order-level customer_id.
-- =============================================================================

WITH platform_max_date AS (
    -- CTE 1: Compute global max purchase timestamp across non-canceled orders
    SELECT 
        MAX(order_purchase_timestamp) AS max_purchase_date
    FROM orders 
    WHERE order_status != 'canceled'
),

customer_rfm_base AS (
    -- CTE 2: Aggregate transactional line items into customer-level RFM metrics
    SELECT 
        c.customer_unique_id,
        
        -- Recency: Days since customer's last purchase relative to platform max date
        DATEDIFF(
            (SELECT max_purchase_date FROM platform_max_date),
            MAX(o.order_purchase_timestamp)
        ) AS recency_days,
        
        -- Frequency: Total distinct non-canceled orders
        COUNT(DISTINCT o.order_id) AS frequency_orders,
        
        -- Monetary: Total gross spend (product price + freight value)
        SUM(oi.price + oi.freight_value) AS monetary_spend
        
    FROM customers c
    INNER JOIN orders o
        ON c.customer_id = o.customer_id
    INNER JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.order_status != 'canceled'
    GROUP BY c.customer_unique_id
)

-- Output Base RFM Table sorted by Monetary Spend descending
SELECT 
    customer_unique_id,
    recency_days,
    frequency_orders,
    ROUND(monetary_spend, 2) AS monetary_spend
FROM customer_rfm_base
ORDER BY monetary_spend DESC;
