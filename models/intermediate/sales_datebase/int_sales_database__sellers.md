{% docs int_sales_database__sellers %}

This model provides an aggregated view of sellers, combining data from multiple sources such as order items, orders, stores and staffs. It enriches the order data with the following metrics:

    **Total Amount Sell by Staff Member**: The sum of all sells for each staff member.
    **Total Amount Sell by Staff Member with Discount**: The sum of all sells for each staff member with its discount applicated.
    **Total Items selled by Staff Member**: The total quantity of items selled by each staff member.
    **Total Distinct Items selled by Staff Member**: The count of distinct product types selled by each staff member.

It provides a comprehensive view of each order.

{% enddocs %}