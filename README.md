# Longitudinal Rx Spend & Utilization Analysis: Medicare Part D (2018–2022)

**Tools Used:** SQL (MySQL Workbench), Tableau  
**Data Source:** Centers for Medicare & Medicaid Services (CMS)  
**Interactive Dashboard:** [View on Tableau Public](https://public.tableau.com/app/profile/malaysia.goss/viz/RxSpendAnalysisMedicarePartD20192023/Dashboard1)

---

## Overview

This project analyzes longitudinal Medicare Part D prescription drug spending and claims data from 2018 to 2022 using SQL in MySQL Workbench and Tableau. By examining spending velocity, unit cost inflation (CAGR), and beneficiary utilization ratios, this project evaluates clinical and economic cost drivers across national Medicare Part D populations to identify high-burden therapeutic areas and market concentration.

---

## Objectives

* **Quantify Macro Spending Trends:** Calculate executive KPIs including national Part D spending, claims processed, and beneficiary counts.
* **Assess Longitudinal Spend Velocity:** Track year-over-year (YoY) expenditure trajectories for the highest-expenditure brand and generic medications.
* **Identify Unit Cost Inflation:** Evaluate 5-year Compound Annual Growth Rates (CAGR) in price per dosage unit to isolate pricing pressure from utilization increases.
* **Evaluate Managed Care Cost Drivers:** Analyze cost-per-beneficiary vs. cost-per-claim dynamics to pinpoint low-volume, high-cost specialty therapies.
* **Map Market Concentration:** Measure manufacturer market share and brand drug portfolio distribution across overall program spend.

---

## Key Managed Care & Analytical Insights

* **Specialty Spend Disproportion:** A small tier of specialty medications with low patient cohorts (<5,000 beneficiaries) accounts for an outsized portion of annual expenditures, driving costs exceeding tens of thousands of dollars per patient.
* **Unit Price Inflation vs. Utilization:** Several high-spend chronic disease therapies demonstrated significant 5-year unit cost CAGR, indicating that price-per-dose inflation plays a heavy role alongside prescription volume.
* **Manufacturer Concentration:** Aggregate spending is heavily consolidated among the top 10 pharmaceutical manufacturers, underscoring key targets for price negotiation, formulary tiering, and utilization management strategies.
* **Adherence & Refill Intensity:** Ratios of total claims to total beneficiaries surfaced therapies requiring high monthly maintenance adherence versus acute, episodic interventions.

---

## Project Structure & Files Included

* `sql/medicare_partd_analysis.sql`: Complete MySQL Workbench script containing schema setup, executive KPI calculations, longitudinal spend velocity queries, and window-function market share analyses.
* `tableau/`: Interactive visualizations, dashboard layouts, and workbook assets.
* `README.md`: Executive summary, clinical methodology, and project documentation.

---

## Dashboard Preview

[Click here to view the interactive dashboard on Tableau Public](https://public.tableau.com/app/profile/malaysia.goss/viz/RxSpendAnalysisMedicarePartD20192023/Dashboard1)

---

## Data Source

This project utilizes the public **Medicare Part D Spending by Drug** longitudinal dataset provided by the [Centers for Medicare & Medicaid Services (CMS)](https://data.cms.gov/).
