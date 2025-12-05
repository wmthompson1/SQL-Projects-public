Setting Up Actual Costing




# Setting Up Actual Costing

To set up actual costing:

1. In the Costing Method
   section, click the Actual option.
2. In the WIP Costing section,
   click one of these options:

Actual Actual
WIP values any receipts from Work In Process at the full value of
the Work Order.

For example, you are making 100 parts and
each part requires $1.00 of material. On the first day you issue $100
of material to the Work Order. If you finish 1 part on the first day
it will be valued at $100 the full value of the Work Order. On the
second day, when you receive the other 99 parts, the costing utility
will re-value the receipt from previous day to $1 and share the other
$99 with the other receipts. The value of an Actual WIP costed Work
Order without any receipts is always zero.

Projected Projected
WIP values any receipts at the estimated unit cost based on the quantity
received and the remaining quantity to complete. For example, you
are making 100 parts and each part requires $1.00 of material. On
the first day, you issue $100 of material to the Work Order. If you
finish one part on the first day, the work order would produce a cost
of $1 for 1 part on the first day and then $1 each for the remaining
99 parts the next day. Projected WIP receipt values will never exceed
the actual cost in the job.

3. In the FIFO Method/Inventory
   Grouping section, select how to determine first in-first out costs.
   Click one of these options:

By Part Click
this option to calculate costs based on the order in which you received
the part  regardless of the location.

For example, you receive the same parts,
four times, at four prices, into these locations:

Day 1 Location 1 10@$1

Day 2 Location 2 10@$2

Day 3 Location 1 10@$3

Day 4 Location 2 10@$4

You then issue 15 of those parts from location
1. If you select By Part, costs are calculated as:

10@$1 plus 5@$2 totaling $20

Because you received the part at $1 first
then $2, these prices are used for By Part calculations.

By Part Location
Costs are calculated based on the order in which you received the
part into the location.

For example, you receive the same parts,
four times, at four prices, into these locations:

Day 1 Location 1 10@$1

Day 2 Location 2 10@$2

Day 3 Location 1 10@$3

Day 4 Location 2 10@$4

You then issue 15 of those parts from location
1. If you select By Part Location, costs are calculated as:

10@$1 plus 5@$3 totaling $25

Because FIFO is by part location, only those
parts in location 1 are used.

4. If you are licensed
   to use VISUAL DCMS and part trace, you can use trace IDs in your
   FIFO calculations. Select the Actual Costing
   by Trace ID check box to issue parts based on trace ID.
   For example, presume you received four Part X at $10 on trace
   ID 100, then receive four more at $20 on trace ID 110. If you
   issued three based on trace ID 110, the parts would be valued
   at $20 each.

This check box is only active if you have
VISUAL DCMS.

5. In the Source of Raw
   Material Cost section, specify the transaction to use as the source
   of costs for purchased materials. Click one of these options:

Purchase Orders
Select this option to use the price specified on the purchase order
as the source of raw material cost. The cost is taken from the purchase
order when you receive the part into your inventory. This option is
only preferable if you are not using VISUAL Financials.

A/P Invoices
Select this option to use the price paid on the A/P invoice as the
final cost for the part. When you select this option, costs are first
taken from the purchase order as an estimate, then updated from the
invoice for the purchase. This option provides a more accurate assessment
of costs. If you use VISUAL Financials, you should select this option.

6. In the Costing Between
   Levels section, specify how you want to process costs when one
   fabricated part is a material requirement in another fabricated
   part.

When you fabricate a part, costs are incurred
in all four cost categories: material, labor, burden, and service.
When you use a fabricated part as a material requirement, you can
combine the four cost categories and use the total as the material
cost of the requirement, or you can keep each cost category separate.

Choose one of these options:

Fold to Material Cost
If you select this option, the Material, Labor, Burden, and Service
cost of an internally fabricated part are summed into the material
cost when it is required in another fabricated part. The entire cost
is of the requirement is counted as material cost.

Keep Separate Costs
If you select this option, the Material, Labor, Burden, and Service
costs of an internally manufactured material requirement contribute
to those individual categories in parent assemblies.

7. In the Burden Basis
   section, select the basis you want to use when calculating burden
   rates. Click one of these options:

Determined By Resource
Burden Click this option to calculate burdens based on the
rates you enter for the resource. You cannot override these rates
on the work orders operation card.

Determined By Operational
Burden Click this option to calculate burdens based on the
rates you enter on the work orders operation card. This can be useful
if you want to periodically update your burden costs at the resource
level without affecting current work orders.

8. In the Receipt Exchange
   Rate section, specify the date to use to determine the exchange
   rate applied to purchased goods. Select one of these options:

Use Receiver Date
Select this option to apply the exchange rate as of the date the
purchased goods are received.

Use Invoice Date
Select this option to apply the exchange rate as of the date of
the invoice. The invoice date is either the date specified on the
transaction or the current date, depending on your setting in the
Effective Exchange Rate date section on the General tab.

9. Click Save.