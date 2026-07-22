# Executive Report
## E-Commerce RFM Customer Segmentation & CRM Analytics

**Prepared for:** Executive Leadership, Olist Marketplace
**Prepared by:** Mohammad Ammar — Principal Data Analytics Consultant
**Repository:** [ecommerce-rfm-customer-segmentation](https://github.com/theammarngp-makes/ecommerce-rfm-customer-segmentation)
**Portfolio Context:** Project 2 of 4 — Enterprise Business Intelligence Suite

---

## 1. Purpose of This Report

This report consolidates the findings of the RFM (Recency, Frequency, Monetary) customer segmentation analysis into a single executive-facing document. It is intended to brief senior leadership on customer base composition, revenue concentration, churn exposure, and the recommended CRM response — without requiring review of the full 17-file documentation suite.

For source detail, see:
- [Executive Summary](../docs/01_Executive_Summary.md)
- [Business Problem](../docs/03_Business_Problem.md)
- [Business Insights](../docs/12_Business_Insights.md)
- [Strategic Recommendations](../docs/13_Business_Recommendations.md)

---

## 2. Analysis Scope

The analysis covers **94,989 unique customers** (`customer_unique_id` entities) and **R$ 15,737,667.52** in total gross revenue, drawn from the Olist Brazilian E-Commerce dataset spanning September 2016 – October 2018. Customers were scored on Recency, Frequency, and Monetary dimensions and assigned to one of five behavioral segments. Full methodology is documented in [10_Methodology.md](../docs/10_Methodology.md).

---

## 3. Segment Performance Summary

| Segment | Customers | Customer Share | Revenue (BRL) | Revenue Share | ARPU (BRL) | Strategic Focus |
|---|:---:|:---:|:---:|:---:|:---:|---|
| 🟢 Loyal | 41,740 | 43.94% | R$ 5,054,591.30 | 32.12% | R$ 121.10 | Cross-Selling & Upselling |
| 🔵 Others | 25,402 | 26.74% | R$ 4,092,320.09 | 26.00% | R$ 161.10 | Nurturing & Engagement |
| 🟡 Champions | 13,354 | 14.06% | R$ 4,089,088.19 | 25.98% | R$ 306.21 | VIP Retention & Exclusive Access |
| 🔴 Lost | 12,593 | 13.26% | R$ 2,073,734.79 | 13.18% | R$ 164.67 | Win-Back Automation |
| 🟠 At Risk | 1,900 | 2.00% | R$ 427,933.15 | 2.72% | R$ 225.23 | Urgent Intervention & Reactivation |
| **Total** | **94,989** | **100.00%** | **R$ 15,737,667.52** | **100.00%** | **R$ 165.68** | **Portfolio Revenue Optimization** |

Full derivation logic is documented in [11_KPI_Definitions.md](../docs/11_KPI_Definitions.md).

---

## 4. Key Findings

**4.1 Revenue is concentrated in two segments.**
Loyal (32.12%) and Champions (25.98%) jointly generate 58.10% (R$ 9.14M) of total revenue from 58.00% of the customer base. Champions alone post an ARPU of R$ 306.21 — 1.85x the platform average of R$ 165.68, and 2.53x the ARPU of Loyal customers.

**4.2 A high-value cohort is actively slipping into churn.**
1,900 customers classified At Risk carry R$ 427,933.15 in gross sales exposure and the second-highest ARPU across all segments (R$ 225.23), behind only Champions. This is a premium-spending cohort showing early recency decay, not a low-value group.

**4.3 A large pool of historical revenue is dormant, not lost.**
12,593 customers classified Lost previously generated R$ 2,073,734.79 (13.18% of total revenue). A 5% reactivation rate on this cohort alone recovers over R$ 103K in gross sales at effectively zero incremental acquisition cost.

**4.4 The customer base is structurally single-purchase dominant.**
Frequency scoring required custom `CASE` binning rather than standard `NTILE(5)` quintiles because over 90% of customers in the dataset have completed only one transaction — a structural characteristic addressed directly in the SQL and Python pipelines (see [10_Methodology.md](../docs/10_Methodology.md), [14_Limitations.md](../docs/14_Limitations.md)).

---

## 5. Financial Exposure Summary

| Exposure Category | Segment | Customers | Revenue Exposure |
|---|---|:---:|:---:|
| Immediate churn risk | At Risk | 1,900 | R$ 427,933.15 |
| Trapped historical equity | Lost | 12,593 | R$ 2,073,734.79 |
| **Combined revenue requiring intervention** | — | **14,493** | **R$ 2,501,667.94** |

---

## 6. Recommended Executive Actions

| Priority | Segment | Action | Owner |
|---|---|---|---|
| 1 | Champions | Launch VIP loyalty tier and priority servicing to protect R$ 4.09M in high-margin revenue | Head of CRM |
| 2 | At Risk | Deploy 14-day inactivity win-back triggers to protect R$ 427.93K in immediate exposure | Head of CRM / Performance Marketing |
| 3 | Loyal | Deploy cross-sell recommendation engine to lift ARPU from R$ 121.10 toward R$ 133+ | Category & Merchant Managers |
| 4 | Lost | Automate low-cost win-back email sequences targeting a 5% reactivation rate | Performance Marketing Lead |

Full campaign detail and execution roadmap: [13_Business_Recommendations.md](../docs/13_Business_Recommendations.md).

---

## 7. Supporting Documentation

| Topic | Document |
|---|---|
| Full business case | [03_Business_Problem.md](../docs/03_Business_Problem.md) |
| Quantitative targets | [04_Business_Objectives.md](../docs/04_Business_Objectives.md) |
| Stakeholder requirements | [05_Stakeholders.md](../docs/05_Stakeholders.md) |
| Methodology & scoring logic | [10_Methodology.md](../docs/10_Methodology.md) |
| Known limitations | [14_Limitations.md](../docs/14_Limitations.md) |
| Interactive dashboard | [Tableau Public](https://public.tableau.com/views/RFMAnalysis_17734745913220/Dashboard4) |

---

*This report is a synthesis document. It does not introduce new metrics, segments, or figures beyond those established in the underlying analytical documentation and SQL/Python outputs of this repository.*