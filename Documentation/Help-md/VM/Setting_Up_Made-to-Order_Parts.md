Setting Up Made-to-Order Parts




# Setting Up Made-to-Order Parts

A made-to-order or non-stocked part is a part that you make or acquire
only when you have demand for it. For example, you would manufacture
a made-to-order fabricated part only if a customer had placed an order
for it. You would only purchase a non-stocked part only if you had
a demand for it from a work order.

To set up planning information for made-to-order or non-stocked
parts:

1. Select Inventory,
   Part Maintenance.
2. Click the Part
   ID browse button and select a non-stocked part. A part
   is not stocked if the Stocked check box is cleared in the header.
3. Click the DBR
   tab.
4. Specify this information:

Planner User ID 
Specify the person responsible for material planning for this Part
ID. Depending on your settings in Warehouse Maintenance, a planner
may be responsible for transferring this part to other warehouses
in Inventory Transaction Entry. You can also sort certain material
reports by planner ID.

Buyer User ID 
If this part is a purchased part, specify the person responsible for
buying this Part ID. For purchased parts, buyers are responsible for
acquiring the part. You can use buyer IDs on purchase requisitions
and purchase orders.

Safety Stock Qty 
Specify the quantity of this part to keep on hand to handle unexpected
fluctuations in demand.

Demand Horizon (in days) 
Specify the default demand horizon. The scheduler uses the demand
horizon you specify to search for demand orders. For example, if you
specify 60 in this field, the scheduler looks for demand for the part
from the current date to 60 days in the future.

Min/Max Order Qty 
Specify the minimum and maximum suggested order quantity when placing
a planned order. When the DBR scheduler creates a planned order for
this part, the quantity ordered is not less than the minimum quantity
or more than the maximum quantity. For example, if you had demand
for 50 of this part and the maximum order quantity is 25, the DBR
scheduler plans two orders of 25 to meet the demand. If you had demand
for 3 of this part and the minimum order is 5, then the DBR scheduler
plans an order for a quantity of 5.

Multiples Of 
If you order this part in certain multiples, specify the multiple
in this field. For example, if you specify 6 in this field, you order
this part in multiples of 6, such as 12, 18, and so on. If you had
demand for 8 of this part, the DBR scheduler would plan an order for
a quantity of 12.

Leadtime Buffer (in hours) 
Specify the default amount of time required to supply this part. To
specify one day, enter 24.

Demand Fence 1 and 2
Specify the number of days in a real demand period.

5. Click the Save
   button.