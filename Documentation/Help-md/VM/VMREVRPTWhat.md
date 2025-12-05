What is the Revenue Report?




# What is the Revenue Report?

The Revenue Report shows future anticipated revenue.

You can generate a Revenue Report that displays the monetary value
of customer orders and scheduled work orders. If you choose to report
on work orders, the calculated revenue includes the work order co-products.
Additionally, work orders do not have to be allocated to customer
orders to be included in the report.

To generate the Revenue Report it is important to understand how
revenue amount and revenue date are used.

The calculation used to determine the revenue amount depends upon
the type of transaction.

* Customer
  orders - The quantity is multiplied by the unit price specified
  on the order. Customer discounts are subtracted.
* Work
  orders - The work order quantity is multiplied by the unit
  price specified for the part in Part Maintenance. For co-products,
  the quantity of the co-product produced is multiplied by the unit
  price for the part in Part Maintenance. Projected costs are used
  if a unit price is unavailable.

The revenue date is determined based on these conditions:

* When a customer order line
  is not linked with a work order and has a delivery schedule, then
  the desired ship date in the delivery schedule is used as the
  revenue date.
* When a customer order line
  is not linked with a work order and does not have a delivery schedule,
  then the desired ship date specified for the line is used as the
  revenue date. If no desired ship date is specified for the line,
  then the desired ship date specified on the customer order header
  is used.
* When customer order lines
  and delivery schedules are linked to work orders, then the finish
  date of the linked work order is taken into consideration. If
  the work order finish date is later than the desired ship date,
  then the finish date is used as the revenue date instead of the
  desired delivery date specified on the delivery schedule, line,
  or customer order header. If a line or delivery schedule is only
  partially allocated to a work order, then the later of the desired
  ship date or finish date is used for the allocated portion. For
  the unallocated portion, the desired ship date is used.
* When work orders are not
  linked to customer orders, then the work orders finish date is
  used as the revenue date.

Note:
Because multiple revenue dates can be assigned to a single customer
order, a customer order may be displayed more than once in the report.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMREVRPTfrmPrintRevenueReport.htm) Printing Revenue Reports

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Examples_of_Printed_Revenue_Reports.htm) Examples of Printed Revenue Reports

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Revenue_Report.htm) User-defined Help