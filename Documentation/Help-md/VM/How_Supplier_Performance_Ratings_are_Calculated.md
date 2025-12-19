How Supplier Performance Ratings are Calculated




# How Supplier Performance Ratings are Calculated

To calculate the ratings, each line on closed orders from the start
date you specify to the current date is evaluated.

To calculate the on-time performance percentage for the supplier,
all order lines are examined. The total number of days late is added
for all closed order lines and then divided by the total number of
order lines. To determine the number of days late, the date specified
in the Recv Date column on the purchase order line is compared to
the date you actually received the order. If no date is specified
on the Recv Date column on the purchase order line, then the Desired
Recv Date specified on the header is used. If the total number of
days late divided by the total number of order lines falls within
the time frame of your best days late performance criterion, then
the top percentage rating is given. If the average days late falls
within the second time frame, then the second performance percentage
rating is given, and so on.

To complete the rating for the order line, the total amount received
for all order lines is compared to the total amount ordered for all
order lines. If the amount received is equal to or above the percentage
you specify in the Qty/Qty Received % field, then the rating percentage
specified for quantity difference is added to the percentage earned
for on-time delivery. If the amount received is less than the percentage
you specify, then a prorated amount of the quantity difference rating
value is applied.

## Rating Calculation Example

This example shows how the supplier rating is calculated.

Presume you set up ratings criteria as shown is this table:

|  |  |  |  |
| --- | --- | --- | --- |
|  | From | To | Rating |
| Days Late 1 | 0 | 5 | 70 |
| Days Late 2 | 5 | 10 | 40 |
| Days Late 3 | 10 | 15 | 20 |
| Days Late 4 | 15 | 20 | 10 |
| Qty/Qty Rec% | 90 |  | 30 |

Your supplier has shipped 3 orders during the time frame you specify.
The orders have these characteristics:

|  |  |  |  |
| --- | --- | --- | --- |
|  | Days Late | Qty Received | Qty Ordered |
| Order 1 | 0 | 20 | 20 |
| Order 2 | 5 | 22 | 25 |
| Order 3 | 12 | 24 | 30 |

To calculate the on-time performance portion of the rating for this
supplier, the total days late for all orders is divided by the number
of orders:

(0+5+12)/3=5.667

Since 5.667 falls in the Days Late 2 threshold, the supplier received
40 points for on-time delivery.

To calculate the quantity received portion of the rating, the total
quantity received for all orders is divided by the total quantity
ordered. The value is then multiplied by 100:

(20+22+24)/(20+25+30)=0.88

0.88\*100=88

Since 88 is less than 90, the supplier receives a prorated portion
of the quantity received rating. The percentage delivered is multiplied
by the total possible rating:

0.88\*30=26.4

To calculate the total rating, the value for on-time performance
is added to the value for percentage delivered. In this example, the
total rating for the supplier is 40+26.4, or 66.4.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Setting_Up_Supplier_Performance_Criteria.md) Setting Up Supplier Performance Criteria

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMSUPPFMfrmSupplierPerformance.md) Viewing the Supplier Performance Graph