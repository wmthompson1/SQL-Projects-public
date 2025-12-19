Splitting Work Orders




# Splitting Work Orders

You can split work orders if you want to speed the
production of a specific quantity of an order for delivery. You should
think of the original work order as the parent work order and the
split work order as the child. A parent work order may have many child
work orders.

When you split a work order, VISUAL prorates Operation, Material
and Service costs for operations sequentially numbered before the
split according to the ratio of the Split Quantity to the original
Desired Quantity. It is important to remember that with ending quantity
VISUAL takes into consideration scrap through all of the operations.
When you split a work order, the split amount must also reflect the
same assumed scrap quantities.

For example, you may have a desired quantity of 1000 for a work
order. Because each of the three operations generates 10% scrap, VISUAL
plans for a quantity of 1372.

Costs that you incur for sequentially numbered operations after
the split reside solely on the parent work order or child work order
respectively. You must pay special attention to materials and services
that are linked to Purchase Orders. Parent and Child work orders share
costs by assigning portions of the Purchase Order to the splits.

If you are licensed to use multiple sites, you can split work orders
within the same site only. The child split work orders are created
in the same site as the parent work order.

Split Work Order numbering conventions:

A Split Order can be identified by the decimal point in the Lot
ID.

* 40001 / 1 is Work Order
  ID 40001 - Lot ID = 1 Split ID = 0 = A Parent Work Order
* 4001 / 1. is Work Order
  ID 40001 - Lot ID =1 Split ID = 1 =A Child Work Order

Base ID - Sub ID / Lot
ID . Split ID

(Operation Sequence Number)

* Operation 40 of Sub ID 3
  of Work Order 40009 Lot 2 Split 1 appears abbreviated as: 40009-3
  / 2.1 (40)
* When Sub ID and Split ID
  are zero, they are omitted from the abbreviation, therefore Operation
  40 of Sub ID of Work Order 40009 Lot 2 Split 0 appears abbreviated
  as: 4009 / 2 (40)

1. To access the Split
   Work Order dialog box, select Split Work Order
   from the Edit menu.

The point in the work order (the Split ID
and Sub ID) at which you want to split the work order appears in the
read-only fields at the top of the dialog box.

2. Enter a new Split ID
   into the New Split ID field.
3. Enter the split quantity
   for the order in the Split quantity for order field.
4. Enter the split quantity
   for the operation in the Split quantity for operation field.

The split quantity for the order must be
greater than zero and less than the order quantity.

5. Select a Release Date
   and Want Date. Use the calendar button or manually enter a date.
6. Select the items to
   copy to the split work order:

Copy All Document References
Select this option to copy all document references from the original
work order to the split work order.

Copy All Reference Designators
Select this option to copy reference designators from the material
cards.

Copy Alternate Parts
Select this option to copy the alternate parts from the material
cards.

7. Click Ok
   to split the work order.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Manufacturing_Window.md) User-defined Help