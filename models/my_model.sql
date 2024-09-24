-- models/customer_transaction_report.sql (with mistakes)

WITH customer_data AS (
    SELECT
        c.id AS customer_id,
        name AS customer_name,
        c.age,
        CASE 
            WHEN c.age < 30 THEN 'Under 30'
            WHEN c.age BETWEEN 30 AND 40 THEN '30-40'
            ELSE 'Over 40'
        -- Missing END keyword for the CASE statement (syntax error)
        c.join_date,
        julianday('now') - julianday(c.join_date) AS days_since_joining
    FROM 
        customers c
),

transaction_data AS (
    SELECT
        t.customer_id,
        COUNT(t.id) AS total_transactions,
        SUM(t.transaction_amount) AS total_spent,
        -- Mistake: Incorrect function (AVRG should be AVG)
        AVRG(t.transaction_amount) AS avgTransactionAmount
    FROM 
        transactions t
    -- Mistake: Missing GROUP BY (would throw an error in most databases)
)

-- Final report combining customer and transaction data
SELECT
    cd.customer_name,
    cd.age_bracket,
    cd.days_since_joining,
    td.total_transactions,
    td.total_spent,
    td.avg_transaction_amount
FROM 
    customer_data cd
LEFT JOIN 
    transaction_data td
-- Mistake: Incorrect ON condition (customer_id is not fully qualified)
ON 
    cd.id = td.customer_id;
