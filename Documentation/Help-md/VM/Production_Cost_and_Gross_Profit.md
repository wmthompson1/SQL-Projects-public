Production Cost and Gross Profit View Panel Chart




# Production Cost & Gross Profit View Panel Chart

The Production Cost & Gross Profit Panel chart shows information
about costs and anticipated profit for the order. Costs and profit
are shown at the site level. All values are shown in the functional
currency of the sites parent accounting entity.

The chart has two lines and three bars. These two lines are shown:

Sell Price The extended price of the
customer order is displayed. The extended price is calculated by multiplying
the unit price by the number of units ordered and then applying any
pertinent discounts for all lines in the order.

Profit The profit is calculated by subtracting
the projected costs from the sell price. If the projected costs are
higher than the sell price, then no profit line is shown. If no costs
have been specified for the part, then the Profit line is equal to
the Sell Price line. In this case, the Sell Price line is superimposed
on the Profit line.

This table shows information about the bars in the chart:

| Bar | This bar shows... |
| Estimated Costs | The estimated costs to produce the quantity in the order.  For lines that are linked to a work orders, the work order is used to calculate estimated costs. The costs are prorated if the linked quantity from the customer order is less than the total quantity produced by the work order. If a part in the order is not linked to a work order, then the standard costs specified on the part record are used. If a customer order line is partially allocated to a work order, the allocated quantity uses the work order costs and the unallocated quantity uses the part standard costs for the site on the order. |
| Actual Costs | The actual costs incurred for any shipped quantities.  For quantities linked to a work order, the actual costs from the work order are used to calculate this bar. For quantities not linked to a work order, the actual cost layers for shipped quantities are used to calculate this bar. |
| Projected Costs | The projected total costs to produce the order.  Projected costs are calculated by adding the actual costs for any shipped quantities to the estimated costs for any unshipped quantities. For quantities allocated to a work order, the work order is used to calculate the actual and estimated costs. For quantities not allocated to a work order, the actual cost layer for the shipment is used for the actual costs, and any remaining quantity is calculated using the part standard for the site specified on the order. |

Click any bar to view this information:

Ln# The line number of the order.

Line Status The status of the order
line.

Supply ID If any portion of the customer
order line is allocated to a work order, then the ID of the work order
is displayed. Click the ID to open the work order. If any portion
of the customer order line is not allocated to a work order, then
Other is displayed.

Supply Qty If any portion of the customer
order line is allocated to a work order, then the allocated quantity
is displayed. If no quantities have been received on the work order
by the want date, then this value is displayed in red. If any portion
of the customer order line is not allocated to a work order, then
the quantity of the customer order line that derives costs from the
part standard is displayed.

Shipped Qty The quantity of the line
that has shipped is displayed.

Want Date For quantities linked to a
work order, the want date of the work order is displayed. If the quantity
is not linked to a work order, then no information is displayed.

Supply Status For quantities linked
to a work order, the status of the work order is displayed. If the
quantity is not linked to a work order, then no information is displayed.

Estimated For quantities linked to a
work order, the total of the estimated costs from the work order is
displayed. The costs are calculated by adding the costs specified
on the Costs tab of all Material cards and Operation cards for the
quantity linked to the customer order. For quantities not linked to
a work order, the total costs from the part standard for the site
on the order are multiplied by the quantity in the Qty column.

Actual For quantities linked to a work
order, the actual costs from finished goods receipts for the work
order is displayed. For quantities not linked to a work order, the
total of actual cost layers for shipped quantities is displayed.

Projected For quantities linked to a
work order, the estimated costs for any quantities that have not shipped
are added to the actual costs for quantities that have shipped. For
quantities not linked to a work order, any unshipped quantities are
multiplied by the part standard costs for the site and added to the
actual costs for quantities that have shipped.

Sell Price The extended price of the
customer order line is displayed. The extended price is calculated
by multiplying the unit price by the number of units ordered and then
applying any pertinent discounts.

Est. Gross Profit This value is calculated
by subtracting the estimated costs from the sell price.

Proj. Gross Profit This value is calculated
by subtracting the projected costs from the sell price.

Gross Profit Diff. The estimated gross
profit is subtracted from the projected gross profit. If the value
is negative, then the number is displayed in red.

Currency ID The functional currency
of the sites parent accounting entity is displayed.

U/M The unit of measure specified for
the part on the customer order line.

Sched Start Date For quantities linked
to a work order, the scheduled start date of the work order is displayed.

Sched Finish Date For quantities linked
to a work order, the scheduled finish date of the work order is displayed.

## Order Line View Panel Chart and the Standard Costing Method

If you use the Standard costing method, then these conditions apply
to the calculations made for order quantities not allocated to work
orders:

* Estimated costs are based
  on the current part standard. If the standard costs are changed
  for a part, then the graph is updated accordingly. Original Estimated
  costs are not saved.
* Actual costs are based on
  the standard cost at the time of shipment. This calculation is
  made for both the Actual bar in the graph, and the actual cost
  portion of the Projected bar. Actual costs are not recalculated
  if the part standard is changed.
* Projected costs are based
  on the current part standard for unshipped quantities plus the
  part standard at the time of shipment for shipped quantities.

For order quantities allocated to work orders, these conditions
apply:

* Estimated costs are based
  on the part standards in place at the time the work order is generated.
  If the part standards are changed, the estimated costs are not
  updated unless you update the costs on the work order.
* Projected costs initially
  match estimated costs. When cost variances occur in the work order,
  the projected costs will be updated to include the variance and
  will no longer match the part standard. The variance is considered
  when calculating the projected gross profit. When the work order
  costs are posted to the ledger, the variance is posted to the
  variance accounts and not to the cost of goods sold accounts.