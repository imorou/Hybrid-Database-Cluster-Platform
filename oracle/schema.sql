-- =========================
-- CUSTOMER TABLES
-- =========================

CREATE TABLE customers (
    customer_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR2(100),
    last_name VARCHAR2(100),
    email VARCHAR2(150) UNIQUE,
    phone VARCHAR2(50),
    created_at DATE DEFAULT SYSDATE
);

CREATE TABLE customer_addresses (
    address_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id NUMBER,
    city VARCHAR2(100),
    country VARCHAR2(100),
    postal_code VARCHAR2(20),
    created_at DATE DEFAULT SYSDATE,
    CONSTRAINT fk_customer_addresses_customer
        FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- =========================
-- PRODUCT TABLES
-- =========================

CREATE TABLE product_categories (
    category_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR2(100)
);

CREATE TABLE products (
    product_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR2(200),
    description VARCHAR2(500),
    price NUMBER,
    category_id NUMBER,
    created_at DATE DEFAULT SYSDATE,
    CONSTRAINT fk_products_category
        FOREIGN KEY (category_id) REFERENCES product_categories(category_id)
);

-- =========================
-- WAREHOUSE & INVENTORY
-- =========================

CREATE TABLE warehouses (
    warehouse_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR2(100),
    location VARCHAR2(200),
    created_at DATE DEFAULT SYSDATE
);

CREATE TABLE inventory (
    inventory_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    product_id NUMBER,
    warehouse_id NUMBER,
    quantity NUMBER,
    updated_at DATE,
    CONSTRAINT fk_inventory_product
        FOREIGN KEY (product_id) REFERENCES products(product_id),
    CONSTRAINT fk_inventory_warehouse
        FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
);

-- =========================
-- ORDERS
-- =========================

CREATE TABLE orders (
    order_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    customer_id NUMBER,
    order_date DATE DEFAULT SYSDATE,
    status VARCHAR2(50),
    total_amount NUMBER,
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    order_id NUMBER,
    product_id NUMBER,
    quantity NUMBER,
    price NUMBER,
    CONSTRAINT fk_order_items_order
        FOREIGN KEY (order_id) REFERENCES orders(order_id),
    CONSTRAINT fk_order_items_product
        FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- =========================
-- PAYMENTS
-- =========================

CREATE TABLE payments (
    payment_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    order_id NUMBER,
    payment_method VARCHAR2(50),
    payment_status VARCHAR2(50),
    amount NUMBER,
    created_at DATE DEFAULT SYSDATE,
    CONSTRAINT fk_payments_order
        FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- =========================
-- SHIPPING
-- =========================

CREATE TABLE shipments (
    shipment_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    order_id NUMBER,
    warehouse_id NUMBER,
    shipped_date DATE,
    status VARCHAR2(50),
    CONSTRAINT fk_shipments_order
        FOREIGN KEY (order_id) REFERENCES orders(order_id),
    CONSTRAINT fk_shipments_warehouse
        FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
);

-- =========================
-- AUDIT & MONITORING
-- =========================

CREATE TABLE audit_logs (
    log_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    table_name VARCHAR2(100),
    operation VARCHAR2(50),
    user_name VARCHAR2(100),
    operation_time DATE DEFAULT SYSDATE
);

CREATE TABLE system_metrics (
    metric_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    metric_name VARCHAR2(100),
    metric_value NUMBER,
    collected_at DATE DEFAULT SYSDATE
);
