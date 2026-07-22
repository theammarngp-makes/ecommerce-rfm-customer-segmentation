# 📖 Tableau Dashboard Element Dictionary
## E-Commerce RFM Customer Segmentation Dashboard

---

## 📌 Document Overview

This dictionary documents every visual element, KPI card, and chart included in the **RFM Customer Segmentation Tableau Dashboard** ([Public View Link](https://public.tableau.com/views/RFMAnalysis_17734745913220/Dashboard4)).

Following strict BI governance and consulting standards, each element is documented with its exact name, business purpose, underlying data source, SQL calculation query, empirical business interpretation, strategic decision supported, and recommended Tableau enhancement.

---

## 📑 Dashboard Element Inventory

Below is the complete inventory of all 6 native visual components rendered in the dashboard:

```
1. Top KPI Card 1: Average Revenue ("Avg Revenue")
2. Top KPI Card 2: Total Revenue ("Total Revenue")
3. Top KPI Card 3: Total Customers ("Customers")
4. Visual Chart 1:  Revenue by Customer Segment Line Chart ("Revenue")
5. Visual Chart 2:  Average Revenue by Customer Segment Bar Chart ("Avg rev")
6. Visual Chart 3:  Revenue Percentage Share Donut Chart ("Revenue Share %")
```

---

## 🔍 Detailed Element Documentation

### 1. Executive KPI Card: Average Revenue (`Avg Revenue`)

- **Name:** Average Revenue Metric Card (`Avg Revenue`)
- **Business Purpose:** Displays overall platform baseline average revenue transaction metric across all completed orders in the dataset.
- **Data Source:** `insights/RFM Segmentation Analysis.csv` / Olist Orders and Order Items tables.
- **SQL Query Used:**
  ```sql
  SELECT 
      ROUND(SUM(oi.price + oi.freight_value) / COUNT(DISTINCT o.order_id), 2) AS avg_revenue
  FROM orders o
  JOIN order_items oi 
      ON o.order_id = oi.order_id
  WHERE o.order_status != 'canceled';
  ```
- **Business Interpretation:** Establishes the overall platform benchmark transaction value (978 BRL) across non-canceled transactions. Serves as a baseline against which segment-specific ARPUs are evaluated.
- **Decision Supported:** Determines platform pricing performance and sets target hurdle rates for order-value expansion initiatives.
- **Suggested Improvements:** Clarify metric subtext (distinguish order ARPU from customer ARPU) and format with standard currency symbol (`R$ 978`).

---

### 2. Executive KPI Card: Total Revenue (`Total Revenue`)

- **Name:** Total Gross Revenue Metric Card (`Total Revenue`)
- **Business Purpose:** Displays total cumulative gross sales revenue analyzed across all customer transactions.
- **Data Source:** `insights/RFM Segmentation Analysis.csv` / Olist Orders and Order Items tables.
- **SQL Query Used:**
  ```sql
  SELECT 
      ROUND(SUM(oi.price + oi.freight_value), 0) AS total_revenue
  FROM orders o
  JOIN order_items oi 
      ON o.order_id = oi.order_id
  WHERE o.order_status != 'canceled';
  ```
- **Business Interpretation:** Quantifies total top-line gross financial outlay (**15,737,668 BRL**) evaluated within the RFM customer analytics model.
- **Decision Supported:** Supports top-line sales monitoring and grounds retention investment sizing relative to overall platform revenue.
- **Suggested Improvements:** Add currency formatting (`R$ 15,737,668`) and include year-over-year growth percentage comparison subtext.

---

### 3. Executive KPI Card: Total Customers (`Customers`)

- **Name:** Total Unique Customers Metric Card (`Customers`)
- **Business Purpose:** Displays total footprint of unique human customer entities evaluated in the segmentation model.
- **Data Source:** `insights/RFM Segmentation Analysis.csv` / `olist_customers_dataset`.
- **SQL Query Used:**
  ```sql
  SELECT 
      COUNT(DISTINCT c.customer_unique_id) AS total_unique_customers
  FROM customers c
  JOIN orders o 
      ON c.customer_id = o.customer_id
  WHERE o.order_status != 'canceled';
  ```
- **Business Interpretation:** Confirms that **94,989 unique buyers** are evaluated in the RFM segmentation model, mapping permanent human entities (`customer_unique_id`) rather than transient order IDs.
- **Decision Supported:** Establishes total addressable audience size for CRM lifecycle campaigns and retention budgeting.
- **Suggested Improvements:** Add active vs dormant customer ratio breakdown subtext to highlight retention health.

---

### 4. Visual Chart 1: Revenue by Customer Segment Line Chart (`Revenue`)

- **Name:** Cumulative Revenue by Customer Segment Line Chart (`Revenue`)
- **Business Purpose:** Visualizes total gross revenue generated across each of the 5 customer segments (At Risk, Champions, Lost, Loyal, Others).
- **Data Source:** `insights/RFM Segmentation Analysis.csv` / `sql/02_customer_segmentation.sql`.
- **SQL Query Used:**
  ```sql
  SELECT 
      customer_segment,
      ROUND(SUM(monetary), 2) AS total_revenue
  FROM rfm_segments
  GROUP BY customer_segment
  ORDER BY total_revenue DESC;
  ```
- **Business Interpretation:** Illustrates that **Loyal** customers generate the highest total revenue (**R$ 5.05M**), followed closely by **Champions** (**R$ 4.09M**) and **Others** (**R$ 4.09M**). **Lost** customers account for **R$ 2.07M**, while **At Risk** represents **R$ 0.43M**.
- **Decision Supported:** Guides allocation of marketing capital based on total monetary contribution per segment.
- **Suggested Improvements:** Change mark type from line chart to horizontal ranked bar chart because customer segments are discrete categorical groups rather than continuous time-series data points.

---

### 5. Visual Chart 2: Average Revenue per Segment Bar Chart (`Avg rev`)

- **Name:** Average Revenue Per User (ARPU) Bar Chart (`Avg rev`)
- **Business Purpose:** Compares the Average Revenue Per User (ARPU) across all 5 customer segments to identify high-value customer profiles.
- **Data Source:** `insights/RFM Segmentation Analysis.csv` / `sql/02_customer_segmentation.sql`.
- **SQL Query Used:**
  ```sql
  SELECT 
      customer_segment,
      ROUND(AVG(monetary), 2) AS avg_revenue
  FROM rfm_segments
  GROUP BY customer_segment
  ORDER BY avg_revenue DESC;
  ```
- **Business Interpretation:** Highlights that **Champions** achieve the highest ARPU (**R$ 306.21**), followed by **At Risk** (**R$ 225.23**), **Lost** (**R$ 164.67**), **Others** (**R$ 161.10**), and **Loyal** (**R$ 121.10**).
- **Decision Supported:** Identifies premium spending segments (Champions and At Risk) for high-touch VIP retention programs and urgent reactivation outreach.
- **Suggested Improvements:** Display exact data values directly above bars (e.g., `R$ 306.21`) and color-code bars based on segment health status.

---

### 6. Visual Chart 3: Revenue Percentage Share Donut Chart (`Revenue Share %`)

- **Name:** Revenue Percentage Share Donut Chart
- **Business Purpose:** Displays the proportional percentage share of total gross revenue contributed by each customer segment.
- **Data Source:** `insights/RFM Segmentation Analysis.csv` / `sql/02_customer_segmentation.sql`.
- **SQL Query Used:**
  ```sql
  SELECT 
      customer_segment,
      ROUND(SUM(monetary) * 100.0 / SUM(SUM(monetary)) OVER(), 2) AS revenue_percentage
  FROM rfm_segments
  GROUP BY customer_segment;
  ```
- **Business Interpretation:** Demonstrates that **Loyal** (32.12%) and **Champions** (25.98%) account for **58.10%** of total platform revenue. **Others** represents 26.00%, **Lost** represents 13.18%, and **At Risk** represents 2.72%.
- **Decision Supported:** Validates revenue concentration and highlights potential business risk if top cohorts churn.
- **Suggested Improvements:** Add center summary text inside donut ring (`R$ 15.74M Total Sales`) and standardize slice colors (Emerald Green for Loyal, Gold for Champions, Crimson for Lost, Coral for At Risk).
