# 📄 KPI Definitions & Analytics Library
## E-Commerce RFM Customer Segmentation

---

## 📊 Comprehensive Business KPI Library

This document provides complete technical specifications for all Key Performance Indicators (KPIs) used across the RFM customer analytics model.

| Metric Code | KPI Name | Mathematical Formula | SQL / Python Expression | Business Rationale & Benchmark |
|---|---|---|---|---|
| **KPI-01** | **Total Customer Base** | $\sum \text{Count}(\text{Unique Customers})$ | `COUNT(DISTINCT customer_unique_id)` | Baseline footprint of unique purchasing entities (94,989). |
| **KPI-02** | **Total Gross Revenue** | $\sum (\text{Price} + \text{Freight})$ | `SUM(price + freight_value)` | Cumulative financial outlay across all completed transactions (15.74M BRL). |
| **KPI-03** | **Average Revenue Per User (ARPU)** | $\frac{\text{Total Gross Revenue}}{\text{Total Unique Customers}}$ | `SUM(monetary) / COUNT(customer_unique_id)` | Measure of average monetary value generated per customer profile (R$ 165.68). |
| **KPI-04** | **Segment Customer Count** | $\text{Count}(c \in \text{Segment}_i)$ | `COUNT(*) GROUP BY customer_segment` | Customer volume per behavioral segment (e.g., 41,740 Loyal). |
| **KPI-05** | **Segment Customer Share (%)** | $\frac{\text{Segment Customer Count}}{\text{Total Customer Base}} \times 100$ | `COUNT(*) * 100.0 / SUM(COUNT(*)) OVER()` | Percentage of total customer base belonging to segment. |
| **KPI-06** | **Segment Total Revenue** | $\sum_{c \in \text{Segment}_i} \text{Monetary}_c$ | `SUM(monetary) GROUP BY customer_segment` | Gross revenue contributed by specific segment (e.g., R$ 5.05M Loyal). |
| **KPI-07** | **Segment Revenue Share (%)** | $\frac{\text{Segment Total Revenue}}{\text{Total Gross Revenue}} \times 100$ | `SUM(monetary) * 100.0 / SUM(SUM(monetary)) OVER()` | Revenue concentration percentage per segment (e.g., 32.12% Loyal). |
| **KPI-08** | **Segment ARPU** | $\frac{\text{Segment Total Revenue}}{\text{Segment Customer Count}}$ | `AVG(monetary)` | Average financial spend of customers within specific segment. |
| **KPI-09** | **Recency Gap (Days)** | $\text{Snapshot Date} - \text{Max Purchase Date}$ | `DATEDIFF(snapshot_date, MAX(order_purchase_timestamp))` | Elapsed days since last customer activity. Lower = better. |
| **KPI-10** | **Purchase Frequency** | $\text{Count}(\text{Distinct Order IDs})$ | `COUNT(DISTINCT order_id)` | Measure of customer order repeat volume. |
