```sql
MODEL (
  name staging.stg_customer_order,
  kind FULL
);

SELECT
  id,
  customer_id,
  order_date,
  create_date,
  desired_ship_date,
  status,
  total_amount,
  customer_order_hash
FROM raw.customer_order;

```
