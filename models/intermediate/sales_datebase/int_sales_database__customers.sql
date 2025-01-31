WITH customer_order_summary AS (
  SELECT o.customer_id,
  SUM(oi.total_order_item_amount_with_discount) AS total_order_amount_spent_by_customer,
  SUM(oi.item_quantity) AS total_items_ordered_by_customer,
  COUNT(DISTINCT oi.product_id) AS total_distinct_items_ordered_by_customer
FROM {{ ref('stg_sales_database__order_items')}} AS oi
INNER JOIN {{ ref('stg_sales_database__orders')}} AS o ON oi.order_id = o.order_id
GROUP BY o.customer_id
)

SELECT c.customer_id,
  c.customer_city,
  c.customer_state,
  COALESCE(cos.total_order_amount_spent_by_customer,0) AS total_order_amount_spent_by_customer,
  COALESCE(cos.total_items_ordered_by_customer,0) AS total_items_ordered_by_customer,
  COALESCE(cos.total_distinct_items_ordered_by_customer,0) AS total_distinct_items_ordered_by_customer

FROM {{ ref('stg_sales_database__customers')}} AS c
LEFT JOIN customer_order_summary AS cos ON  c.customer_id = cos.customer_id