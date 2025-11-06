select
    date_date,
    sum (total_transactions) as total_transactions,
    sum (total_revenue) as total_revenue,
    sum (average_basket) as average_basket,
    sum (operational_margin) as operational_margin,
    sum (total_purchase_cost) as total_purchase_cost,
    sum (total_quantity_sold) as total_quantity_sold,
    sum (ads_cost) as ads_cost,
    sum (impression) as impression,
    sum (click) as click,
    sum(operational_margin - ads_cost) as ads_margin
from {{ ref("finance_days") }}
join {{ ref("int_campaigns") }} using (date_date)
group by date_date
order by date_date
