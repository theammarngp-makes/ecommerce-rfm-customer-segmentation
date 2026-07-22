# 📊 Tableau Dashboard Documentation & User Guide
## E-Commerce RFM Customer Segmentation Dashboard

---

## 📌 Dashboard Purpose

The **E-Commerce RFM Customer Segmentation Dashboard** provides C-suite executives, marketing leaders, and CRM managers with an interactive visual analytical overview of customer purchasing behavior across the **Olist Brazilian E-Commerce dataset**.

The primary purpose of this dashboard is to translate quantitative **RFM (Recency, Frequency, Monetary)** scores into actionable business intelligence. It visualizes total revenue distribution, customer volume share, and Average Revenue Per User (ARPU) across 5 distinct customer behavioral cohorts:

- 🟡 **Champions:** Top-tier VIP spenders with high recency and frequency.
- 🟢 **Loyal:** Consistent repeat buyers generating the largest cumulative revenue.
- 🔵 **Others:** General customer pool requiring engagement and category activation.
- 🔴 **Lost:** Inactive buyers who previously generated significant revenue.
- 🟠 **At Risk:** High-value customers showing early signs of churn.

---

## 👥 Intended Audience

| Stakeholder Role | Primary Dashboard Usage | Key Focus Metrics |
|---|---|---|
| **Chief Marketing Officer (CMO)** | Strategic budget allocation between acquisition and retention campaigns. | Total Gross Revenue, Revenue Share %, Champion & Loyal contribution. |
| **Head of CRM & Retention** | Identifying customer cohorts for automated lifecycle triggers and win-back flows. | At-Risk Revenue Exposure, Lost Customer Volume, Segment ARPU. |
| **Performance Marketing Lead** | Evaluating audience quality and tailoring retargeting strategies. | Segment ARPU comparison, Customer volume per segment. |
| **Lead BI Consultant / Data Analyst** | Validating SQL/Python RFM segmentation accuracy and data distributions. | Metric aggregation fidelity, segment percentage totals. |

---

## 🗺️ Navigation & Layout Guide

The dashboard is structured into three dedicated functional zones:

```
+-----------------------------------------------------------------------------------+
|                            HEADER TITLE BANNER                                    |
|                        "RFM Segmentation Analysis"                                |
+-----------------------------------------------------------------------------------+
|                                                                                   |
|  TOP EXECUTIVE KPI BANNER:                                                        |
|  +-----------------------+  +-----------------------+  +-----------------------+  |
|  | Avg Revenue: 978 BRL  |  | Total Rev: 15.74M BRL |  | Customers: 94,989     |  |
|  +-----------------------+  +-----------------------+  +-----------------------+  |
|                                                                                   |
|  LEFT PANEL:               CENTER PANEL:               RIGHT PANEL:               |
|  Total Revenue by Segment  Average Revenue (ARPU)      Revenue Share (%) Donut    |
|  [Line Chart with Markers] [Vertical Bar Chart]        [Proportional Ring Chart]  |
|                                                                                   |
+-----------------------------------------------------------------------------------+
```

1. **Header Banner:** Displays dashboard title ("RFM Segmentation Analysis").
2. **Top KPI Summary Cards:** Summarizes platform-level benchmarks (`Avg Revenue`, `Total Revenue`, `Customers`).
3. **Left Panel (Revenue Line Chart):** Plots cumulative gross revenue per segment.
4. **Center Panel (Avg Rev Bar Chart):** Compares ARPU across customer segments.
5. **Right Panel (Revenue Share Donut Chart):** Shows percentage contribution of each segment to total platform sales.

---

## 🎛️ Interactive Filters & Actions

- **Segment Highlight Filter:** Clicking any segment slice in the Donut Chart or bar in the Average Revenue Chart filters and highlights the corresponding data points across all dashboard visuals.
- **Hover Tooltips:** Display exact numerical values for Total Revenue, Customer Count, Segment ARPU, and Revenue Share percentage upon hovering over visual elements.

---

## 📊 Summary of Key Performance Indicators (KPIs)

| KPI Name | Display Value | Data Calculation / Logic | Business Context |
|---|:---:|---|---|
| **Avg Revenue** | `978` | Overall platform average revenue metric calculation across completed orders. | Baseline transaction benchmark. |
| **Total Revenue** | `15,737,668` | `SUM(price + freight_value)` across non-canceled orders. | Cumulative gross sales (R$ 15.74M BRL). |
| **Customers** | `94,989` | `COUNT(DISTINCT customer_unique_id)` | Total unique human buyer entities evaluated. |

---

## 💡 Business Decisions Supported

1. **VIP Loyalty Program Investment:** Validates launching an exclusive VIP rewards program for **Champions** who generate **R$ 306.21 ARPU** (2.53x Loyal customers).
2. **Immediate At-Risk Churn Defense:** Directs urgent CRM intervention toward 1,900 **At-Risk** customers with high ARPU (**R$ 225.23**), protecting **R$ 427.93K** in revenue.
3. **Automated Win-Back Lifecycle Campaigns:** Guides low-cost email reactivation campaigns targeting 12,593 **Lost** customers to re-engage **R$ 2.07M** in trapped historical equity.
4. **Cross-Selling Expansion:** Supports personalized cross-selling campaigns for **Loyal** buyers (32.12% revenue share) to elevate their ARPU toward Champion levels.

---

## 🖼️ Dashboard Preview & Asset Location

<p align="center">
  <img src="RFM.png" alt="Tableau RFM Segmentation Analysis Dashboard" width="100%" />
</p>

- **Local Screenshot Asset:** [`dashboard/RFM.png`](file:///Users/mohammadammar/Downloads/Handbook%20&%20Code/ecommerce-rfm-customer-segmentation/dashboard/RFM.png)
- **Interactive Tableau Public Link:** [View Interactive Tableau Dashboard](https://public.tableau.com/views/RFMAnalysis_17734745913220/Dashboard4)
