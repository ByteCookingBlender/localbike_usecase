SELECT 
  customer_id,
  first_name AS customer_first_name,
  last_name AS customer_last_name,
  COALESCE (phone,'not available') as customer_phone,
  email AS customer_email,
  city AS customer_city,
  street AS customer_street,
  state AS customer_state,
  zip_code AS customer_zipcode
FROM {{ source ('localbike', 'customers')}}