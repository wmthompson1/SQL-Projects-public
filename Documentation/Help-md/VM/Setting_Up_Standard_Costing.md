Setting Up Standard Costing




# Setting Up Standard Costing

To set up standard costing:

1. In the Costing Method
   section, select the Standard option.
2. In the WIP Costing section,
   select one of these options:

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

3. In the Labor Cost Basis
   section, select one of these options:

Hours Worked Select
this option to calculate labor costs by multiplying the hours reported
on a labor ticket by the standard cost of the operation.

Quantity Produced
Select this option to calculate labor costs by multiplying the quantity
completed for an operation by the standard cost per unit for the operation.

4. In the Costing Between
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

5. In the Receipt Exchange
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

6. Click Save.