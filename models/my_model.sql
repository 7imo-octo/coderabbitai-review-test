-- models/my_model.sql
WITH customer_data AS (
    SELECT * FROM customers
)
SELECT
    ´customerName´ as customer_name
    CAST(fav_number, INT) as fav_number,
    "favProduct" as fav_product
    ORDER BY fav_number    
FROM
    customer_data;
