# Management Report
## E-Commerce RFM Customer Segmentation — Operational Detail

**Audience:** CRM Leads, Performance Marketing, Category Managers, Analytics Managers
**Purpose:** Operational-level detail supporting segment-specific campaign execution

---

## 1. Report Scope

This report provides the operational detail beneath the [Executive Report](Executive_Report.md) — intended for managers responsible for executing, not just approving, the CRM response to the RFM segmentation findings. It maps each segment to owners, triggers, and channels.

---

## 2. Segment Operating Detail

### 2.1 Champions — 13,354 customers, R$ 4,089,088.19 (25.98% of revenue)
- **Scoring rule:** `r_score >= 4 AND f_score >= 4 AND m_score >= 4` ([10_Methodology.md](../docs/10_Methodology.md))
- **ARPU:** R$ 306.21 (highest of all segments; 1.85x platform average)
- **Owner:** Head of CRM & Retention
- **Objective:** VIP Retention & Margin Defense
- **Actions:** VIP loyalty tier ("Olist Select"), early access to sales, dedicated support, product preview access
- **Channels:** Exclusive email, WhatsApp VIP concierge, push notification
- **Timing:** Phase 1 (Weeks 1–4) per [13_Business_Recommendations.md](../docs/13_Business_Recommendations.md)

### 2.2 Loyal — 41,740 customers, R$ 5,054,591.30 (32.12% of revenue)
- **Scoring rule:** `r_score >= 3 AND f_score >= 3`
- **ARPU:** R$ 121.10
- **Owner:** Category & Merchant Managers
- **Objective:** Revenue Expansion & Cross-Sell
- **Actions:** Cross-selling recommendation engines based on past product categories; free-shipping thresholds to increase order value
- **Channels:** Personalization emails, in-app banner callouts
- **Timing:** Phase 2 (Weeks 5–8)
- **Target:** +10% ARPU (R$ 121.10 → R$ 133.20), generating approximately +R$ 505K in incremental sales ([04_Business_Objectives.md](../docs/04_Business_Objectives.md))

### 2.3 At Risk — 1,900 customers, R$ 427,933.15 (2.72% of revenue)
- **Scoring rule:** `r_score <= 2 AND f_score >= 3`
- **ARPU:** R$ 225.23 (second-highest of all segments)
- **Owner:** Head of CRM & Retention / Performance Marketing Lead
- **Objective:** Urgent Reactivation & Intervention
- **Actions:** Automated "We Miss You" sequences with time-bound 15% discount codes triggered within 14 days of inactivity threshold
- **Channels:** SMS reminders, retargeting ads, targeted email
- **Timing:** Phase 1 (Weeks 1–4)
- **Target:** Recover 15–20% of cohort, protecting R$ 64K–R$ 85K in annual revenue

### 2.4 Lost — 12,593 customers, R$ 2,073,734.79 (13.18% of revenue)
- **Scoring rule:** `r_score = 1 AND f_score = 1`
- **ARPU:** R$ 164.67
- **Owner:** Performance Marketing Lead
- **Objective:** Win-Back Automation
- **Actions:** Low-cost automated win-back email sequences highlighting new arrivals in previously purchased categories
- **Channels:** Automated lifecycle email triggers
- **Timing:** Phase 3 (Weeks 9–12)
- **Target:** 5% reactivation rate, re-engaging ~630 users and generating +R$ 100K+

### 2.5 Others — 25,402 customers, R$ 4,092,320.09 (26.00% of revenue)
- **Scoring rule:** All remaining combinations (`ELSE`)
- **ARPU:** R$ 161.10
- **Owner:** Performance Marketing Lead
- **Objective:** Nurturing & Activation
- **Actions:** Educational onboarding drips, review incentives, second-purchase promotional offers
- **Channels:** Onboarding email drips, retargeting ad campaigns

---

## 3. Execution Roadmap

Phase 1: High-Value Defense (Weeks 1-4)
VIP Loyalty Concierge for 13,354 Champions (ARPU R$ 306.21)
14-day inactivity alerts for 1,900 At-Risk users (R$ 427.93K rev)

Phase 2: Revenue Expansion (Weeks 5-8)
Category Recommendation Engine for 41,740 Loyal users (ARPU R$ 121.10)

Phase 3: Automated Win-Back & Nurturing (Weeks 9-12)
Email win-back sequences for 12,593 Lost users
Source: [13_Business_Recommendations.md](../docs/13_Business_Recommendations.md).

---

## 4. Reporting Cadence & Ownership Matrix

| Stakeholder | Deliverable Owned | Reference |
|---|---|---|
| CMO | Overall retention ROI narrative | [Executive Report](Executive_Report.md) |
| Head of CRM & Retention | Champions + At-Risk campaign execution | [05_Stakeholders.md](../docs/05_Stakeholders.md) |
| Performance Marketing Lead | At-Risk + Lost channel execution, CAC discipline | [05_Stakeholders.md](../docs/05_Stakeholders.md) |
| VP of Analytics & BI | Pipeline reproducibility, data governance | [09_Data_Model.md](../docs/09_Data_Model.md) |
| Category & Merchant Managers | Loyal segment cross-sell content | [13_Business_Recommendations.md](../docs/13_Business_Recommendations.md) |

---

## 5. Data & Pipeline Reference

| Component | Location |
|---|---|
| Recency/Frequency/Monetary base metrics | [`sql/01_rfm_metrics.sql`](../sql/01_rfm_metrics.sql) |
| Scoring & segmentation logic | [`sql/02_customer_segmentation.sql`](../sql/02_customer_segmentation.sql) |
| Python processing pipeline | [`python/rfm_analysis.py`](../python/rfm_analysis.py) |
| Segment output data | [`insights/RFM Segmentation Analysis.csv`](../insights/RFM%20Segmentation%20Analysis.csv) |
| Field-level schema | [data_dictionary.md](../docs/data_dictionary.md) |

---

## 6. Constraints Managers Should Know

- Recency is computed against a fixed historical snapshot (`2018-09-03`), not a live date — in a production deployment, recalculation against `CURRENT_DATE()` is required before triggers go live operationally. See [14_Limitations.md](../docs/14_Limitations.md).
- Over 90% of customers are single-purchase buyers, which is why Frequency scoring uses custom `CASE` binning rather than standard quintiles.
- Segmentation is transaction-based only; no demographic or behavioral (web/app) data is incorporated.