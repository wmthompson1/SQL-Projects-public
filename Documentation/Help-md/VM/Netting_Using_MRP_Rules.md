Netting Using MRP Rules




# Netting Using MRP Rules

Select Net Using MRP Rules
from the View menu to independently sequence
demand and supply orders by date and align them whenever possible.

This produces a picture of the status of each demand order, and
how its aligned supply order must be adjusted to meet the demand.
Exceptions indicate the number of days a supply order is early or
late in satisfying its associated supply order.

You may find this method easier to work with for materials that
you generally purchase or fabricate for specific jobs, because the
focus is on each demand and what must be done to the corresponding
supply order to meet it.

## Projected Quantity for MRP Rules

This is the projected on-hand quantity after a supply order, if
present, has been received and the demand order has consumed its requirement
from the supply order and/or any existing on-hand balance.

## Exception Messages for MRP Rules

Overstock - There is a projected positive
on-hand balance, and the Net Quantity Due for the supply order exceeds
the Quantity Required for the aligned demand order. Or, there is no
aligned demand order.

Stockout - There is not enough projected
on-hand stock from previous supply orders to meet the Quantity Required
of the demand order.

Order Late - The Due Date of the supply
order is earlier than the current date; the order is late. This exception
only appears for supply orders with no aligned demand orders. This
overrides any other exception that might appear for the order.

n Early / n Late - The Due Date of the
supply order is n days earlier or later than it needs to be to meet
the aligned demand order. Note that this does not provide information
on quantity; the quantity due may not be enough to satisfy the order.

Expedite - This indicates that the requirement
date for the demand order has already passed but the aligned supply
orders due date is in the future.

Due on Time - The Due Date of the supply
order matches the requirement date of the demand order, but projected
quantity is not enough to satisfy the demand.

Rel. Upcoming / Rel. Now / Rel. Past Due
- VISUAL is suggesting a release date for a new supply order due on
this date, because the projected balance for the current date is not
sufficient to meet the demand order for the date. This only occurs
if there is not an aligned supply order; otherwise, an Early, Late,
or Due On Time exception appears.

Rel. Past Due indicates that the suggested release date has already
passed. Rel. Now indicates that the suggested release date is the
current date. Rel. Upcoming indicates the suggested release date is
within 3 days from the current date.

If suggested release date is more than 3 days away, the Stockout
exception message is used.

![btn_mini.gif](btn_mini.gif "btn_mini.gif") User
Defined Information