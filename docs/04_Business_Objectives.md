# 📄 Business Objectives
## E-Commerce RFM Customer Segmentation

---

## 🎯 Primary Strategic Objectives

The overarching goal of this analytics project is to establish a data-driven **RFM Customer Segmentation Engine** that enables Olist’s executive, marketing, and CRM teams to convert raw transaction history into actionable retention strategies and revenue growth.

```
+-----------------------------------------------------------------------+
|                         BUSINESS OBJECTIVES                           |
+-----------------------------------------------------------------------+
|  1. PROTECT  -> Secure R$ 4.09M Champion Revenue & R$ 427K At-Risk Rev  |
|  2. EXPAND   -> Elevate Loyal Customer ARPU (R$ 121.10 -> R$ 150.00+)   |
|  3. REACTIVATE-> Re-engage 12,593 Lost Customers via Win-Back Automation|
+-----------------------------------------------------------------------+
```

---

## 📊 Quantitative Business Targets

| Objective # | Business Metric | Baseline Value | Target Benchmark | Strategic Impact |
|---|---|:---:|:---:|---|
| **OBJ-1** | **At-Risk Customer Reactivation** | R$ 427,933.15 revenue at risk (1,900 users) | Recover 15-20% of At-Risk cohort | Protect R$ 64K - R$ 85K in annual revenue. |
| **OBJ-2** | **Champion ARPU Retention** | R$ 306.21 ARPU (13,354 Champions) | Maintain >R$ 300.20 ARPU | Lock in R$ 4.09M high-margin revenue. |
| **OBJ-3** | **Loyal Customer Upsell** | R$ 121.10 ARPU (41,740 Loyal users) | Increase ARPU by 10% to R$ 133.20 | Generate +R$ 505K in incremental sales. |
| **OBJ-4** | **Lost Customer Win-Back Rate** | 12,593 Lost Users (R$ 2.07M total historical spend) | Achieve 5% reactivation rate | Re-engage 630 users generating +R$ 100K+. |

---

## 🛠️ Technical Analytical Objectives

1. **SQL Analytics Engine:** Develop production-ready SQL scripts utilizing CTEs, `NTILE(5)` window functions, and custom frequency logic to aggregate 94,989 customer profiles into 5 clean RFM segments.
2. **Python Data Pipeline:** Build a modular Python processing script (`python/rfm_analysis.py`) supporting scalable dataset ingestion, date transformations, RFM calculations, and visual distributions.
3. **Executive Dashboard Suite:** Publish an interactive Tableau dashboard showcasing customer segment distributions, revenue contribution maps, and segment-level ARPU comparisons.
4. **Consulting Documentation Framework:** Deliver a complete 17-file modular documentation suite adhering to McKinsey/BCG standards.
