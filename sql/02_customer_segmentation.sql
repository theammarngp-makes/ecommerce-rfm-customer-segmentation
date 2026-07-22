-- =============================================================================
-- Script Name: 02_customer_segmentation.sql
-- Description: RFM Scoring, NTILE Binning, Segment Rule Classification & Aggregates
-- Author: Mohammad Ammar (Principal Data Analytics Consultant)
-- Project: E-Commerce RFM Customer Segmentation (Project 2 of BI Suite)
-- Target Engine: MySQL 8.0+ / PostgreSQL 12+ / Snowflake
-- Dataset: Olist Brazilian E-Commerce Public Dataset
-- =============================================================================
-- Business Purpose:
--   Assigns RFM scores (1-5) to 94,989 unique customer profiles, classifies users
--   into 5 strategic behavioral segments (Champions, Loyal, At Risk, Lost, Others),
--   and computes segment-level customer volume, ARPU, revenue, and revenue share.
--
-- Methodological Highlights:
--   1. Recency Score (r_score): NTILE(5) OVER (ORDER BY recency ASC). Shorter days = Score 5.
--   2. Frequency Score (f_score): Explicit CASE statement to handle severe data skew
--      (over 90% single-order buyers in Olist dataset).
--   3. Monetary Score (m_score): NTILE(5) OVER (ORDER BY monetary DESC). Higher spend = Score 5.
--   4. Revenue Percentage: Window function SUM(monetary) * 100.0 / SUM(SUM(monetary)) OVER().
-- =============================================================================

WITH platform_max_date AS (
    -- CTE 1: Global maximum non-canceled order purchase date
    SELECT 
        MAX(order_purchase_timestamp) AS max_purchase_date
    FROM orders 
    WHERE order_status != 'canceled'
),

rfm_base AS (
    -- CTE 2: Aggregate customer-level Recency, Frequency, and Monetary metrics
    SELECT 
        c.customer_unique_id,
        DATEDIFF(
            (SELECT max_purchase_date FROM platform_max_date), 
            MAX(o.order_purchase_timestamp)
        ) AS recency,
        COUNT(DISTINCT o.order_id) AS frequency,
        SUM(oi.price + oi.freight_value) AS monetary
    FROM customers c
    INNER JOIN orders o 
        ON c.customer_id = o.customer_id
    INNER JOIN order_items oi 
        ON o.order_id = oi.order_id
    WHERE o.order_status != 'canceled'
    GROUP BY c.customer_unique_id
),

rfm_scores AS (
    -- CTE 3: Compute percentile & custom scores for Recency, Frequency, and Monetary
    SELECT 
        customer_unique_id,
        recency,
        frequency,
        monetary,
        
        -- Recency Score: Shorter recency gap = Higher score (1 to 5)
        NTILE(5) OVER (ORDER BY recency ASC) AS r_score,
        
        -- Frequency Score: Custom CASE logic required due to heavy single-order skew
        CASE 
            WHEN frequency >= 4 THEN 5
            WHEN frequency = 3 THEN 4
            WHEN frequency = 2 THEN 3
            ELSE 1 -- Failsafe for 1-time purchase customers
        END AS f_score,
        
        -- Monetary Score: Higher spend = Higher score (1 to 5)
        NTILE(5) OVER (ORDER BY monetary DESC) AS m_score
    FROM rfm_base
),

rfm_segments AS (
    -- CTE 4: Classify customers into 5 strategic business segments
    SELECT 
        customer_unique_id,
        recency,
        frequency,
        monetary,
        r_score,
        f_score,
        m_score,
        CONCAT(r_score, f_score, m_score) AS rfm_id,
        CASE
            WHEN r_score >= 4 AND f_score >= 4 AND m_score >= 4 THEN 'Champions'
            WHEN r_score >= 3 AND f_score >= 3 THEN 'Loyal'
            WHEN r_score <= 2 AND f_score >= 3 THEN 'At Risk'
            WHEN r_score = 1 AND f_score = 1 THEN 'Lost'
            ELSE 'Others'
        END AS customer_segment
    FROM rfm_scores
),

segment_aggregates AS (
    -- CTE 5: Calculate segment-level volume, total revenue, and average revenue per user (ARPU)
    SELECT
        customer_segment,
        COUNT(*) AS total_customers,
        AVG(monetary) AS avg_revenue,
        SUM(monetary) AS total_revenue
    FROM rfm_segments
    GROUP BY customer_segment
)

-- Final Output: Segment breakdown with revenue percentage share calculation
SELECT 
    customer_segment,
    total_customers,
    ROUND(avg_revenue, 2) AS avg_revenue,
    ROUND(total_revenue, 2) AS total_revenue,
    ROUND(total_revenue * 100.0 / SUM(total_revenue) OVER(), 2) AS revenue_percentage
FROM segment_aggregates
ORDER BY total_revenue DESC;
