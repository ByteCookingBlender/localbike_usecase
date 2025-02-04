WITH sales_by_product AS (
 
SELECT
    product_id,
    FORMAT_DATE('%Y-%m', order_created_at) AS order_month,  
    SUM(total_items) AS monthly_sales_volume,
    SUM(total_distinct_items) AS montly_distinct_items,
    SUM(total_order_amount) AS monthly_sales_value,
    SUM(total_order_amount_after_discount) AS monthly_sales_value_net
FROM {{ ref('int_sales_database__orders') }}
GROUP BY product_id, order_month
 
)
 
SELECT
    p.product_id,
    p.product_name,
    b.brand_name,
    c.category_name,
    s.order_month,
    s.monthly_sales_volume,
    s.montly_distinct_items,
    s.monthly_sales_value,
    s.monthly_sales_value_net
   
FROM {{ ref('stg_production_database__products') }} AS p
LEFT JOIN sales_by_product AS s ON p.product_id = s.product_id
LEFT JOIN {{ ref('stg_production_database__categories') }} AS c ON p.category_id = c.category_id
LEFT JOIN {{ ref('stg_production_database__brands') }} AS b ON p.brand_id = b.brand_id
ORDER BY s.order_month DESC, s.monthly_sales_value DESC