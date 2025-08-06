SELECT
  '2019' AS Year, SUM(Total_Spending_2019) AS Total_Spend FROM `medicare-part-d-spending.Medicare_Data.cleaned_data`
UNION ALL
SELECT
  '2020', SUM(Total_Spending_2020) FROM `medicare-part-d-spending.Medicare_Data.cleaned_data`
UNION ALL
SELECT
  '2021', SUM(Total_Spending_2021) FROM `medicare-part-d-spending.Medicare_Data.cleaned_data`
UNION ALL
SELECT
  '2022', SUM(Total_Spending_2022) FROM `medicare-part-d-spending.Medicare_Data.cleaned_data`
UNION ALL
SELECT
  '2023', SUM(Total_Spending_2023) FROM `medicare-part-d-spending.Medicare_Data.cleaned_data`;
