WITH long_format AS (
  SELECT
    Brand_Name,
    Generic_Name,
    Manufacturer_Name,
    year,
    SAFE_CAST(total_spending AS FLOAT64) AS total_spending,
    SAFE_CAST(total_claims AS INT64) AS total_claims,
    SAFE_CAST(total_beneficiaries AS INT64) AS total_beneficiaries,
    SAFE_CAST(avg_spend_per_claim AS FLOAT64) AS avg_spend_per_claim,
    SAFE_DIVIDE(total_spending, total_claims) AS calc_cost_per_claim,
    SAFE_DIVIDE(total_spending, total_beneficiaries) AS calc_cost_per_beneficiary
  FROM (
    SELECT
      Brand_Name,
      Generic_Name,
      Manufacturer_Name,
      
      '2019' AS year,
      Total_Spending_2019 AS total_spending,
      Total_Claims_2019 AS total_claims,
      Total_Beneficiaries_2019 AS total_beneficiaries,
      Average_Spending_Per_Claim_2019 AS avg_spend_per_claim
    FROM `medicare-part-d-spending.Medicare_Data.cleaned_data`
    
    UNION ALL
    SELECT
      Brand_Name,
      Generic_Name,
      Manufacturer_Name,
      '2020', Total_Spending_2020, Total_Claims_2020, Total_Beneficiaries_2020, Average_Spending_Per_Claim_2020
    FROM `medicare-part-d-spending.Medicare_Data.cleaned_data`

    UNION ALL
    SELECT
      Brand_Name,
      Generic_Name,
      Manufacturer_Name,
      '2021', Total_Spending_2021, Total_Claims_2021, Total_Beneficiaries_2021, Average_Spending_Per_Claim_2021
    FROM `medicare-part-d-spending.Medicare_Data.cleaned_data`

    UNION ALL
    SELECT
      Brand_Name,
      Generic_Name,
      Manufacturer_Name,
      '2022', Total_Spending_2022, Total_Claims_2022, Total_Beneficiaries_2022, Average_Spending_Per_Claim_2022
    FROM `medicare-part-d-spending.Medicare_Data.cleaned_data`

    UNION ALL
    SELECT
      Brand_Name,
      Generic_Name,
      Manufacturer_Name,
      '2023', Total_Spending_2023, Total_Claims_2023, Total_Beneficiaries_2023, Average_Spending_Per_Claim_2023
    FROM `medicare-part-d-spending.Medicare_Data.cleaned_data`
  )
)

SELECT *
FROM long_format
WHERE total_spending IS NOT NULL
  AND total_claims IS NOT NULL
  AND total_spending > 0
  AND total_claims > 0;
