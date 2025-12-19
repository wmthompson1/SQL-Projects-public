Behind the Scenes of the Allocation Process




# Behind the Scenes of the Allocation Process

The VISUAL Allocation utility allocates supply to
demand in three passes:

1. Attempt to allocate
   on hand inventory to demand orders in rank (priority), due date
   order.

If supply is sufficient and committed to
all demand orders, allocation is complete. If not, pass 2 and 3 are
still available.

2. Allocate on hand inventory
   to demand in rank (priority), due date order, up to the fill rate
   on the order.
3. Allocate remaining on
   hand inventory and future supply orders to demand orders in rank
   (priority), due date order until supply runs out.

Orders that received fill rate allocation
in pass two are eligible to receive future supply allocation in this
pass.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Allocation_Utilities.md) User-defined Help