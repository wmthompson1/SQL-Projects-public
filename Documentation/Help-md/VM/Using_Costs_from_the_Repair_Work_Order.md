Using Costs from the Repair Work Order




# Using Costs from the Repair Work Order

To use the costs incurred on the repair work order as the basis
for the cost of repair, use the Price Repair Orders dialog box. This
dialog box is available only if you did not use the quote pricing
you set up during the evaluation process. If the Use Quote Pricing
check box is selected, you cannot access the Price Repair Orders dialog
box.

Before you can use the Price Repair Orders dialog box for an RMA,
you must first ship the repaired parts to the customer.

To use the Price Repair Orders dialog box:

1. First, ship the repaired
   parts to the customer. See [Shipping
   the Repaired Materials](Shipping_the_Repaired_Materials.htm).
2. If you are licensed
   to use multiple sites, click the Site ID
   arrow and select the site in which you want to price the repair
   order. If you are licensed to use a single site, this field is
   unavailable.
3. Select Edit,
   Price Repair Orders.
4. Click the RMA ID browse
   button and select the RMA that contains the part to price.

Only the RMAs you have classified as repair
RMAs are displayed. The repairs must be shipped

After you select an RMA, the RMA ID, Customer
ID, and Repair Order ID are inserted in the header.

If you created a new customer order for
the repair, the new order ID is displayed in the Repair Order ID field.
If you added the repair cost to the original customer order, the original
customer order ID is displayed in the Repair Order ID field. To view
the customer order in the Customer Order Entry window, click the Repair
Order browse button.

If you selected the Under Warranty check
box in the RMA Entry window for this repair, then the Under Warranty
check box is selected. In the Price Repair Orders dialog, the Under
Warranty check box is read-only.

After you specify the RMA ID, information
about the customer order and the work order for the repair is inserted
in the table. You can use this information to help formulate the cost
of the repair.

5. Specify the cost per
   unit for the repair. To manually specify the unit cost for the
   repair, specify the price in the New Unit Price field in the table.
   To use the actual work order costs as the basis of the repair
   costs, specify this information:

Hourly Rate
To override the labor costs from the work order, specify the hourly
rate to use in this field. The value you specify in this field is
multiplied by the value in the Labor Hours field in the table to calculate
the total labor cost. If you specify a value in this field, then any
value you specify in the Labor Markup field is not used to calculate
the pricing. To use the labor costs from the work order in the repair
costs, leave this field blank.

Labor Markup
If you left the Hourly Rate field blank, use this field to specify
the markup percentage to apply to the labor costs from the work order.
If you specified an hourly rate in the Hourly Rate field, then any
value you specify in this field is not applied to the repair costs.

Material Markup
Specify the markup percentage to apply to the material costs from
the work order.

Burden Markup
Specify the markup percentage to apply to the burden costs from
the work order.

Service Markup
Specify the markup percentage to apply to the service costs from
the work order.

6. If you specified an
   hourly rate or markup percentages, click Set
   Price. The unit price is calculated based on the information
   you specified. If you manually specified the new unit price, skip
   this step.
7. Click the Approve
   Shipments button.
8. Click the Ok
   button.
9. Click the Save
   button.

After you click Approve Shipments, the unit cost you specified in
the Price Repair Orders dialog is inserted on the customer order repair
line. If a discount percentage is specified on the customer order
line, then this discount percentage is applied to the unit cost you
specified for the repair.

You can generate the invoice using the Invoice Forms window..

## Repair Price Examples

Use these examples to understand how the unit price is calculated
in the Price Repair Orders dialog.

Presume the repair work order had these costs:

Shipped Qty 6

Labor Hours 3

Labor Costs 90

Material Costs 60

Burden Costs 12

Service Costs 18

If you specified a 10% markup in each of the Labor Markup, Material
Markup, Burden Markup, and Service Markup fields, then the unit price
is calculated as follows:

[(90\*1.1) + (60\*1.1) + (12\*1.1) + (18\*1.1)] / 6 = a unit cost of
$33.

If you specified an hourly rate of 50 in the Hourly Rate field,
and a 10% markup in each of the Material Markup, Burden Markup, and
Service Markup fields, then this calculation is made:

[(50\*3 labor hours) + (60\*1.1) + (12\*1.1) + (18\*1.1)] / 6 = a unit
cost of $41.50.