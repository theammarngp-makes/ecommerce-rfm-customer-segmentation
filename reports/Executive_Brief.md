# Executive Brief
## E-Commerce RFM Customer Segmentation

**One-page briefing document — Olist customer base, RFM analysis**

---

## The Numbers

| Metric | Value |
|---|---:|
| Total unique customers analyzed | 94,989 |
| Total gross revenue analyzed | R$ 15,737,667.52 |
| Platform-wide ARPU | R$ 165.68 |
| Revenue from Loyal + Champions | R$ 9,143,679.49 (58.10%) |
| Revenue exposed in At Risk | R$ 427,933.15 |
| Revenue dormant in Lost | R$ 2,073,734.79 |

---

## The Situation

Olist's customer base is not homogeneous. Five behavioral segments exist, each requiring a different CRM approach:

- **Champions (13,354 / 14.06%)** — R$ 306.21 ARPU. Your most profitable customers, currently receiving no differentiated treatment.
- **Loyal (41,740 / 43.94%)** — R$ 121.10 ARPU. Your largest cohort by volume; largest single revenue contributor by segment.
- **At Risk (1,900 / 2.00%)** — R$ 225.23 ARPU. High-value customers going quiet. Second-highest ARPU of any segment.
- **Lost (12,593 / 13.26%)** — R$ 164.67 ARPU. Previously active, now fully dormant.
- **Others (25,402 / 26.74%)** — R$ 161.10 ARPU. Moderate activity, unclear trajectory.

Source table: [Business Insights](../docs/12_Business_Insights.md).

---

## Why It Matters Now

- **R$ 427,933.15** in At-Risk revenue is actively decaying. This cohort's ARPU (R$ 225.23) is the second-highest of any segment — these are not marginal customers.
- **R$ 2,073,734.79** sits dormant in the Lost segment. A 5% win-back rate recovers R$ 100K+ at near-zero acquisition cost.
- Blast-style, undifferentiated marketing simultaneously **overspends** retaining Champions (who would convert regardless) and **underspends** on At-Risk intervention (where timing determines outcome).

---

## The Decision Being Asked

Approve segment-differentiated CRM execution across four workstreams:

1. VIP retention program for Champions
2. Cross-sell engine for Loyal customers
3. Automated 14-day inactivity trigger for At-Risk customers
4. Low-cost automated win-back sequence for Lost customers

Full execution roadmap with phasing: [13_Business_Recommendations.md](../docs/13_Business_Recommendations.md).

---

## Supporting Detail

| For | Read |
|---|---|
| Full quantitative targets | [04_Business_Objectives.md](../docs/04_Business_Objectives.md) |
| Methodology behind the segments | [10_Methodology.md](../docs/10_Methodology.md) |
| Known limitations | [14_Limitations.md](../docs/14_Limitations.md) |
| Live dashboard | [Tableau Public](https://public.tableau.com/views/RFMAnalysis_17734745913220/Dashboard4) |

---

*Prepared by Mohammad Ammar, Principal Data Analytics Consultant. All figures sourced directly from SQL/Python pipeline outputs in this repository — see [`sql/`](../sql/) and [`python/`](../python/).*