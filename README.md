# Longitudinal Rx Spend & Utilization Analysis: Medicare Part D (2018–2022)

Tools: SQL (MySQL Workbench), Tableau Desktop / Tableau Public  
Data: CMS Medicare Part D Spending by Drug  
Dashboard: [View on Tableau Public](https://public.tableau.com/app/profile/malaysia.goss/viz/MedicarePartDDrugSpendingInsights2022/Dashboard1)

---

## Dashboard Preview

[![Medicare Part D Drug Spending Insights (2022)](./Medicare%20Part%20D%20Drug%20Spending%20Insights%20(2022).png)](https://public.tableau.com/app/profile/malaysia.goss/viz/MedicarePartDDrugSpendingInsights2022/Dashboard1)  
*Click the preview to explore the live dashboard on Tableau Public.*

---

## Overview

I built this project to analyze longitudinal Medicare Part D prescription spending, claims volume, and patient utilization trends from 2018 through 2022. Using MySQL to query and clean the CMS data and Tableau to build the final dashboard, my goal was to look past surface-level numbers and understand what actually drives prescription drug costs—separating pure unit price inflation from volume demand while highlighting high-burden clinical therapies.

---

## 2022 Program Snapshot

* Gross Part D Spend: $216B across all covered brand and generic medications
* Total Claims Processed: 1.19B standard 30-day fills (averaging $182.19 per claim)
* Aggregate Beneficiary Encounters: 80.4M drug-specific patient encounters

Note on the data: CMS records beneficiary counts per drug entity rather than unduplicated unique people across the entire program. If a patient is taking three maintenance meds, they show up once under each drug. Also, gross spend reflects total program dollars before post-sale manufacturer rebates.

---

## Key Findings

### 1. Manufacturer Market Share & Portfolio Concentration
Gross Part D spend is heavily consolidated among a small group of multinational manufacturers, especially Bristol Myers Squibb, Novo Nordisk, Boehringer Ingelheim, and Eli Lilly. High-spend brand therapies for cardiometabolic disease (like SGLT2s and GLP-1s) and anticoagulants account for billions in baseline costs, making them the primary targets for formulary tiering, rebate negotiations, and utilization management.

### 2. High-Burden Specialty Therapies (Cost vs. Volume)
Looking at cost per beneficiary against patient count shows how catastrophic specialty biologics can be on a health plan budget. Rare disease therapies like Strensiq, Myalept, and Vimizim run between $600K to over $1.3M in annual spend per patient, even though they treat fewer than 100 to 500 patients nationwide. This really highlights why managed care plans rely on strict prior authorizations and ongoing clinical reauthorizations to manage risk.

### 3. Unit Cost Inflation (5-Year CAGR Price Growth)
Calculating the 5-year CAGR in price per dosage unit helped isolate drugs where spending spikes came from pure price hikes rather than more patients taking the drug. Several older, legacy products—including Phospholine Iodide, Meperidine HCl, and Lactulose—showed 5-year price CAGRs between 70% and 111%, pointing directly to supply chain issues and lack of generic competition.

### 4. Utilization Intensity & REMS Adherence
Looking at total claims per beneficiary gave a clear picture of real-world fill patterns:
* Standard chronic maintenance therapies sat right around the expected 10 to 12 fills per year.
* Clozapine stood out as a huge outlier at 80.65 claims per beneficiary. This actually reflects real clinical safety workflow: because of the mandatory FDA Clozapine REMS program, patients need regular Absolute Neutrophil Count (ANC) blood labs before getting a refill. That restricts dispensing to weekly or bi-weekly supplies, easily pushing an adherent patient over 52 claims a year.

---

## Repository Structure

```text
├── SQL/                                      # MySQL scripts and analytical queries
├── Tableau.md                                # Tableau documentation and dashboard breakdown
├── Medicare Part D Drug Spending Insights (2022).png # Dashboard preview image
└── README.md                                 # Executive summary and project documentation
