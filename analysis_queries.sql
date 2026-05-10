-- Join customers and transactions tables
SELECT *
FROM customers c
JOIN transactions t
ON c.customer_email = t.customer_email;

-- Overall transaction failure analysis
SELECT
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN t.transaction_failed = 1 THEN 1 ELSE 0 END) AS failed_transactions,
    ROUND(
        SUM(CASE WHEN t.transaction_failed = 1 THEN 1 ELSE 0 END) / COUNT(*) * 100,
        2
    ) AS failed_rate
FROM transactions t;

-- Payment method risk analysis
SELECT
    payment_method_type,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN transaction_failed = 1 THEN 1 ELSE 0 END) AS failed_transactions,
    ROUND(
        SUM(CASE WHEN transaction_failed = 1 THEN 1 ELSE 0 END) / COUNT(*) * 100,
        2
    ) AS failed_rate
FROM transactions
GROUP BY payment_method_type
ORDER BY failed_rate DESC;

-- High risk customer analysis
SELECT
    c.customer_email,
    c.customer_device,
    c.customer_ip_address,
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN t.transaction_failed = 1 THEN 1 ELSE 0 END) AS failed_transactions
FROM customers c
JOIN transactions t
ON c.customer_email = t.customer_email
GROUP BY
    c.customer_email,
    c.customer_device,
    c.customer_ip_address
ORDER BY failed_transactions DESC;
