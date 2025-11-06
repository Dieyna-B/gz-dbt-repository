

SELECT
  date_date,
  COUNT(DISTINCT orders_id) AS total_transactions,
  ROUND(SUM(revenue), 2) AS total_revenue,
  ROUND(SUM(revenue) / COUNT(DISTINCT orders_id), 2) AS average_basket,
  sum (operational_margin) as operational_margin,
  ROUND(SUM(total_qty * purchase_price), 2) AS total_purchase_cost,
  SUM(total_qty) AS total_quantity_sold
FROM {{ ref('int_orders_operational') }}
GROUP BY date_date
ORDER BY date_date