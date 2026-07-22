# 📄 Analytical Limitations & Methodological Constraints
## E-Commerce RFM Customer Segmentation

---

## 📌 Transparent Analytical Audit

To maintain rigorous consulting standards, this document outlines the analytical limitations, data boundaries, and methodological assumptions inherent in the current RFM segmentation model.

---

## 🔍 Key Data & Methodological Constraints

### 1. Severe Frequency Distribution Skewness
- **Finding:** In the Olist e-commerce marketplace, over **90% of unique customers** complete only 1 transaction within the dataset timeframe.
- **Analytical Impact:** Applying standard equal-percentile binning (`NTILE(5)`) to raw frequency produces duplicate cutoffs where percentile boundaries fall on frequency value `1`. 
- **Mitigation:** SQL scripts address this technical limitation by overriding raw quintiles with explicit `CASE` statements (`frequency >= 4 -> Score 5`, `frequency = 3 -> Score 4`, etc.).

### 2. Snapshot-Based Recency Static Horizon
- **Finding:** Recency is calculated relative to the static maximum timestamp present in the historical dataset (`2018-09-03`).
- **Analytical Impact:** In a live production environment, recency metrics must dynamically recalculate daily relative to `CURRENT_DATE()` to ensure real-time CRM trigger accuracy.

### 3. Lack of Customer Demographic & Psychographic Attributes
- **Finding:** The dataset is strictly transactional (order timestamps, item prices, shipping codes) and lacks direct demographic data (age, income bracket, gender) or web behavioral telemetry (page views, cart abandonments).
- **Analytical Impact:** Segmentations are based exclusively on historical transaction behavior.

### 4. Freight Cost Inclusion in Monetary Spend
- **Finding:** Olist shipping fees vary significantly across Brazil's 27 states, representing up to 30% of total order cost in remote regions.
- **Analytical Impact:** Gross monetary calculations include freight value (`price + freight_value`). While this reflects total customer financial outlay, high freight costs in distant states can artificially elevate a customer's Monetary percentile.
