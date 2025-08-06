Select
  Brand_Name,
  Sum(Total_Spending_2023) AS Total_Spend
From `medicare-part-d-spending.Medicare_Data.cleaned_data
Group by Brand_name
Order by Total_Spend DESC
Limit 10;
