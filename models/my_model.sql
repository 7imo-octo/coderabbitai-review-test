-- models/my_model.sql
WITH customer_data AS (
    SELECT * FROM customers
)
SELECT
    `customerName` as customer_name
    CAST(fav_number, INT) as fav_number,
    "favProduct" as fav_product
FROM
    customer_data
ORDER BY fav_number;    
