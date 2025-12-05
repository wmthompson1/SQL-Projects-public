Specifying Customer Order Preferences




# Specifying Customer Order Preferences

You can specify several default options to help your Customer Order
Entry users:

1. In the Customer Order
   Entry window, select Preferences from
   the Options menu
2. Click the Default
   Tab arrow and select the tab you want to appear on top
   when you first open the Customer Order Entry widow. You can select:
3. Sold to/Ship
   to
4. Contact
5. Monetary
6. EDI
7. Other

3. In the Default Status
   section, select the default order status you want to use. You
   can select:

Firm Firmed
customer orders exist for planning purposes only. Before you can schedule
a work order, you must change its status to Released.

Released Released
customer orders are orders that you are set to begin producing on
the scheduled start date.

On Hold You
cannot begin work on On Hold orders until you have changed the status
to Released. Select this option if you want to review each order before
it goes to the floor.

4. In the Default Unit
   Prices section, select the following re-evaluation method you
   want VISUAL to use:

Always Re-evaluate Unit
Price Select the Always Re-evaluate Unit Price option to
use the unit price you specified for the part in Part Maintenance.
This is the default setting.

Prompt Before Re-evaluating
Unit Price If you select the Prompt Before Re-evaluate Unit
Price option, the system prompts you to confirm the price update.
If you confirm the update, VISUAL uses the unit price you specified
for the part in Part Maintenance to update the customer order; if
you answer no, VISUAL uses the unit price you entered in the Customer
Order.

Do Not Re-evaluate Unit
Price Select the Do Not Re-evaluate Unit Price option to
use the price you enter for the line in the Customer Order.

5. In the Consignment Auto
   Ship On Save section, select one of the following options:

Never If you
do not want VISUAL to open the Shipping Entry window when you save
a consignment related order, select the Never option

Open Shipping
If you want VISUAL to open the Shipping Entry window and populate
it with the current consignment order, select the Open Shipping option.

Ship Order If
you want VISUAL to ship this consignment order, select the Open Shipping
option. When you save the order, VISUAL opens the Shipping Entry window,
populates it with the current order and performs a Ship All.

VISUAL enforces all of the standard ship
criteria for the auto shipment. For example, if you do not have enough
stock, a message appears.

6. In the Supply Status
   section, select from the following options:

Simple Select
the Simple option if you want the system to calculate the supply status
based on current inventory and planned orders minus current part demand.
The simple calculation does not take into consideration work orders,
purchase order, interbranch transfers, etc., as supply.

Advanced Select
the Advanced option if you want the system to take a material netting
approach to calculating supply. The advanced calculation considers
inventory, supply orders, demand, and allocations. The system also
uses the ATP calculation for master planned parts. The advanced calculation
is more thorough than the simple calculation, but it can negatively
impact the performance of your system.

Auto calculate
Select the check box if you want the system to automatically calculate
supply status when you enter a quantity and a part in customer order
entry. Clear this option if you want to prompt the system to calculate
supply. If you clear this option, click the Calculate Supply button
on the toolbar when you are ready to calculate supply.

7. Click Done.