-- indexes_safe_oracle.sql
DECLARE
  idx_count NUMBER;
BEGIN
  -- Index sur orders(customer_id)
  SELECT COUNT(*) INTO idx_count FROM user_indexes WHERE index_name = 'IDX_ORDERS_CUSTOMER';
  IF idx_count = 0 THEN
    EXECUTE IMMEDIATE 'CREATE INDEX idx_orders_customer ON orders(customer_id)';
  END IF;

  -- Index sur order_items(order_id)
  SELECT COUNT(*) INTO idx_count FROM user_indexes WHERE index_name = 'IDX_ORDER_ITEMS_ORDER';
  IF idx_count = 0 THEN
    EXECUTE IMMEDIATE 'CREATE INDEX idx_order_items_order ON order_items(order_id)';
  END IF;

  -- Index sur order_items(product_id)
  SELECT COUNT(*) INTO idx_count FROM user_indexes WHERE index_name = 'IDX_ORDER_ITEMS_PRODUCT';
  IF idx_count = 0 THEN
    EXECUTE IMMEDIATE 'CREATE INDEX idx_order_items_product ON order_items(product_id)';
  END IF;

  -- Index sur products(category_id)
  SELECT COUNT(*) INTO idx_count FROM user_indexes WHERE index_name = 'IDX_PRODUCTS_CATEGORY';
  IF idx_count = 0 THEN
    EXECUTE IMMEDIATE 'CREATE INDEX idx_products_category ON products(category_id)';
  END IF;

  -- Index sur warehouses(location)
  SELECT COUNT(*) INTO idx_count FROM user_indexes WHERE index_name = 'IDX_WAREHOUSES_LOCATION';
  IF idx_count = 0 THEN
    EXECUTE IMMEDIATE 'CREATE INDEX idx_warehouses_location ON warehouses(location)';
  END IF;

  -- Index sur inventory(product_id)
  SELECT COUNT(*) INTO idx_count FROM user_indexes WHERE index_name = 'IDX_INVENTORY_PRODUCT';
  IF idx_count = 0 THEN
    EXECUTE IMMEDIATE 'CREATE INDEX idx_inventory_product ON inventory(product_id)';
  END IF;

  -- Index sur inventory(warehouse_id)
  SELECT COUNT(*) INTO idx_count FROM user_indexes WHERE index_name = 'IDX_INVENTORY_WAREHOUSE';
  IF idx_count = 0 THEN
    EXECUTE IMMEDIATE 'CREATE INDEX idx_inventory_warehouse ON inventory(warehouse_id)';
  END IF;

END;
/
