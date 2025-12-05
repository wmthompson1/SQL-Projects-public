Generating the Stocked Material Buffer Status Report




# Generating the Stocked Material Buffer Status Report

Use this report to analyze information about your stocked parts.
The information in this report matches the information displayed in
the Buffer Management table when you select Stocked Parts in the Display
section. Since you can print this report for different buffer status
generation dates, you can use these reports to analyze how your stocked
part buffers have been used over time.

To generate this report:

1. Perform one of these
   steps:

* In the DBR
  Scheduler window, select the schedule to use. Then, select File, Print Stocked Material
  Buffer Status Report.
* In the Buffer
  Management window, select the site to use. Then, select File, Print Stocked Material
  Buffer Status Report.
* In the DBR
  Dashboard, select the site to use. Then, select File,
  Print Stocked Material Buffer Status Report.

2. Specify the information
   to include in the report. Specify this information:

Buffer Status Generated
On  Specify the buffer status date for this report. If
you select a date on which you did not generate buffers, you will
receive a warning message.

Warehouse ID 
This field is displayed only if you plan by warehouse. To include
information for a particular independently planned warehouse, specify
the warehouse in this field. To include information for your universally
planned warehouses, specify Universal. To include information for
all warehouses, specify All Warehouses.

Product Code 
To include information for parts assigned to a particular product
code, specify the product code in this field. To include information
for parts assigned to any product code or no product code, leave this
field blank.

Buyer  To
include parts purchased by a particular buyer, specify the buyer ID
in this field. To include parts assigned to any buyer or no buyer,
leave this field blank.

Planner 
To include parts managed by a particular planner, specify the planner
ID in this field. To include parts assigned to any planner or no planner,
leave this field blank.

Part Type Use
the options under the Planner field to specify the type of part to
include in the report. Click Fabricated to view stocked fabricated
parts only. Click Purchased to view stocked purchased parts only.
Click Fab/Pur to view stocked fabricated parts that are also purchased.
Click All stocked parts to view all stocked parts.

Buffer Status Threshold 
To view only stocked parts whose buffer status is at or above a certain
value, specify the value in this field. Leave this field blank to
view stocked parts with any buffer status.

Include All Parts in
Emergency Zone  To view stocked parts in the emergency
zone regardless of the buffer status threshold, select this check
box. Clear this check box to use the buffer status threshold only.

3. Specify the output format
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

4. To generate the report,
   click Ok.