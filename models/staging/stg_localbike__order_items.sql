SELECT 
  CONCAT(order_id, '_', item_id) AS order_item_id,
  order_id,
  item_id,
  product_id,
  quantity AS item_quantity,
  list_price AS unit_price,
  discount AS discount_applied,
  (list_price * quantity) AS total_order_item_amount,
  (list_price * quantity) * (1 - discount) AS total_order_item_amount_with_discount
FROM {{source ('localbike','order_items')}}