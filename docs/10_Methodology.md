# 📄 RFM Methodology & Scoring Rules
## E-Commerce RFM Customer Segmentation

---

## 🔬 Mathematical RFM Methodology

**RFM (Recency, Frequency, Monetary)** analysis is a behavioral customer segmentation framework that scores each customer based on three quantitative purchasing dimensions:

$$\text{RFM Score} = (\text{Recency Score}) \times 100 + (\text{Frequency Score}) \times 10 + (\text{Monetary Score})$$

---

## 📐 RFM Metric Definitions & SQL Logic

### 1. Recency (R) — Days Since Last Purchase
- **Calculation:** Days elapsed between the platform snapshot max purchase date and the customer's most recent order.
- **SQL Logic:**
  $$\text{Recency} = \text{DATEDIFF}(\text{MAX}(order\_purchase\_timestamp)_{platform}, \text{MAX}(order\_purchase\_timestamp)_{customer})$$
- **Scoring Binning (`NTILE(5)`):**
  - Shorter recency gap = Higher R-Score (1 to 5).
  - R-Score 5: Top 20% most recently active buyers.
  - R-Score 1: Bottom 20% most dormant buyers.

### 2. Frequency (F) — Total Distinct Orders
- **Calculation:** Count of distinct non-canceled orders completed by `customer_unique_id`.
- **Custom Frequency Binning (Addressing Data Skew):**
  - *Technical Necessity:* Standard quintiles (`NTILE(5)`) fail on raw order frequency because over 90% of buyers in the Olist dataset have `Frequency = 1`. Equal-percentile binning produces identical boundary values.
  - *Custom CASE Logic:*
    ```sql
    CASE 
        WHEN frequency >= 4 THEN 5
        WHEN frequency = 3 THEN 4
        WHEN frequency = 2 THEN 3
        ELSE 1  -- Single purchase buyers
    END AS f_score
    ```

### 3. Monetary (M) — Cumulative Financial Outlay
- **Calculation:** Total monetary expenditure (product prices plus freight fees).
- **SQL Logic:** `SUM(price + freight_value)`
- **Scoring Binning (`NTILE(5)`):**
  - Higher total spend = Higher M-Score (1 to 5).
  - M-Score 5: Top 20% highest spending customers.

---

## 🏷️ Customer Segment Assignment Matrix

Customers are assigned to 5 mutually exclusive business segments using the combined RFM scores:

| Customer Segment | Scoring Rules & Criteria | Business Definition |
|---|---|---|
| 🟡 **Champions** | `r_score >= 4 AND f_score >= 4 AND m_score >= 4` | Highest spenders who buy recently and frequently. Top tier VIP customers. |
| 🟢 **Loyal** | `r_score >= 3 AND f_score >= 3` | Consistent repeat buyers with steady transaction history and strong recency. |
| 🟠 **At Risk** | `r_score <= 2 AND f_score >= 3` | Previously frequent, high-value buyers who have not purchased recently. |
| 🔴 **Lost** | `r_score = 1 AND f_score = 1` | Inactive single-time buyers with old purchase dates and low monetary value. |
| 🔵 **Others** | `ELSE` (All remaining combinations) | Moderate recency and monetary spend profiles requiring further engagement. |
