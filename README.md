# 📊 E-Commerce RFM Customer Segmentation & CRM Analytics
## Enterprise Customer Behavioral Cohorting, Revenue Concentration & Churn Prevention Engine

<p align="center">
  <img src="assets/project-banner.png" alt="Project Banner" width="100%" />
</p>

<p align="center">
  <a href="#-executive-summary"><img src="https://img.shields.io/badge/Executive-Summary-blue?style=for-the-badge&logo=markdown" /></a>
  <a href="#-tableau-dashboard-preview"><img src="https://img.shields.io/badge/Tableau-Live_Dashboard-orange?style=for-the-badge&logo=tableau" /></a>
  <a href="#-sql--python-analytics-pipeline"><img src="https://img.shields.io/badge/Pipeline-SQL_%26_Python-green?style=for-the-badge&logo=python" /></a>
  <a href="docs/README.md"><img src="https://img.shields.io/badge/Docs-17_Modular_Files-purple?style=for-the-badge&logo=read-the-docs" /></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge" /></a>
</p>

---

## 🏬 Business Intelligence Portfolio Suite Context

This project forms **Project 2** within an integrated **4-Project Enterprise Business Intelligence Portfolio Suite**:

* 📈 **[Project 1: Revenue & Sales Performance Analysis](https://github.com/theammarngp-makes/olist-sales-analysis)** — *Macro sales trends, seller performance, regional distribution.*
* 🎯 **[Project 2 (THIS REPOSITORY): Customer RFM Segmentation Analysis](https://github.com/theammarngp-makes/ecommerce-rfm-customer-segmentation)** — *Behavioral cohorting, retention analytics, and CRM strategies.*
* 🔄 **[Project 3: Customer Cohort Retention Analysis](https://github.com/theammarngp-makes/E-commerce-cohort-retention-analysis)** — *Time-series retention matrix, repeat purchase curves, and tenure churn.*
* 📊 **Project 4: Month-over-Month Growth Analysis** — *Growth accounting, run-rate projections, and seasonal forecasting.*

---

## 📌 Executive Summary

In modern multi-category e-commerce marketplaces, rising customer acquisition costs (CAC) make customer retention and lifetime value (CLV) optimization the primary drivers of sustainable profitability. 

This project delivers an enterprise-grade customer segmentation analysis conducted on **94,989 unique customers** and **15,737,667.52 BRL (~15.74M BRL)** in total gross revenue from the **Olist Brazilian E-Commerce dataset**.

Using **RFM (Recency, Frequency, Monetary)** behavioral analytics powered by optimized SQL queries, Python processing scripts, and interactive Tableau dashboards, this project segments the customer base into 5 distinct behavioral cohorts to drive targeted CRM campaigns, protect high-margin revenue, and re-engage dormant buyers.

---

## 📊 Customer Segment Summary & Key Metrics

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

## 💡 Key Strategic Insights

1. **High Revenue Concentration Among Top Cohorts:**
   - **Loyal** (32.12%) and **Champions** (25.98%) generate **58.10% (R$ 9.14M)** of total revenue from 58.00% of the customer base.
   - **Champions** demonstrate an outstanding ARPU of **R$ 306.21** (2.53x higher than Loyal customers at R$ 121.10).

2. **Immediate Churn Revenue at Risk:**
   - **1,900 high-value customers** categorized as **At Risk** represent **R$ 427,933.15** in gross sales exposure.
   - The At-Risk cohort exhibits an ARPU of **R$ 225.23** (second highest ARPU across all segments). Targeted intervention protects this high-margin customer equity.

3. **Trapped Revenue Equity in Lost Customers:**
   - **12,593 users** in the **Lost** cohort previously generated **R$ 2,073,734.79** (13.18% of revenue). Re-activating just 5% of this group unlocks **R$ 103K+** in immediate sales.

---

## 🌐 Tableau Dashboard Preview

<p align="center">
  <img src="dashboard/RFM.png" alt="Tableau Dashboard Preview" width="100%" />
</p>

🔗 **[View Interactive Tableau Dashboard](https://public.tableau.com/views/RFMAnalysis_17734745913220/Dashboard4)**

---

## 🛠️ Analytics Pipeline & Methodology

```
+-----------------------------------------------------------------------------------+
|                        ANALYTICS PIPELINE ARCHITECTURE                           |
+-----------------------------------------------------------------------------------+
|  1. Data Ingestion    -> Join 5 core Olist tables on customer_unique_id          |
|  2. Metric Engine     -> Recency (DATEDIFF), Frequency (COUNT), Monetary (SUM)    |
|  3. RFM Scoring       -> Recency & Monetary NTILE(5), Frequency Custom CASE      |
|  4. Segmentation      -> Champions, Loyal, At Risk, Lost, Others classification   |
|  5. Visual Analytics  -> Tableau Dashboard & Modular Python Visual Distributions  |
+-----------------------------------------------------------------------------------+
```

### RFM Scoring Matrix:
- **Recency (R):** `NTILE(5) OVER (ORDER BY recency ASC)` — Shorter gap = Score 5.
- **Frequency (F):** Custom `CASE` binning (`>=4 -> 5`, `3 -> 4`, `2 -> 3`, `1 -> 1`) addressing single-order data skew.
- **Monetary (M):** `NTILE(5) OVER (ORDER BY monetary DESC)` — Higher spend = Score 5.

---

## 🗂️ Consulting Documentation Inventory (`docs/`)

This repository includes a complete 17-file modular documentation suite adhering to top-tier management consulting standards:

| Document File | Title & Description |
|---|---|
| [`01_AUDIT_AND_ROADMAP.md`](docs/01_AUDIT_AND_ROADMAP.md) | **17-Point Audit & Roadmap:** Comprehensive repository score (scored out of 10) and phased development roadmap. |
| [`01_Executive_Summary.md`](docs/01_Executive_Summary.md) | **Executive Summary:** C-Suite synthesis of customer segmentation results and strategic findings. |
| [`02_Business_Background.md`](docs/02_Business_Background.md) | **Business Background:** Macro context of Brazilian E-commerce and Olist marketplace dynamics. |
| [`03_Business_Problem.md`](docs/03_Business_Problem.md) | **Business Problem:** Single-order retention deficit and unsegmented marketing waste. |
| [`04_Business_Objectives.md`](docs/04_Business_Objectives.md) | **Business Objectives:** Quantitative business targets and technical analytical goals. |
| [`05_Stakeholders.md`](docs/05_Stakeholders.md) | **Stakeholders Analysis:** Matrix mapping CMO, CRM Leads, and Analytics Directors to deliverables. |
| [`06_Business_Questions.md`](docs/06_Business_Questions.md) | **Business Questions:** Strategic analytical questions across Recency, Frequency, and Monetary dimensions. |
| [`07_Project_Scope.md`](docs/07_Project_Scope.md) | **Project Scope:** Boundary definitions for In-Scope deliverables vs Out-of-Scope extensions. |
| [`08_Dataset_Overview.md`](docs/08_Dataset_Overview.md) | **Dataset Overview:** Profile of 94,989 unique customer profiles and Olist database structure. |
| [`09_Data_Model.md`](docs/09_Data_Model.md) | **Data Model & ERD:** Relational Entity-Relationship architecture and join paths. |
| [`10_Methodology.md`](docs/10_Methodology.md) | **RFM Methodology:** Mathematical scoring logic, NTILE rules, and custom frequency binning. |
| [`11_KPI_Definitions.md`](docs/11_KPI_Definitions.md) | **KPI Library:** Exhaustive metrics library with SQL formulas and business rationale. |
| [`12_Business_Insights.md`](docs/12_Business_Insights.md) | **Business Insights:** Empirical findings derived from 94,989 customer transactions. |
| [`13_Business_Recommendations.md`](docs/13_Business_Recommendations.md) | **Strategic Recommendations:** Actionable CRM playbooks and campaign triggers per segment. |
| [`14_Limitations.md`](docs/14_Limitations.md) | **Limitations Audit:** Methodological constraints, frequency skew handling, and data boundaries. |
| [`15_Conclusion.md`](docs/15_Conclusion.md) | **Executive Conclusion:** Unlocked ROI synthesis and BI suite portfolio integration. |
| [`data_dictionary.md`](docs/data_dictionary.md) | **Data Dictionary:** Complete field-level schema specifications for source and output datasets. |

---

## 💻 Tech Stack & Tools

* **Core Language:** SQL (MySQL 8.0+ / PostgreSQL / Snowflake), Python 3.9+
* **Data Processing:** Pandas, NumPy, Datetime
* **Visualization:** Tableau Desktop / Tableau Public, Matplotlib, Seaborn
* **Documentation & Modeling:** GitHub Markdown, Mermaid.js, ERD Schemas

---

## 🚀 How to Run & Execute Pipeline

### 1. Execute SQL Pipeline
Run the SQL scripts in order using any standard SQL client (MySQL Workbench, DBeaver, Snowflake):
```sql
-- Step 1: Base RFM Calculation
SOURCE sql/01_rfm_metrics.sql;

-- Step 2: Scoring, Binning & Segment Aggregates
SOURCE sql/02_customer_segmentation.sql;
```

### 2. Execute Python Pipeline
Clone the repository and run the modular Python processing script:
```bash
# Clone Repository
git clone https://github.com/theammarngp-makes/ecommerce-rfm-customer-segmentation.git
cd ecommerce-rfm-customer-segmentation

# Run Python RFM Engine
python3 python/RFM.py
```

---

## 👤 Author & Contact

**Mohammad Ammar**  
*Principal Data Analytics Consultant*  
- **GitHub:** [@theammarngp-makes](https://github.com/theammarngp-makes)  
- **BI Portfolio:** Enterprise Business Intelligence Portfolio Suite  

---

## ⚖️ License
This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.
