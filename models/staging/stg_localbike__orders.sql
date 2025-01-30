SELECT 
  order_id,
  customer_id,
  store_id,
  staff_id
  order_status,
  order_date AS order_created_at,
  required_date AS order_required_at,
  shipped_date, SAFE.PARSE_DATE('%Y-%m-%d', shipped_date) AS order_shipped_at
FROM {{ source ('localbike','orders') }}