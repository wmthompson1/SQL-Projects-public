Suggested MPS




# Suggested MPS

You can prompt VISUAL to suggest quantities for your
master product schedule. To activate this feature, select Options,
Calculate Suggested MPS.

These calculations are used to determine suggested MPS:

* If Gross Demand > (Proposed
  Inventory from Previous Period + Current Firmed Orders), then
  Suggested MPS = Gross Demand - (Proposed Inventory from Previous
  Period + Current Firmed Orders)
* If Gross Demand <= (Proposed
  Inventory from Previous Period + Current Firmed Orders), then
  Suggested MPS = 0

These exceptions apply to the calculation:

* For the first period in
  your schedule, the proposed inventory from the previous period
  is equal to the inventory balance of the part based on your netting
  method.
* If the planning period contains
  the current date, then suggested MPS is adjusted for safety stock.
  Safety stock is subtracted from the total quantity of Proposed
  Inventory from Previous Period and Current Firmed Orders.
* If the Use min, max, mult
  for MPS order qtys check box in the Material Requirements Planning
  dialog is selected, then the suggested MPS value is adjusted for
  the minimum, maximum, and multiple order values for the part.

If you use Suggested MPS, then these two rows are added to the Advanced
Material Planning table and to the Master Production Schedule table:

Suggested MPS This row shows the suggested
quantity to add to the master production schedule for the period.

Proposed Inventory This row shows the
quantity that is projected to be available in inventory if you update
your master production schedule with the values from the Suggested
MPS row and then run MRP.