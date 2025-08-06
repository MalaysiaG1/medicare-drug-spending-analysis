SELECT
  Brand_Name,
  Generic_Name,
  ROUND(Average_Spending_Per_Claim_2023, 2) AS Avg_Spend_Per_Claim
FROM `medicare-part-d-spending.Medicare_Data.cleaned_data`
ORDER BY Avg_Spend_Per_Claim DESC
LIMIT 10;
