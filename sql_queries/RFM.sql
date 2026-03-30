-- 	Q.	RFM Segmentation
-- For each customer:
-- 	Recency = days since last purchase
-- 	Frequency = total orders
-- 	Monetary = total revenue

WITH  max_date as  (
SELECT 
      MAX(order_purchase_timestamp) as max_purchase_date
      FROM orders 
      WHERE order_status  != "canceled" 
),
rfm as 
(SELECT 
       c.customer_unique_id,
       DATEDIFF( 
       (SELECT max_purchase_date FROM max_date),
       MAX(o.order_purchase_timestamp)
       ) AS recency ,
 COUNT(DISTINCT o.order_id) as frequency,
       SUM(oi.price + oi.freight_value) AS monetary
        
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_items oi
        ON o.order_id = oi.order_id
    WHERE o.order_status != 'canceled'
    GROUP BY c.customer_unique_id
)
SELECT * FROM rfm 
ORDER BY monetary DESC ;
