SELECT orders.order_created_at AS report_date,
    sto.store_id,
    sto.store_name,
    sto.store_city,
    sta.staff_id,
    CONCAT(sta.staff_first_name, '_', sta.staff_last_name) AS staff_member,
    COUNT(DISTINCT orders.order_id) AS total_orders,
    AVG(orders.total_order_amount) AS average_total_order_amount,
    AVG(orders.total_order_amount_after_discount) AS average_total_order_amount_after_discount
FROM {{ ref('int_sales_database__orders') }} AS orders
LEFT JOIN {{ ref('stg_sales_database__stores') }} AS sto ON orders.store_id = sto.store_id
LEFT JOIN {{ ref('stg_sales_database__staffs') }} AS sta ON orders.staff_id = sta.staff_id
GROUP BY 
    report_date, 
    sto.store_id, 
    sto.store_name, 
    sto.store_city, 
    sta.staff_id, 
    staff_member