use medicare_partd;
-- top 10 drugs total spendig on drugs 2018
SELECT 
    Gnrc_Name,
    Brnd_Name,
    Tot_Clms_2018,
    Tot_Benes_2018,
    Tot_Spndng_2018
FROM medicaid_spending
where Tot_Spndng_2018  is not null
ORDER BY Tot_Spndng_2018 DESC
LIMIT 10;


-- top 10 drugs total spendig on drugs 2019
select
	Gnrc_Name,
    Brnd_Name,
    Tot_Clms_2019,
    Tot_Benes_2019,
    Tot_Spndng_2019
from medicaid_spending
where Tot_Spndng_2019  is not null
order by Tot_Spndng_2019 DESC
limit 10;

-- top 10 drugs total spendig on drugs 2020
select
	Gnrc_Name,
    Brnd_Name,
    Tot_Clms_2020,
    Tot_Benes_2020,
    Tot_Spndng_2020
from medicaid_spending
where Tot_Spndng_2020  is not null
order by Tot_Spndng_2020 DESC
limit 10;

-- top 10 drugs total spendig on drugs 2021
select
	Gnrc_Name,
    Brnd_Name,
    Tot_Clms_2021,
    Tot_Benes_2021,
    Tot_Spndng_2021
from medicaid_spending
where Tot_Spndng_2021  is not null
order by Tot_Spndng_2021 DESC
limit 10;

-- top 10 drugs total spendig on drugs 2022
select
	Gnrc_Name,
    Brnd_Name,
    Tot_Clms_2022,
    Tot_Benes_2022,
    Tot_Spndng_2022
from medicaid_spending
where Tot_Spndng_2022  is not null
order by Tot_Spndng_2022 DESC
limit 10;

create view v_top_10_drugs_2022 as
select
	Gnrc_Name,
    Brnd_Name,
    Tot_Clms_2022,
    Tot_Benes_2022,
    Tot_Spndng_2022
from medicaid_spending
where Tot_Spndng_2022  is not null
order by Tot_Spndng_2022 DESC
limit 10;

-- top 10 drugs w/ highest CAGR
SELECT 
    Gnrc_Name,
    Brnd_Name,
    Tot_Mftr,
    concat(round(CAGR_Avg_Spnd_Per_Dsg_Unt_18_22, 3) , '%') as CAGR_Avg_Spnd_Per_Dsg_Unt_18_22
FROM medicaid_spending
WHERE CAGR_Avg_Spnd_Per_Dsg_Unt_18_22 IS NOT NULL
ORDER BY CAGR_Avg_Spnd_Per_Dsg_Unt_18_22 DESC
LIMIT 10;

-- longitudinal spend velocity
select
Brnd_Name,
Gnrc_Name,
Tot_Spndng_2018,
concat(round((Tot_Spndng_2019 /Tot_Spndng_2018), 2) * 100 , '%') as tot_spnd_perc_change_18_19,
Tot_Spndng_2019,
concat(round((Tot_Spndng_2020 /Tot_Spndng_2019), 2) * 100 , '%') as tot_spnd_perc_change_19_20,
Tot_Spndng_2020,
concat(round((Tot_Spndng_2021 /Tot_Spndng_2020), 2) * 100 , '%') as tot_spnd_perc_change_20_21,
Tot_Spndng_2021,
concat(round((Tot_Spndng_2022 /Tot_Spndng_2021), 2) * 100 , '%') as tot_spnd_perc_change_21_22,
Tot_Spndng_2022
from medicaid_spending
order by  Tot_Spndng_2022 desc
;

-- drugs w/ ourliers 2022
select 
Brnd_Name,
Gnrc_Name,
Tot_Mftr,
Mftr_Name,
Tot_Spndng_2022,
Tot_Dsg_Unts_2022,
Tot_Benes_2022,
Avg_Spnd_Per_Dsg_Unt_Wghtd_2022,
Avg_Spnd_Per_Clm_2022,
Avg_Spnd_Per_Bene_2022
 from medicaid_spending
where Outlier_Flag_2022 != 0 ;


-- manufactor production and spending  and claims
select
	Mftr_Name,
    sum(Tot_Clms_2018) as tot_claims_2018,
    concat( '$ ',  round(sum(Tot_Spndng_2018),2)) as tot_spend_2018,
    sum(Tot_Clms_2019) as tot_claims_2019,
    concat( '$ ',round(sum(Tot_Spndng_2019),2)) as tot_spend_2019,
    sum(Tot_Clms_2020) as tot_claims_2020,
    concat( '$ ',round(sum(Tot_Spndng_2020), 2)) as tot_spend_2020,
    sum(Tot_Clms_2021) as tot_claims_2021,
    concat( '$ ',round(sum(Tot_Spndng_2021), 2)) as tot_spend_2021,
    sum(Tot_Clms_2022) as tot_claims_2022,
    concat( '$ ',round(sum(Tot_Spndng_2022), 2)) as tot_spend_2022
from medicaid_spending
group by Mftr_Name;

-- cost per beneficary vs cost per claim
select
	Brnd_Name,
    Gnrc_Name,
    Avg_Spnd_Per_Bene_2022,
    round(sum(Tot_Spndng_2022/Tot_Benes_2020), 2) as tot_spend_per_bene,
    Avg_Spnd_Per_Clm_2022
from medicaid_spending
group by Brnd_Name, Gnrc_Name,Avg_Spnd_Per_Clm_2022, Avg_Spnd_Per_Bene_2022
order by tot_spend_per_bene desc;

-- Utilization Intensity (Claims-to-Beneficiary Ratio)
select
	Brnd_Name,
    Gnrc_Name,
    Avg_Spnd_Per_Clm_2022,
    Avg_Spnd_Per_Bene_2022,
     round(sum(Tot_Clms_2022/Tot_Benes_2022),2) as claims_per_bene_2022
from medicaid_spending
group by Brnd_Name,Gnrc_Name,Avg_Spnd_Per_Clm_2022,
    Avg_Spnd_Per_Bene_2022 
order by claims_per_bene_2022 desc ;

 -- Unit Cost Inflation vs. Volume Growth (2018-2022)
select
    Brnd_Name,
    Gnrc_Name,
    Tot_Dsg_Unts_2018,
    Tot_Dsg_Unts_2022,
    round(CAGR_Avg_Spnd_Per_Dsg_Unt_18_22, 2) as cagr_unit_price
from medicaid_spending
where CAGR_Avg_Spnd_Per_Dsg_Unt_18_22 is not null
order by cagr_unit_price desc
limit 10;

-- growth spending from 2021 to 2022
select
    Brnd_Name,
    Gnrc_Name,
    Tot_Spndng_2021,
    Tot_Spndng_2022,
    round((Tot_Spndng_2022 - Tot_Spndng_2021) / nullif(Tot_Spndng_2021, 0) * 100, 2) as yoy_spend_growth_pct
from medicaid_spending
where Tot_Spndng_2021 > 1000000 
  and Tot_Spndng_2021 is not null 
  and Tot_Spndng_2022 is not null
order by yoy_spend_growth_pct desc
limit 10;

-- manufacturer market share conc. (donut chart)
select
    Mftr_Name,
    count(distinct Brnd_Name) as distinct_drugs_marketed,
    sum(Tot_Spndng_2022) as total_manufacturer_spend_2022,
    round(
        sum(Tot_Spndng_2022) * 100.0 / sum(sum(Tot_Spndng_2022)) over (), 
        2
    ) as market_spend_percentage_2022
from medicaid_spending
where Mftr_Name is not null 
  and Tot_Spndng_2022 is not null
group by Mftr_Name
order by total_manufacturer_spend_2022 desc
limit 10;

-- high burden specailty/ high cost per bene
select
    Brnd_Name,
    Gnrc_Name,
    Tot_Benes_2022,
    Tot_Spndng_2022,
    Avg_Spnd_Per_Bene_2022
from medicaid_spending
where Tot_Benes_2022 < 5000 
  and Avg_Spnd_Per_Bene_2022 is not null
order by Avg_Spnd_Per_Bene_2022 desc
limit 10;

-- total medicare spending 2022 (KPI)
select
	sum(Tot_Spndng_2022) as total_spending_2022
from medicaid_spending;

-- total benes impacted 2022 (KPI)
select
	sum(Tot_Benes_2022) as tot_bene_2022
from medicaid_spending;

-- total claims proccessed (KPI)
select
	sum(Tot_Clms_2022) as tot_claims_2022
from medicaid_spending;
