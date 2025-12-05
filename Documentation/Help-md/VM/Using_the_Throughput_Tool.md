Using the Throughput Tool




# Using the Throughput Tool

Use the Throughput Tool to help analyze the profitability of your
business.

The throughput value of something you make, if you have no order
from a customer for it, is zero. In fact, it may be a liability; you
have spent money to produce it and may not sell it.

The throughput value of something you have sold is defined as its
price less the cost of materials and outside services that went into
it. Profit is throughput less operating expense.

To view throughput:

1. Select Tools,
   Throughput.
2. Specify the information
   to display in the table. Specify this information:

Start Date and End Date 
To view throughput information for a specific date range, specify
the first date of the range in the Start Date field and the end date
of the range in the End Date field. To view information for all dates,
leave this field blank.

Part ID 
To view throughput information for a particular part, click the browse
button and select the ID. To add more parts, repeat this step. As
you select parts, they are added to the drop-down menu. To save this
list, use the Part View field. Specify a name for this particular
set of parts in the Part View field. When you access the Throughput
Tool again, specify the Part View to use in the Part View field.

Customer ID 
To view throughput information for a particular customer, click the
browse button and select the ID. To add more customers, repeat this
step. As you select customers, they are added to the drop-down menu.
To save this list, use the Customer View field. Specify a name for
this particular set of customers in the Customer View field. When
you access the Throughput Tool again, specify the Customer View to
use in the Customer View field.

Table View 
Use this field to store the table configuration. After you arrange
the columns in the table, specify a name for the arrangement in the
Table View field. When you access the Throughput Tool again, specify
the Table View to display the table arrangement.

Group By Specify
how to group the throughput information in the table.

Show Specify
the type of throughput information to view. Select these check boxes:

Actual Throughput 
Actual throughput uses shipment data and actual costs to determine
throughput. The unit price, discount percent, and commission percent
are obtained from the shipper line. If this information is not available
on the shipper line, then it is obtained from the customer order line.

Estimated Throughput 
Estimated throughput uses customer order line data and estimated costs
from the linked supply order.

Remaining Throughput 
Remaining throughput uses actual throughput data and expected throughput
data to determine the remaining throughput. Actual throughput is used
for any shipped quantity and estimated data is used and prorated according
to the remaining quantity to ship.

Projected Throughput 
Projected throughput uses actual throughput data and remaining throughput
data to determine the projected throughput.Generally, the projected
throughput is the sum of actual and remaining throughput.

3. In the Throughput based
   on section, select which documents to use to generate throughput
   information. Click one of these options:

C/O Desired Ship Date 
Click this option to use customer orders. When you select this option,
customer orders with ship dates within the date range you specify
are inserted into the appropriate time buckets. Customer orders with
a status of on-hold or canceled are not considered. Since information
on the customer order is considered to be an estimate, selecting this
option makes the most sense if you are viewing estimated throughput.

Shipment Date 
Click this option to use shipments. When you select this option, shipments
with dates within the date range you specify are inserted into the
appropriate time buckets. Since the costs on the shipment are actual
costs, selecting this option makes the most sense if you are viewing
actual throughput.

Invoice Date 
Click this option to use receivable invoices. When you select this
option, receivable invoices with dates within the date range you specify
are inserted into the appropriate time buckets. Since the costs on
the receivable invoice are actual costs, selecting this option makes
the most sense if you are viewing actual throughput.

Work Order Want Date 
Click this option to use work orders. When you select this option,
work orders with desired want dates within the date range you specify
are inserted into the appropriate time buckets. Unreleased and canceled
orders are not considered. Work orders can be used to determine actual,
estimated, and remaining throughput.

4. Click Go.
5. This information is
   displayed in the table:

Throughput per Unit/CCR
Minutes Per Unit  For each unit, the amount of throughput
generated for every minute on the CCR is inserted. The higher the
value, the more the product contributes to your profit.

Throughput per Unit 
The amount of throughput for each unit is inserted. If you do not
have a CCR, use this field to assess a parts profitability. The higher
the value, the more the product contributes to your profit.

CCR Minutes per Unit
(MPU)  For each unit, the amount of CCR time the unit
consumes is inserted.

Total CCR Minutes 
The total amount of time the CCR is used is inserted. This amount
of time is calculated by adding the set up hour and run hours spent
on the CCR and multiplying the value by 60.

Throughput/CCR Minutes 
The amount of throughput generated for each minute spent on the CCR
is inserted. You can use this value to rank the performance of the
part. The higher the throughput value, the more profitable the part
is.

Throughput per Unit/Production
Hours per Unit  If you do not use a CCR, use this value
to assess the profitability of a product. For each unit, the amount
of throughput generated for every hour the unit is in production is
inserted. If you use a CCR, the Throughput/CCR Minutes value is a
better measure of a products profitability.

Production Hours per
Unit (HPU) The number or product hours required to make one
unit of the part is inserted.

Total Production Hours 
The total production time for the work order is inserted. For estimated
values, this is the sum of the estimated set up hours and run hours
for all operations. For actual values, the actual set up time and
run time are used.

Throughput/Production
Hours The total throughput for each hour of production is
inserted. If you use a CCR, the Throughput/CCR Minutes value is a
better measure of a products profitability.

Throughput (TP)
The total throughput. Throughput is calculated using this formula:
Sales amount - material cost - service cost.

Material Cost
The total material cost from the work order is inserted.

Service Cost
The total service cost from the work order is inserted.

Gross Amount 
The gross amount of the customer order is inserted. Gross amount is
calculated using this formula: Unit Price \* User Quantity.

Discount Amount
The discount amount offered to the customer is inserted. Discount
amount is calculated using this formula: gross amount \* (trade discount
pct / 100).

Commission Amount
The total commission paid to the sales representative is inserted.
The commission amount is calculated using this formula: (gross amount
- discount amount) \* (commission pct / 100).

Sales Amount 
The total sales amount is inserted. The sales amount is calculated
using this formula: (gross amount - discount amount - commission amount)
\* sell rate.

Quantity The
quantity ordered in stock unit of measure is inserted.

User Quantity
The quantity ordered in the selling unit of measure is inserted.

# Docs The number
of documents included in the time bucket is inserted.

## Viewing the Throughput Detail Table

To view the documents included in a particular time bucket, double-click
the row. Throughput information for each document in the bucket is
displayed. To view the information as a pie chart, select View,
Pie Chart. To view the information as a
bar chart, select View, Bar
Chart. To view throughput information for the supply order
linked to the document, double-click the line.

## Generating the Throughput Report

You can generate a report based on the contents of the Throughput
Tool. After you populate the throughput table, you can generate the
report.

To generate the throughput report:

1. From the Throughput
   Tool, click Print.
2. In the Print section,
   specify the information to include in the report. You can include
   actual, estimated, remaining, and projected throughput.
3. In the Options section,
   specify how to group the information. Select one of these options:

Summary 
Select this option to print a summary report. The summary report includes
the total throughput for each bucket in the throughput table.

Breakdown by Part ID 
Select this option to view the report by part ID. The Breakdown by
Part ID includes the total throughput for each part for the date range
you specified in the Throughput Tool.

Breakdown by Customer
ID  Select this option to view the report by customer
ID. The Breakdown by Customer ID includes the total throughput for
each customer for the date range you specified in the Throughput Tool.

Details 
Select this option to view a detailed report. The detailed report
lists each document contributing to throughput for each bucket in
the throughput table.

Breakdown by Part ID
with Details  Select this option to view each document
that contributes to throughput for each part during the date range
specified in the Throughput Tool.

Breakdown by Customer
ID with Details  Select this option to view each document
that contributes to throughput for each customer during the date range
specified in the Throughput Tool.

4. Specify the output format
   for this report. Select one of these options:

Print Select
this option to print the report.

View Select
this option to view the report on your screen.

File Select
this option to export the report to a comma-separated file.

E-mail 
Select this option to e-mail the report. To e-mail the report as a
PDF, select the PDF Format check box. To
e-mail the report as a comma-separated file, clear this check box.

5. To generate the report,
   click Ok.