Viewing Rate-based Parts in the Material Planning Window




# Viewing Rate-based Parts in the Material Planning Window

In the standard view of the Material Planning Window,
one row is created for each day that a rate-based work order is scheduled
or projected to be run. An asterisk is displayed after the work order
ID to indicate that the work order is for a rate-based part.

In the advanced view of the Material Planning Window, use the Planning
Period Details dialog to view daily production quantities of rate-based
parts. Work orders for rate-based parts are not designated with an
asterisk in the advanced view.

You can generate planned orders for rate-based parts. The quantity
of the planned order is equal to the larger of these two values:

* The total quantity required
  by the demand order
* The minimum order quantity
  for the rate-based part

If the quantity on the planned order exceeds the daily rate of the
rate-based part, multiple supply lines are displayed.

If a rate-based part has its own material requirements, then planned
orders can be generated to meet the demand created by the rate-based
part. If the minimum order quantity of the material requirement is
less than the daily run rate of the parent rate-based part, then one
planned supply order is generated for each day of demand.

The ability to generate planned orders depends upon the order policy
of the part. See [MRP Processing](MRP_Processing.htm).