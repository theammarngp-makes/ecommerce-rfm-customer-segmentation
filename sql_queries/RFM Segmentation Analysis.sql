-- Q.RFM Segmentation (

WITH max_date as(
SELECT 
      max(order_purchase_timestamp) as maxim_date 
FROM orders 
WHERE order_status != "canceled"  ),

rfm AS 
(
SELECT 
      c.customer_unique_id ,
      DATEDIFF((SELECT maxim_date FROM max_date),MAX(o.order_purchase_timestamp)) as recency,
      COUNT(DISTINCT o.order_id)  AS frequency,
      SUM(oi.freight_value + oi.price)  AS monetry
          FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.order_status != 'canceled'
    GROUP BY c.customer_unique_id
),
rfm_scores as 
(SELECT 
       customer_unique_id ,
       recency,
       frequency,
       monetry,
       6 - NTILE(5)  OVER(ORDER BY recency ASC ) as r_score,
	   6 - NTILE(5)  OVER(ORDER BY frequency DESC ) as f_score,
	   6 - NTILE(5)  OVER(ORDER BY monetry DESC ) as m_score
FROM rfm ),
rfm_segments AS
(
SELECT *,
       CONCAT(r_score, f_score, m_score) as rfm_segment,
       CASE
           WHEN r_score >=4 AND f_score >=4 AND m_score >=4 THEN 'Champions'
           WHEN r_score >=3 AND f_score >=3 THEN 'Loyal'
           WHEN r_score <=2 AND f_score >=3 THEN 'At Risk'
           WHEN r_score =1 AND f_score =1 THEN 'Lost'
           ELSE 'Others'
       END as customer_segment
FROM rfm_scores
)
SELECT
    customer_segment,
    COUNT(*) AS total_customers,
    AVG(monetry) as avg_revenue,
    ROUND(SUM(monetry),2) AS total_revenue,
    ROUND(
        SUM(monetry) * 100.0 / SUM(SUM(monetry)) OVER(),
        2
    ) AS revenue_percentage
FROM rfm_segments
GROUP BY customer_segment
ORDER BY total_revenue DESC;

-- The RFM analysis revealed that Champions represent a relatively small customer base (~13K) but generate the highest average revenue (306), indicating strong revenue concentration among top-tier customers.
-- The Loyal segment forms the largest group (~41K) but shows lower average spending, suggesting upsell opportunities.
-- The At-Risk segment, despite being small (~1.9K), demonstrates high revenue potential (225 avg), making them critical for retention-focused strategies.
