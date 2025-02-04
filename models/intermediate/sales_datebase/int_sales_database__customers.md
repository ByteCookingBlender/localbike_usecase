{% docs int_sales_database__customers %}

This model provides an aggregated view of sellers, combining data from multiple sources such as order items, orders and customers. It enriches the order data with the following metrics:

    **Total Amount Sell by Customer**: The sum of all spends for each customer.
    **Total Amount Sell by Customer with Discount**: The sum of all spends for each customer with the discount applicated.
    **Total Items selled by Customer**: The total quantity of items buyed by each customer.
    **Total Distinct Items selled by Customer**: The count of distinct product types buyed by each customer.

It provides a comprehensive view of each order.

{% enddocs %}