select
    date_date,
    orders_id,
    total_qty,
    sum (margin + shipping_fee - logcost - ship_cost) AS Operational_margin
from {{ ref('int_orders_margin') }}
join {{ ref('stg_raw__ship') }} using (orders_id)
group by date_date, orders_id, total_qty
