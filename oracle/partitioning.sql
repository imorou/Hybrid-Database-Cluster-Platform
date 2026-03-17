CREATE TABLE orders_partitioned (
    order_id NUMBER,
    customer_id NUMBER,
    order_date DATE,
    status VARCHAR2(50)
)
PARTITION BY RANGE (order_date)
(
    PARTITION orders_2024 VALUES LESS THAN (DATE '2025-01-01'),
    PARTITION orders_2025 VALUES LESS THAN (DATE '2026-01-01'),
    PARTITION orders_future VALUES LESS THAN (MAXVALUE)
);
