CREATE TABLE customers (
    customer_email VARCHAR(50),
    customer_phone VARCHAR(50),
    customer_device VARCHAR(50),
    customer_ip_address VARCHAR(50),
    customer_billing_address VARCHAR(100),
    no_transactions INT,
    no_orders INT,
    no_payments INT,
    fraud_flag VARCHAR(20)
);

CREATE TABLE transactions (
    transaction_id INT,
    customer_email VARCHAR(50),
    order_id INT,
    payment_method_type VARCHAR(50),
    payment_provider VARCHAR(50),
    transaction_amount FLOAT,
    transaction_failed INT,
    order_state VARCHAR(50)
);
