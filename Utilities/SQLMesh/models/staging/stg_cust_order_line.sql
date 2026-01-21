```sql
MODEL (
  name staging.stg_cust_order_line,
  kind FULL
);

SELECT
  line_id,
  cust_order_id,
  line_no,
  part_id,
  order_qty,
  total_shipped_qty,
  unit_price,
  desired_ship_date,
  customer_order_hash
FROM raw.cust_order_line;

```
