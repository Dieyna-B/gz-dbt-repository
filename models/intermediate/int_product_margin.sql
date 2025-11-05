select
    date_date,
    products_id,
    sum(revenue) as revenue,
    sum(quantity) as total_qty,
    sum(quantity * purchase_price) as purchase_cost,
    sum (revenue - quantity * purchase_price) as margin
from {{ ref("stg_raw__sales") }}
join {{ ref("stg_raw__product") }} using (products_id)
group by date_date, products_id
