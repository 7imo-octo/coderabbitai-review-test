-- models/my_model.sql
WITH customer_data AS (
    SELECT * FROM customers
)
SELECT
    AVG(age) as average_age
FROM
    customer_data;
