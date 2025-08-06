SELECT
  Brand_Name,
  Generic_Name,
  ROUND(CAGR_Average_Spend_Per_Dosage_Unit_2019_2023, 4) AS CAGR_Spend_Per_Unit
FROM `medicare-part-d-spending.Medicare_Data.cleaned_data`
ORDER BY CAGR_Spend_Per_Unit DESC
LIMIT 10;
