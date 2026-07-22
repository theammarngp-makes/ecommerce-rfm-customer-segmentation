# 📄 Project Scope & Boundary Framework
## E-Commerce RFM Customer Segmentation

---

## 🎯 Scope Framework Overview

To maintain rigorous project governance and ensure alignment between analytical deliverables and stakeholder expectations, this document defines the explicit **In-Scope** components executed within this project versus **Out-of-Scope** future roadmap enhancements.

```
+-----------------------------------+-----------------------------------+
|            IN-SCOPE               |           OUT-OF-SCOPE            |
|  - 94,989 Unique Customer RFM     |  - Real-Time Streaming Data       |
|  - SQL Scoring & NTILE Binning    |  - Predictive ML Churn Models     |
|  - Modular Python RFM Pipeline    |  - Automated Email Execution      |
|  - Tableau Executive Dashboard    |  - Third-Party Demographic Merges|
+-----------------------------------+-----------------------------------+
```

---

## 🟢 In-Scope Deliverables

1. **Dataset Aggregation & Unique Customer Identifier Mapping:**
   - Ingestion of 5 core tables from Olist (`customers`, `orders`, `order_items`, `products`, `order_payments`).
   - Aggregation at the `customer_unique_id` level to capture true customer-level purchasing history across multiple orders.

2. **RFM Metrics Calculation Engine:**
   - **Recency (R):** Days elapsed from customer's maximum purchase timestamp to dataset snapshot date.
   - **Frequency (F):** Count of distinct non-canceled orders per unique customer.
   - **Monetary (M):** Total monetary value (product price + freight value) per unique customer.

3. **SQL & Python Segmentation Pipelines:**
   - SQL window functions (`NTILE(5)`) for Recency and Monetary scoring, combined with explicit `CASE` statements to handle Frequency skewness.
   - Refactored Python pipeline (`python/rfm_analysis.py`) with dynamic path handling and function modularity.

4. **Executive Tableau Dashboard & Interactive Preview:**
   - Interactive Tableau dashboard visualizing segment volume, revenue contribution, and ARPU metrics.

5. **Consulting Documentation Suite (17 Modular Files):**
   - Comprehensive business, technical, methodology, data dictionary, and perspective audit documents.

---

## 🔴 Out-of-Scope Components (Future Enhancements)

1. **Predictive Machine Learning Modeling:**
   - Predictive CLV algorithms (e.g., BG/NBD, Gamma-Gamma models) and supervised machine learning churn predictions are out of scope for this descriptive RFM project (planned for advanced ML extensions).
2. **Live Production Integration:**
   - Streaming pipeline integration (Kafka, Spark) or direct webhook triggers to marketing automation tools (Klaviyo, Salesforce Marketing Cloud).
3. **External Consumer Demographic Merges:**
   - Merging third-party credit bureau data or social demographic profiles outside the primary Olist relational database.
