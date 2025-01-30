SELECT 
  staff_id,
  store_id,
  first_name AS staff_first_name,
  last_name AS staff_last_name,
  email AS staff_email,
  phone AS staff_phone,
  --I didn't keep the ‘active’ column (a single value) and the ‘manager_id’ column, which seemed to cause confusion with null values.  
FROM {{source ('localbike','staffs')}}
