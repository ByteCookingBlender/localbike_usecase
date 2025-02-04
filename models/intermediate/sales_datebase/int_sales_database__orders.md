{% docs int_sales_database__orders %}

This model provides an aggregated view of orders, combining data from multiple sources such as order items and orders. It enriches the order data with the following metrics:

    **Total Order Amount**: The sum of all order items for each order.
    **Total Order Amount After Discount**: The sum of all order items for each order with its discount applicated.
    **Total Items**: The total quantity of items in the order.
    **Total Distinct Items**: The count of distinct product types in the order.

It provides a comprehensive view of each order.

{% enddocs %}