Setup Manufacturing Costing




# Setup Manufacturing Costing

To make it easier to follow, the calculations presented
in the following examples are for a work order that consists of two
labor operations and two material requirements.

The resources used for this work order are setup with exactly the
same labor rates as the two employees from the employee table used.
FIFO layers for the materials have been established with a unit cost
equal to the parts table unit cost. By using the same rates in the
shop resource and the same cost for materials, cost calculations are
only affected by hours worked and the amount of material issued. In
actuality, the cost calculations would be affected not only by the
hours worked, but also by any differences between shop resource labor
rates used in the estimate and the actual labor rates of the employee
doing the work. The material cost would be affected not only by the
amount of material issued, but also by the individual FIFO layers
which are used as the material is issued vs the "standard"
from the parts table used in the estimate.

The work order parameters are as follows:

Part ID - MMC-FM0001 for a qty of 10

Op#10 - Process#1 - requires 2hrs/piece
- $13/hr & 150% burden rate

Op#20 - Process#2 - requires 3hrs/piece
- $20/hr & 125% burden rate

1RM1 - Raw Matl #1 - requires 2/unit -
$10 each

1RM2 - Raw Matl #2 - requires 1/unit -
$8 each

Using the above, the estimated cost for the work order is:

| Op#10 | $650.00 |
| Op#20 | $1350.00 |
| Total Labor & Burden | $2000.00 |
| 1RM1 | $200.00 |
| 1RM2 | $80.00 |
| Total Matl | $280.00 |
| Total Work order Est. | $2280.00 |

The Administrator Setup command in Labor Ticket Entry has an option
to automatically compute quantity complete.

The first series of examples were run with this option turned off.
In addition, no overtime calculation was used.

## Example #1

The activity processed against this work order is as follows:

All Material Requirements are issued - Total Inventory Cost = $280.00

Input Labor Tickets for exactly half of the required labor hours.
For shop resource Process #1, 10 hours of labor was entered and the
quantity complete field was left blank.

For shop resource Process #2, 15 hours of labor was entered and
the quantity complete field was left blank. No overtime was calculated.
Total labor and burden cost for these two operations = $1000.00.

A review of the Work Order Cost report shows these values in the
Actual cost column. Notice for the material requirements that estimate
= actual = projected. This is because all of the materials, as required,
have been issued to the work order. For the labor requirements however,
the projected cost shows a value of $3000. This is due to the fact
that we have not told the system that any units have been completed.
In calculating remaining cost, even though enough hours have been
entered to complete half the work order (5 units), the system thinks
that there are 10 units remaining to be completed, hence the value
of $3000 Projected labor cost. ($1000 Act + $2000 Est. Remaining)

Total Projected cost of this work order is $3280.00. The other 5
units are then received into stock and they are valued at $1280, which
is the actual cost charged to the work order.

The system used actual cost, not projected, based on the following
calculation:

Total Projected cost / Desired Qty: $3280/10 = $328 / unit projected
cost

Unit Projected \* Received Qty: $328 \* 5 = $1640 received projected
cost

Because the projected cost of $1640 is greater than the $1280 of
actual cost charged to the work order, the value of the 5 units received
is equal to the actual cost.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Costing_Utilities.md) User-defined Help