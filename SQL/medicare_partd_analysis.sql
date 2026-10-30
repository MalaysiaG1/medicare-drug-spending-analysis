use medicare_partd;

-- total medicare spending 2022 (KPI)
select
    round(sum(Tot_Spndng_2022) / 1e9, 2) as total_spending_2022_billions
from medicaid_spending;

-- total benes impacted 2022 (KPI)
select
    round(sum(Tot_Benes_2022) / 1e6, 2) as tot_bene_2022_millions
from medicaid_spending;

-- total claims processed 2022 (KPI)
select
    round(sum(Tot_Clms_2022) / 1e6, 2) as tot_claims_2022_millions
from medicaid_spending;

-- top 10 drugs total spending on drugs 2018
select 
    Gnrc_Name,
    Brnd_Name,
    Tot_Clms_2018,
    Tot_Benes_2018,
    Tot_Spndng_2018
from medicaid_spending
where Tot_Spndng_2018 is not null
order by Tot_Spndng_2018 desc
limit 10;

-- top 10 drugs total spending on drugs 2019
select
    Gnrc_Name,
    Brnd_Name,
    Tot_Clms_2019,
    Tot_Benes_2019,
    Tot_Spndng_2019
from medicaid_spending
where Tot_Spndng_2019 is not null
order by Tot_Spndng_2019 desc
limit 10;

-- top 10 drugs total spending on drugs 2020
select
    Gnrc_Name,
    Brnd_Name,
    Tot_Clms_2020,
    Tot_Benes_2020,
    Tot_Spndng_2020
from medicaid_spending
where Tot_Spndng_2020 is not null
order by Tot_Spndng_2020 desc
limit 10;

-- top 10 drugs total spending on drugs 2021
select
    Gnrc_Name,
    Brnd_Name,
    Tot_Clms_2021,
    Tot_Benes_2021,
    Tot_Spndng_2021
from medicaid_spending
where Tot_Spndng_2021 is not null
order by Tot_Spndng_2021 desc
limit 10;

-- top 10 drugs total spending on drugs 2022
select
    Gnrc_Name,
    Brnd_Name,
    Tot_Clms_2022,
    Tot_Benes_2022,
    Tot_Spndng_2022
from medicaid_spending
where Tot_Spndng_2022 is not null
order by Tot_Spndng_2022 desc
limit 10;

-- view top 10 drugs 2022
create or replace view v_top_10_drugs_2022 as
select
    Gnrc_Name,
    Brnd_Name,
    Tot_Clms_2022,
    Tot_Benes_2022,
    Tot_Spndng_2022
from medicaid_spending
where Tot_Spndng_2022 is not null
order by Tot_Spndng_2022 desc
limit 10;

-- top 10 drugs highest CAGR unit cost
select 
    Gnrc_Name,
    Brnd_Name,
    Tot_Mftr,
    concat(round(CAGR_Avg_Spnd_Per_Dsg_Unt_18_22, 2), '%') as cagr_unit_price
from medicaid_spending
where CAGR_Avg_Spnd_Per_Dsg_Unt_18_22 is not null
order by CAGR_Avg_Spnd_Per_Dsg_Unt_18_22 desc
limit 10;

-- longitudinal spend velocity
select
    Brnd_Name,
    Gnrc_Name,
    Tot_Spndng_2018,
    Tot_Spndng_2019,
    concat(round(((Tot_Spndng_2019 - Tot_Spndng_2018) / nullif(Tot_Spndng_2018, 0)) * 100, 2), '%') as yoy_growth_18_19,
    Tot_Spndng_2020,
    concat(round(((Tot_Spndng_2020 - Tot_Spndng_2019) / nullif(Tot_Spndng_2019, 0)) * 100, 2), '%') as yoy_growth_19_20,
    Tot_Spndng_2021,
    concat(round(((Tot_Spndng_2021 - Tot_Spndng_2020) / nullif(Tot_Spndng_2020, 0)) * 100, 2), '%') as yoy_growth_20_21,
    Tot_Spndng_2022,
    concat(round(((Tot_Spndng_2022 - Tot_Spndng_2021) / nullif(Tot_Spndng_2021, 0)) * 100, 2), '%') as yoy_growth_21_22
from medicaid_spending
where Tot_Spndng_2018 is not null
order by Tot_Spndng_2022 desc;

-- drugs outliers 2022
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
where Outlier_Flag_2022 != 0
order by Tot_Spndng_2022 desc;

-- manufacturer production spending and claims
select
    Mftr_Name,
    sum(Tot_Clms_2018) as tot_claims_2018,
    concat('$ ', round(sum(Tot_Spndng_2018), 2)) as tot_spend_2018,
    sum(Tot_Clms_2019) as tot_claims_2019,
    concat('$ ', round(sum(Tot_Spndng_2019), 2)) as tot_spend_2019,
    sum(Tot_Clms_2020) as tot_claims_2020,
    concat('$ ', round(sum(Tot_Spndng_2020), 2)) as tot_spend_2020,
    sum(Tot_Clms_2021) as tot_claims_2021,
    concat('$ ', round(sum(Tot_Spndng_2021), 2)) as tot_spend_2021,
    sum(Tot_Clms_2022) as tot_claims_2022,
    concat('$ ', round(sum(Tot_Spndng_2022), 2)) as tot_spend_2022
from medicaid_spending
where Mftr_Name is not null
group by Mftr_Name
order by sum(Tot_Spndng_2022) desc;

-- cost per beneficiary vs cost per claim
select
    Brnd_Name,
    Gnrc_Name,
    Avg_Spnd_Per_Bene_2022,
    round(Tot_Spndng_2022 / nullif(Tot_Benes_2022, 0), 2) as calculated_spend_per_bene_2022,
    Avg_Spnd_Per_Clm_2022
from medicaid_spending
where Tot_Benes_2022 is not null
order by calculated_spend_per_bene_2022 desc;

-- utilization intensity claims to beneficiary ratio
select
    Brnd_Name,
    Gnrc_Name,
    Avg_Spnd_Per_Clm_2022,
    Avg_Spnd_Per_Bene_2022,
    round(Tot_Clms_2022 / nullif(Tot_Benes_2022, 0), 2) as claims_per_bene_2022
from medicaid_spending
where Tot_Benes_2022 is not null
order by claims_per_bene_2022 desc;

-- unit cost inflation vs volume growth
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

-- manufacturer market share concentration
with ManufacturerTotals as (
    select
        Mftr_Name,
        count(distinct Brnd_Name) as distinct_drugs_marketed,
        sum(Tot_Spndng_2022) as total_manufacturer_spend_2022
    from medicaid_spending
    where Mftr_Name is not null 
      and Tot_Spndng_2022 is not null
    group by Mftr_Name
),
OverallSpend as (
    select sum(total_manufacturer_spend_2022) as national_total_spend from ManufacturerTotals
)
select
    mt.Mftr_Name,
    mt.distinct_drugs_marketed,
    mt.total_manufacturer_spend_2022,
    round((mt.total_manufacturer_spend_2022 * 100.0) / nullif(os.national_total_spend, 0), 2) as market_spend_percentage_2022
from ManufacturerTotals mt
cross join OverallSpend os
order by mt.total_manufacturer_spend_2022 desc
limit 10;

-- high burden specialty high cost per bene
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
