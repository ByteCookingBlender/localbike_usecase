-- We can see that some SM aren't sellers. Staff_id to exclude in authorized values are [1, 4, 5, 10]
WITH staff_sellout_summary AS (
  SELECT o.staff_id,
  SUM(oi.total_order_item_amount) AS total_amount_sell_by_staff_member,
  SUM(oi.total_order_item_amount_with_discount) AS total_amount_sell_by_staff_with_discount,
  SUM(oi.item_quantity) AS total_items_selled_by_staff_member,
  COUNT(DISTINCT oi.product_id) AS total_distinct_items_selled_by_staff_member
FROM {{ ref ('stg_sales_database__order_items')}} AS oi
INNER JOIN {{ ref ('stg_sales_database__orders')}} AS o ON oi.order_id = o.order_id
GROUP BY o.staff_id
)

SELECT sta.staff_id,
  sta.store_id,
  sto.store_name,
  sto.store_city,
  sto.store_state,
  COALESCE(sss.total_amount_sell_by_staff_member,0) AS total_amount_sell_by_staff_member,
  COALESCE(sss.total_amount_sell_by_staff_with_discount,0) AS total_amount_sell_by_staff_with_discount,
  COALESCE(sss.total_items_selled_by_staff_member,0) AS total_items_selled_by_staff_member,
  COALESCE(sss.total_distinct_items_selled_by_staff_member,0) AS total_distinct_items_selled_by_staff_member
FROM {{ ref ('stg_sales_database__staffs')}} AS sta
LEFT JOIN staff_sellout_summary AS sss ON  sta.staff_id = sss.staff_id
LEFT JOIN {{ ref ('stg_sales_database__stores')}} AS sto ON  sta.store_id = sto.store_id

