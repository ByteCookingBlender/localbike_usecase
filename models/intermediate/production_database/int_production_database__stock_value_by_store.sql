WITH estimated_value_by_product_by_store AS (
  SELECT 
    stocks.store_id,
    stocks.product_id,
    SUM(stocks.product_id_stocked_by_store * products.product_list_price) AS stock_value_per_product_per_store
  FROM {{ref ('stg_production_database__stocks')}} AS stocks
  LEFT JOIN {{ref ('stg_production_database__products')}} AS products 
    ON stocks.product_id = products.product_id
  GROUP BY stocks.store_id, stocks.product_id
), 

estimated_stock_value_by_store AS (
  SELECT 
    store_id,
    SUM(stock_value_per_product_per_store) AS total_stock_value
  FROM estimated_value_by_product_by_store
  GROUP BY store_id
)

SELECT * FROM estimated_stock_value_by_store