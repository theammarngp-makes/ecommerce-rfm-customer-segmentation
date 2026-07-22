# Client Summary
## E-Commerce RFM Customer Segmentation — Engagement Overview

**Client Context:** Multi-category e-commerce marketplace (Olist, Brazil)
**Engagement Type:** Customer Behavioral Segmentation & CRM Analytics
**Analyst:** Mohammad Ammar — Principal Data Analytics Consultant

---

## 1. The Business Question

Your marketing and CRM teams are treating a diverse customer base with uniform, blast-style campaigns. This engagement answers a simple question with rigorous data: **which customers matter most, which are about to leave, and what should you do about each group?**

Details of the underlying business problem are documented in [03_Business_Problem.md](../docs/03_Business_Problem.md).

---

## 2. What We Analyzed

- **94,989 unique customers**, identified consistently across multiple orders via `customer_unique_id`
- **R$ 15,737,667.52** in total gross revenue (product price + freight)
- Transaction history from September 2016 through October 2018
- Five relational data tables joined at the customer level (see [09_Data_Model.md](../docs/09_Data_Model.md))

---

## 3. What We Found

Your customer base splits into five clear behavioral groups:

| Segment | Who They Are | Size | Revenue Contribution |
|---|---|:---:|:---:|
| **Champions** | Recent, frequent, high-spend buyers | 13,354 customers | R$ 4,089,088.19 (25.98%) |
| **Loyal** | Consistent repeat buyers | 41,740 customers | R$ 5,054,591.30 (32.12%) |
| **At Risk** | Previously high-value, now going quiet | 1,900 customers | R$ 427,933.15 (2.72%) |
| **Lost** | Inactive, single-purchase buyers | 12,593 customers | R$ 2,073,734.79 (13.18%) |
| **Others** | Moderate activity, unclassified pattern | 25,402 customers | R$ 4,092,320.09 (26.00%) |

**The headline finding:** just under 58% of your customers (Loyal + Champions) generate 58.10% of your revenue — and your Champions spend, on average, 2.53x more than your Loyal customers (R$ 306.21 vs. R$ 121.10 ARPU). Treating these two groups the same way in a marketing calendar leaves money on the table in both directions.

Full findings: [12_Business_Insights.md](../docs/12_Business_Insights.md).

---

## 4. Where the Money Is at Risk

Two groups require immediate attention:

1. **1,900 At-Risk customers** represent R$ 427,933.15 in revenue that is actively slipping away. These are not low-value customers — their average spend (R$ 225.23) is the second-highest of any segment.
2. **12,593 Lost customers** represent R$ 2,073,734.79 in historical spend that has already gone cold. Reactivating even 5% of this group recovers over R$ 103,000 in gross sales — at effectively zero acquisition cost, since these are existing customer relationships.

---

## 5. What We Recommend

| Segment | Recommended Action |
|---|---|
| Champions | VIP loyalty tier, early access, dedicated support — protect the highest-margin revenue base |
| Loyal | Cross-sell and upsell campaigns to lift average spend toward Champion-level behavior |
| At Risk | Automated 14-day inactivity triggers with time-bound offers before customers go fully dormant |
| Lost | Low-cost automated win-back email sequences highlighting previously purchased categories |
| Others | Onboarding and second-purchase incentives to move customers into the Loyal tier |

Detailed campaign design and execution phasing: [13_Business_Recommendations.md](../docs/13_Business_Recommendations.md).

---

## 6. How This Was Built

- **SQL pipeline:** [`sql/01_rfm_metrics.sql`](../sql/01_rfm_metrics.sql), [`sql/02_customer_segmentation.sql`](../sql/02_customer_segmentation.sql) — window-function scoring (`NTILE(5)`) with custom frequency binning to handle single-order skew
- **Python pipeline:** [`python/rfm_analysis.py`](../python/rfm_analysis.py) — reproducible, modular processing
- **Dashboard:** [Interactive Tableau dashboard](https://public.tableau.com/views/RFMAnalysis_17734745913220/Dashboard4) for ongoing self-service exploration

---

## 7. Honest Limitations

This analysis is transactional, not predictive — it tells you what customers have *done*, not what they will do next. It does not include demographic data, web behavior, or forecasting models. See [14_Limitations.md](../docs/14_Limitations.md) for the full constraints list, including why recency is calculated against a fixed historical snapshot rather than a live date.

---

## 8. Next Steps

1. Review segment-level campaign triggers with CRM and performance marketing leads
2. Prioritize At-Risk intervention given its urgency and ARPU profile
3. Establish this RFM model as a recurring (not one-time) analytical process in the data warehouse

Questions on any figure in this summary can be traced directly to the SQL logic in [`sql/`](../sql/) or the methodology in [10_Methodology.md](../docs/10_Methodology.md).