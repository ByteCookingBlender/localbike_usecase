SELECT 
  CONCAT(store_id, '_', product_id) AS store_product_id,
  store_id,
  product_id,
  quantity AS product_id_stocked_by_store   
FROM {{source ('localbike','stocks')}}