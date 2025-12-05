Viewing Part Exceptions




# Viewing Part Exceptions

A part exception occurs when the supply of the part does not meet
the demand of the part. These conditions can cause stock-out and over-stock
conditions to arise:

* When parts exist as both
  co-products and standard products
* When you class parts as
  both finished goods (spare parts) and components parts used in
  assemblies
* When you change the date
  or quantity requirements for parts after work orders have work
  in progress already for those parts
* When you change the quantity
  on hand for those parts through transactional adjustments
* When you manually change
  dates and quantities on existing released work orders
* When you manually link customer
  orders to work orders producing quantities greater than the customer
  demand
* When more than one work
  order is required to satisfy a higher level demand due to maximum
  order levels
* When work orders supply
  more than one higher level demand which may be due on different
  days

After the scheduling process is complete, part exceptions are identified
based on the above criteria. You are prompted to view the part exceptions.
Click Yes to view the exceptions. The window is populated with the
parts with stock-out or over-stock situations, and Suggested Release
Near exceptions. The part exceptions generated after the scheduler
is run are stored in the database.

If you choose not to view part exceptions after you run the scheduler,
you can generate exceptions based on the current state of the database.
When generating exceptions from the DBR Part Exceptions window, the
exceptions are not saved to the database.

Exceptions are generated based on the netting of the total supply
versus the total demand during your scheduling and demand horizons.

To view part exceptions:

1. Perform one of these
   steps:

Run the scheduler, and then click Yes when
prompted to view the part exceptions.

Select the schedule to view, and then select
File, Part Exceptions. Click the Search button to view the exceptions
stored in the database as a result of the scheduling process. Click
Generate Exceptions to generate exceptions based on the current state
of the database.

All part exceptions are displayed in the
table.

2. To filter the information
   in the table, use the fields in the Part Exceptions dialog box
   header. You can use these filters:

Part ID Specify
the ID of the part to view in the table. You can use wildcards in
your search.

Planner User ID 
Specify the ID of the planner. When you specify a planner, the parts
the planner is responsible for are displayed. You can use wildcards
in your search.

Buyer User ID 
Specify the ID of the buyer. When you specify a buyer, the parts the
buyer is responsible for are displayed. You can use wildcards in your
search.

Product Code
Specify the product code of the parts to view in the table.

Commodity Code
Specify the commodity code of the parts to view in the table.

Fabricated 
Specify the type of part to view in the table. Specify Fabricated
to view fabricated parts only. Specify Not Fabricated to view parts
that are not fabricated only. Specify Dont Care to view both fabricated
and non-fabricate parts.

Purchased 
Specify how you supply the parts in the table. Specify Purchase to
view the parts you purchase. Specify Not Purchased to view the parts
you do not purchase. Specify Dont Care to view both purchased and
non-purchased parts in the table.

Stocked 
Specify the stock status of the parts in the table. Specify Stocked
to view stocked parts only. Specify Not Stocked to view parts you
do not stock only. Specify Dont Care to view both stocked parts and
parts you do not stock.

Stock Out 
Specify the stock out quantity. Stock out occurs when demand is greater
than quantity. The stock out quantity is the quantity of part you
must acquire to meet demand. You can use these expressions before
the number you specify:

< The quantity
is less than the number you specify.

<= The quantity
is less than or equal to the number you specify.

> The quantity
is greater than the number you specify.

>= The quantity
is greater than or equal to the number you specify.

= The quantity
must equal the number you specify.

Over Stock 
Specify the overstock quantity. An overstock occurs when you have
more supply than the demand requires. You can use the same expressions
in the Over Stock field that you can use in the Stock Out field.

Issue Late 
Specify the number of days late. You can use the same expressions
in this field that you can use in the Stock Out field.

Release Late 
Specify the number of days late. You can use the same expressions
in this field that you can use in the Stock Out field.

Order Projected Late 
Specify the number of days late. You can use the same expressions
in this field that you can use in the Stock Out field.

Suggested Release Near 
To view parts whose suggested release is near only, select this check
box. To view all parts, clear this check box.

Exclude parts with over
stock less than min/multiple quantity  Certain parts
have a minimum order quantity or are required to be acquired in certain
multiples. A minimum order quantity or a multiple quantity can cause
a part to be overstocked. Select this check box to omit parts that
are overstocked due to a minimum order quantity or multiple order
quantity. Clear this check box to view all parts.

Part May Have Any Attributes
(or)/Part Must Have All Attributes (and) Specify how to apply
the filters. To search for parts that have any one of attributes you
specify, click Part May Have Any Attributes (or). To search for parts
that have all of the attributes you specify, click Part Must Have
All Attributes (and).

User Generated Exceptions 
If you accessed this dialog from the File menu and generated excepts,
select this check box to view only the exceptions you generated. Clear
the check box to view both generated exceptions and exceptions stored
in the database. If you accessed this dialog from the prompt after
you ran the scheduler, this check box in unavailable.

3. Click the Search
   button to apply your filters.

## Viewing Additional Material Planning Information for Parts

To view additional material planning information for parts appearing
in the DBR Part Exceptions window, double-click the part. The Material
Planning window is opened and populated with the part you selected.

## Printing Part Exception Reports

You can generate a report for all part exceptions in the table or
for only selected part exceptions in the table. To generate a report:

1. To include only selected
   parts in the report, select the parts in the table.
2. Click the Print
   button.
3. Specify the parts to
   include in the report:

Displayed 
To include all parts in the table, click this option.

Selected To
include only the parts you selected in the table, click this option.

4. Select the report output
   you want to use. You can select Print,
   View, File,
   or E-mail.
5. Click the OK
   button.

Your report is created and it is formatted
for the output you selected.