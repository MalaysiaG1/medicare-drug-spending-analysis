# Longitudinal Rx Spend & Utilization Analysis: Medicare Part D (2018–2022)

**Tools Used:** SQL (MySQL Workbench), Tableau Desktop / Tableau Public  
**Data Source:** Centers for Medicare & Medicaid Services (CMS) Medicare Part D Spending by Drug  
**Interactive Dashboard:** [View on Tableau Public](https://public.tableau.com/app/profile/malaysia.goss/viz/MedicarePartDDrugSpendingInsights2022/Dashboard1)

---

## Dashboard Preview

[![Medicare Part D Drug Spending Insights (2022)](./Medicare%20Part%20D%20Drug%20Spending%20Insights%20(2022).png)](https://public.tableau.com/app/profile/malaysia.goss/viz/MedicarePartDDrugSpendingInsights2022/Dashboard1)  
*Click the preview image above to interact with the live dashboard on Tableau Public.*

---

## Project Overview

This project analyzes longitudinal Medicare Part D prescription drug spending, claims, and beneficiary utilization data spanning 2018 through 2022. By pairing database querying in MySQL with executive data visualization in Tableau, this analysis evaluates macro spending trends, pharmaceutical market concentration, unit price inflation, and medication utilization patterns across national Medicare populations.

The primary objective is to translate administrative claims data into actionable managed care and health informatics insights—distinguishing between price-driven cost escalation and volume-driven utilization while highlighting high-burden clinical therapies.

---

## Executive Program Metrics (2022)

* **Gross National Part D Spending:** **$216 Billion** across all covered outpatient brand and generic pharmaceuticals.
* **Total Prescription Claims:** **1.19 Billion** standard 30-day fills, averaging **$182.19 per claim**.
* **Aggregate Beneficiary Encounters:** **80.4 Million** drug-specific patient utilization instances.

> **Methodological Note:** In CMS drug-level reporting, beneficiary counts represent aggregate drug encounters rather than unduplicated unique individuals. Patients taking multiple distinct therapies are captured within each respective drug's profile. Gross spend figures reflect overall program expenditures prior to post-sale manufacturer rebates.

---

## Key Analytical Insights & Clinical Findings

### 1. Manufacturer Market Share & Portfolio Concentration
Gross Part D spending is heavily concentrated among top multinational manufacturers—led by Bristol Myers Squibb, Novo Nordisk, Boehringer Ingelheim, and Eli Lilly. High-expenditure brand franchises in cardiometabolic disease (e.g., SGLT2 inhibitors, GLP-1 receptor agonists) and oral anticoagulation drive billions in baseline program liabilities, making them pivotal targets for formulary tier design and manufacturer rebate negotiation.

### 2. High-Burden Specialty Therapies (Cost vs. Volume)
Evaluating cost per beneficiary against patient volume revealed that catastrophic program costs are often driven by ultra-orphan and specialty biologic therapies. Medications such as Strensiq, Myalept, and Vimizim exceed **$600,000 to over $1.3 Million in average annual spend per beneficiary**, despite treating cohorts of fewer than 100 to 500 patients nationwide. These findings illustrate where health plans and PBMs concentrate intensive utilization management, such as prior authorization (PA) and ongoing reauthorization criteria.

### 3. Unit Cost Inflation (5-Year CAGR Price Growth)
Calculating 5-year Compound Annual Growth Rates (CAGR) in price per dosage unit isolated drugs where spending was driven by unit price escalation rather than rising patient demand. Several legacy and specialized agents (including Phospholine Iodide, Meperidine HCl, and Lactulose) demonstrated unit price CAGRs exceeding **70% to 111%** from 2018 to 2022, underscoring pricing pressure from supply chain vulnerabilities and limited multi-source generic competition.

### 4. Medication Utilization Intensity & Safety Monitoring (REMS)
Analyzing the ratio of total prescription claims to total beneficiaries surfaced distinct patient adherence profiles:
* **Adherence Proxies:** Chronic maintenance regimens demonstrated expected maintenance frequencies of 10–12 claims per year.
* **Clinical Protocol & REMS Governance:** **Clozapine** emerged as a significant operational outlier at **80.65 claims per beneficiary**. This finding reflects mandatory clinical governance: under the **FDA Clozapine REMS** program, requirements for ongoing Absolute Neutrophil Count (ANC) blood monitoring restrict dispensing to weekly or bi-weekly supplies, resulting in 52+ distinct claim adjudications per patient annually.

---

## Project Structure

```text
├── sql/
│   └── medicare_partd_analysis.sql           # Data aggregation, CAGR calculations, and ratio queries
├── tableau/
│   └── Medicare_PartD_Spending_2022.twbx     # Packaged Tableau dashboard workbook
├── images/
│   └── Medicare Part D Drug Spending Insights (2022).png  # High-resolution dashboard preview
└── README.md                                 # Executive summary and analytical methodology
