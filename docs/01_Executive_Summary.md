# 📄 Executive Summary
## E-Commerce RFM Customer Segmentation & CRM Analytics

---

## 📌 Executive Overview

In modern multi-category e-commerce marketplaces, customer acquisition costs (CAC) continue to escalate, making retention and customer lifetime value (CLV) optimization the primary drivers of sustainable profitability. This project presents an enterprise-grade customer segmentation analysis conducted on the Brazilian **Olist E-Commerce dataset**, covering **94,989 unique customers** and **15,737,667.52 BRL (~15.74M BRL)** in total gross revenue.

Using advanced **RFM (Recency, Frequency, Monetary)** behavioral analytics implemented via optimized SQL pipelines, Python data manipulation, and interactive Tableau visualizations, this analysis segments the customer base into distinct behavioral cohorts to enable precision CRM targeting, churn reduction, and revenue expansion.

---

## 📊 Summary of Customer Segments

The customer base was segmented into five strategic cohorts based on recency of purchase, order frequency, and monetary contribution:

| Customer Segment | Customer Count | Customer Share (%) | Total Revenue (BRL) | Revenue Share (%) | Average Revenue / User (BRL) | Primary Strategic Focus |
|---|:---:|:---:|:---:|:---:|:---:|---|
| 🟢 **Loyal** | 41,740 | 43.94% | R$ 5,054,591.30 | 32.12% | R$ 121.10 | Cross-Selling & Upselling |
| 🔵 **Others** | 25,402 | 26.74% | R$ 4,092,320.09 | 26.00% | R$ 161.10 | Nurturing & Engagement |
| 🟡 **Champions** | 13,354 | 14.06% | R$ 4,089,088.19 | 25.98% | R$ 306.21 | VIP Retention & Exclusive Access |
| 🔴 **Lost** | 12,593 | 13.26% | R$ 2,073,734.79 | 13.18% | R$ 164.67 | Win-Back Automation |
| 🟠 **At Risk** | 1,900 | 2.00% | R$ 427,933.15 | 2.72% | R$ 225.23 | Urgent Intervention & Reactivation |
| **TOTAL** | **94,989** | **100.00%** | **R$ 15,737,667.52** | **100.00%** | **R$ 165.68** | **Portfolio Revenue Optimization** |

---

## 💡 Key Strategic Findings

1. **High Revenue Concentration Among Top Segments:**
   - **Loyal** (32.12%) and **Champions** (25.98%) collectively generate **58.10% (R$ 9.14M)** of total revenue despite representing 58.00% of the customer base.
   - **Champions** demonstrate an outstanding Average Revenue Per User (ARPU) of **R$ 306.21**, which is **1.85x higher** than the platform average (R$ 165.68) and **2.53x higher** than Loyal customers (R$ 121.10).

2. **Severe Churn Exposure & Revenue Drag:**
   - **Lost** customers represent 12,593 users (13.26% of customer base) who previously generated **R$ 2.07M** in gross revenue but have gone cold.
   - **At-Risk** customers comprise 1,900 high-value users with an ARPU of **R$ 225.23** (second highest ARPU) showing early churn signs (high recency gap). Preserving this cohort protects **R$ 427.93K** in immediate annual revenue.

3. **Structural Single-Transaction Skew:**
   - Analysis reveals that over 90% of customers currently perform only 1 transaction on the platform. Moving just 5% of single-order buyers into repeat cohorts increases gross margin exponentially due to zero incremental acquisition costs.

---

## 🚀 Core Strategic Recommendations

- **Implement VIP Concierge for Champions:** Launch an exclusive VIP rewards program, priority shipping, and sneak-peek product releases to lock in the top 14.06% of users who generate R$ 306.21 ARPU.
- **Automated Win-Back Journeys for At Risk & Lost:** Deploy automated email/SMS sequences offering personalized discounts on past purchased categories within 30 days of behavioral decay.
- **Category Expansion for Loyal Customers:** Execute personalized cross-selling campaigns leveraging product recommendation engines to increase order value from R$ 121.10 toward Champion levels.
