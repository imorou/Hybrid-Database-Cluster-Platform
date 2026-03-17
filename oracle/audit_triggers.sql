CREATE OR REPLACE TRIGGER trg_orders_audit
AFTER INSERT OR UPDATE OR DELETE ON orders
FOR EACH ROW
DECLARE
  v_action VARCHAR2(10);
BEGIN

  IF INSERTING THEN
    v_action := 'INSERT';
  ELSIF UPDATING THEN
    v_action := 'UPDATE';
  ELSE
    v_action := 'DELETE';
  END IF;

  INSERT INTO audit_logs(
    log_id,
    table_name,
    operation,
    user_name,
    operation_time
  )
  VALUES(
    audit_log_seq.NEXTVAL,
    'ORDERS',
    v_action,
    USER,
    SYSDATE
  );

END;
/
