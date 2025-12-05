Examples of Printed Revenue Reports




# Examples of Printed Revenue Reports

Example 1:
A Revenue Report for a work order that is not linked with a customer
order.

Scenario:
Your work order for 100 12 Galvanized Hinges is finished on 10/12/2015.
Their unit price is $20.00 each.

Result:
The Revenue Report lists the transaction for October 2015 with a revenue
of $2,000.

Example 2:
A Revenue Report for a customer order line that is not linked with
a work order and does not has a delivery schedule.

Scenario:
Your customer order has a line item for 10,000 3/4 stainless steel
bolts with a unit price of $1.00. The bolts are discounted at 10%,
or 0.10 cents per bolt. The customer order line lists a desired ship
date of 06/01/2016. The desired ship date listed on the customer order
line item, or if unavailable the customer order header, is used as
the revenue date.

Result:
The Revenue Report lists the transaction for June 2016 with a revenue
of $9,000.

Example 3:
A Revenue Report for a customer order line that is not linked with
a work order but has a delivery schedule.

Scenario:
Your customer order has a line item for 10,000 3/4 stainless steel
bolts with a unit price of $1.00. The bolts are discounted at 10%,
or 0.10 cents per bolt. Five thousand bolts are scheduled to be delivered
on 05/01/2016. The other 5,000 are scheduled for delivery on 07/01/2016.
The Delivery Schedules desired ship date is used as the revenue date.

Result:
The Revenue Report lists the transaction for the initial 5,000 bolts
May 2016 with a revenue of $4,500 and the transaction for the second
5,000 July 2016 with a revenue of $4,500.

Example 4:
A Revenue Report for a customer order line with a delivery schedule
and a link with a work order.

Scenario:
Your customer order has a line item for 50 seat cushions at $50 each
with a desired ship date of 03/01/2017. Forty seat cushions are scheduled
to be delivered on 01/01/2017. The other 10 are scheduled for delivery
on 03/01/2017. The work order is finished on 04/01/2017. The revenue
date is the later of the work orders finish date or the desired delivery
date designated in the delivery schedule, customer order line item,
or header.

Result:
The Revenue Report lists the transaction for April 2017 with a revenue
of $2,500.

Example 5:
A Revenue Report for a customer order line of which half is allocated
to a linked work order.

Scenario:
Your customer order has a line item for 50 seat cushions at $50 each
with a desired ship date of 09/01/2017. The 25 allocated to the work
order is finished on 11/01/2017. The revenue date for the allocated
portion is the later of the work orders finish date or the customer
orders desired ship date. The revenue date for the unallocated 25
is the desired ship date designated for the delivery schedule, customer
order line item, or header.

Result:
The Revenue Report lists the allocated transaction for November 2017
with a revenue of $1,250 and the unallocated transaction is listed
in September 2017 with a revenue of $1,250.

This table shows a synopsis of how the
revenue date is determined:

| Transaction Type | Linked to a Work Order | Linked to a Customer Order | Delivery Scheduled | Partially Allocated | Revenue Date is based on ... |
| Customer Order | No |  | Yes |  | The delivery schedules Desired Ship Date. Revenue is shown for each delivery schedule line. |
| Customer Order | No |  | No |  | The customer order Lines Desired Ship Date, or if none exists the Customer Order Header Desired Ship Date. Revenue is shown for each customer order line. |
| Customer Order | Yes |  | Yes |  | The later of either the work orders Finish Date or the Desired Ship Date of the delivery schedule, customer order line item, or header. Revenue is shown for each delivery schedule line. |
| Customer Order | Yes |  | Yes | Yes | The allocated items use the later of either the work orders Finish Date or the Desired Ship Date of the delivery schedule, customer order line item or header.  The unallocated items use the Desired Ship Date.  Revenue is shown for each delivery schedule line. The delivery schedule line is shown twice: once for the allocated quantity and once for the unallocated quantity. |
| Customer Order | Yes |  | No | Yes | The allocated items use the later of either the work orders Finish Date or the Desired Ship Date of the customer order line item or customer order header.  The unallocated items use the Desired Ship Date.  Revenue is shown for each allocated quantity and unallocated quantity. |
| Work Order |  | No | No |  | The work orders Finish Date. Work orders with co-products are shown multiple times, once for each product produced in the work order. |

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMREVRPTWhat.htm)
What is the Revenue Report?

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMREVRPTfrmPrintRevenueReport.htm) Printing Revenue Reports

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Revenue_Report.htm) User-defined Help