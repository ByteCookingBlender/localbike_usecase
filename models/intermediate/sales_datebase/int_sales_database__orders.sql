WITH order_items_grouped_by_orders AS (
  SELECT order_id,
  product_id,
  SUM(total_order_item_amount) AS total_order_amount,
  SUM(total_order_item_amount_with_discount) AS total_order_amount_after_discount,
  SUM(item_quantity) AS total_items,
  COUNT(DISTINCT product_id) AS total_distinct_items
FROM {{ref ('stg_sales_database__order_items')}}
GROUP BY order_id, product_id
)

SELECT o.order_id,
  o.customer_id,
  o.store_id,
  o.staff_id,
  o.order_created_at,
  oi.product_id,
  COALESCE(oi.total_order_amount,0) AS total_order_amount,
  COALESCE(oi.total_order_amount_after_discount,0) AS total_order_amount_after_discount,
  COALESCE(oi.total_items,0) AS total_items,
  COALESCE(oi.total_distinct_items,0) AS total_distinct_items
FROM {{ref ('stg_sales_database__orders')}} AS o
LEFT JOIN order_items_grouped_by_orders AS oi ON o.order_id = oi.order_id