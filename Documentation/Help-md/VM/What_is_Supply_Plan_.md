What is Supply Plan?




## What is Supply Plan?

In basic terms, the supply plan is what must be supplied
(fabricated or purchased) in order to meet the demand (forecast). The
supply plan is made up of three types of supply orders:

Released orders, Firmed orders, and Planned orders. Because you control
released and firmed orders, VISUAL does not reschedule them during an
MRP run. VISUAL generates planned orders during an MRP run when it finds
supply orders to be less than demand. Planned orders alert you that you
should increase the orders to meet demand. If you do not change the status
of planned orders to either firmed or released before the next MRP run,
VISUAL deletes them and creates new planned orders based on the demand
numbers in effect during the next MRP run. With this check box selected,
VISUAL subtracts on-hand balances from the planned orders that it generates
for items with an order policy of Master Schedule. Functioning in this
manner, VISUAL can accurately display the number of units needed for supply
at the master schedule level.