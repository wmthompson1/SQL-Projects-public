Printing Travellers and Picklists




# Printing Travellers and Picklists

If you are licensed to use multiple sites, you can
include multiple sites in the report.

After you select
print settings, you can save them for future use. See [Working
with Saved Work Order Traveller Print Settings](Working_with_Saved_Work_Order_Traveller_Print_Settings.md).

Use this procedure to print travellers manually. You can also use
a service to schedule traveller print jobs. See [What
is the Reporting Service?](VRPTSVCWhat.md).

To print travellers/picklists:

1. Select Eng/Mfg,
   Work Order Traveller from the main menu.

If you are working in the Manufacturing
Window, you can select File, Print Work Order Traveller Report. The
Work Order Traveller Report is opened, and the current work order
is selected for printing.

2. If
   you are licensed to use multiple sites, click the Site
   ID(s) arrow and select the sites to include in the report.
3. Select the work orders
   for which you are printing travellers either by Base ID or by
   date range:

   1. To select specific work orders
      by Base ID click the Base ID browse button. You can select
      one work order or multiple work orders. You can sort and filter
      the table to help you find the work orders to print.
   2. To sort
      the table select one of these options:

[By
Work Order ID](javascript:TextPopup(this))

Select this option to sort the
table by work order ID.

[By
Customer ID](javascript:TextPopup(this))

Select this option to sort the table by customer ID. Work orders
without customers do not appear in the table.

[By
Planner ID](javascript:TextPopup(this))

Select this option to sort the table by planner ID. Work orders
without planners do not appear in the table.

1. * To filter
     the table by work order status, select one or more of these
     check boxes:

[Unreleased](javascript:TextPopup(this))

Select this option to view unreleased work orders.

[Firmed](javascript:TextPopup(this))

Select this option to view firmed work orders.

[Released](javascript:TextPopup(this))

Select this option to view released work orders.

1. * Click Ok after you have selected
     the work orders you would like to print.
   2. To select a range of work
      orders based on date, leave the Base ID field blank. Specify
      this information:

[Earliest
Date and Latest Date](javascript:TextPopup(this))

Specify the time period to use to identify the work order travellers
to print.

[Date
Parameter](javascript:TextPopup(this))

Specify whether the time period applies to release dates or
scheduled start dates. If you select Release
Date, then travellers for work orders with release dates
in the time period you specify are printed. If you select Sched Start Date, then travellers for work
orders with scheduled start dates in the time period you specify
are printed.

[Status](javascript:TextPopup(this))

Select the status of the work orders to consider. Travellers
for work orders with the status you select are printed.

4. Add information in the
   Operation Write-Ins data field with supplementary data that helps
   to clarify and expedite the work order. Use these fields to include
   additional information on a traveller that may, from the time
   a work order is released until the time it is shipped, make its
   way to nearly every person on the shop floor involved in the production
   process. If a signature or special note may be helpful, enter
   it in these fields. Click Save as defaults
   to save write-ins as a default. To print the write-in fields you
   must select the Print operation write-in fields
   check box before printing.
5. Select the format to
   use:

[Traveller
format](javascript:TextPopup(this))

If you want to sort the traveller by the operation number, you
can select the Op sequence check box.

[Picklist
format](javascript:TextPopup(this))

If you select Picklist format, select a sort sequence by either
Piece number or Location
ID.

[Co-product
format](javascript:TextPopup(this))

Select this option to print co-product information. You must
select this check box in conjunction with the traveller format
and/or picklist format option.

6. Select the information
   to include on the traveller or picklist. The check boxes available
   for selection depend upon the document format you selected.

To print a traveller, select this information:

[Print
(include) closed ops](javascript:TextPopup(this))

To display closed operation information, select this check box.
Operations can be manually closed, or the can be closed when Run Complete is selected on the labor ticket.

[Print
customer order info](javascript:TextPopup(this))

If a customer order is linked to the work order, select this
check box to include customer order information. This information
is included: customer order ID, date, ship via code, customer
purchase order number, phone number, ID of the ordered part, customer
ID, customer sold to address, and the customer ship to address.

[Print
operation write-in fields](javascript:TextPopup(this))

To print the information specified in the write-in fields, select
this check box.

[Print
part locations](javascript:TextPopup(this))

To include a list of warehouse locations where the materials
on the work order are stored, select this check box. When you
select this check box, the Print Only Locations
w/ Quantity and Use Work Order Warehouses
check boxes become available. Select the Print only locations
w/quantity check box to include only those locations with on-hand
inventory for the part. Select the Use work order warehouses check
box to print only those part locations associated with the warehouses
specified on the work order.

[Print
traceability info](javascript:TextPopup(this))

To print part trace information, select this check box.

[Print
reference designators](javascript:TextPopup(this))

To print reference designators associated with materials, select
this check box. Only the reference designator ID is printed on
the traveller; the X-Y coordinates and descriptions are not printed.

[Print
alternate parts](javascript:TextPopup(this))

To print a list of alternate parts available for each material,
select this check box.

[Print
W/O header barcodes](javascript:TextPopup(this))

To include a barcode for the work order header, select this
check box.

[Print
traveller ops barcodes](javascript:TextPopup(this))

To include a barcode for each operation, select this check box.

[Print
Code39 barcodes/Print QR codes](javascript:TextPopup(this))

Select one of these barcode formats to print barcodes in your
output:

Code39
 This barcode,
also known as Code 3 of 9, contains variable length, discrete
symbology. You must have a Code 39 barcode font installed to view
the barcode. If you do not have the Code 39 font installed, then
the alphanumeric ID is displayed instead with a prefix and suffix.
This pattern is used: \*%ID%\*.

QR
Code 
This is a two-dimensional or matrix barcode. QR stands for quick
response.

To print a picklist, select this information:

[Print
(include) closed ops](javascript:TextPopup(this))

To include closed operation information, select this check box.
Operations can be manually closed, or they can be closed when
Run Complete is selected on the labor ticket.

[Print
part locations](javascript:TextPopup(this))

To include a list of warehouse locations where the materials
on the work order are stored, select this check box. When you
select this check box, the Print Only Locations
w/ Quantity and Use Work Order Warehouses
check boxes become available. Select the Print only locations
w/quantity check box to include only those locations with on-hand
inventory for the part. Select the Use work order warehouses check
box to print only those part locations associated with the warehouses
specified on the work order.

[Print
traceability info](javascript:TextPopup(this))

To print part trace information, select this check box.

[Print
alternate parts](javascript:TextPopup(this))

To print a list of alternate parts available for each material,
select this check box.

[Print
picklist ops info](javascript:TextPopup(this))

This check box is available only if you sequence the picklist
by Location ID. To include information about the operation resource,
select this check box. Below each material line, the resource
ID, resource type, start quantity, end quantity, run hours, start
date, finish date, drawing ID and revision associated with the
material is displayed.

[Print
picklist material barcodes](javascript:TextPopup(this))

To print barcodes for the materials included in the work order,
select this check box.

[Print
picklist ops barcodes](javascript:TextPopup(this))

To print barcodes for the operations in the work order, select
this check box.

[Print
Code39 barcodes/Print QR codes](javascript:TextPopup(this))

If you are printing barcodes, select the format for the barcode.
If you select Print Code39 codes, you must have a barcode font
package installed to properly display the barcodes.

Select one of these barcode formats to print barcodes in your
output:

Code39
 This barcode,
also known as Code 3 of 9, contains variable length, discrete
symbology. You must have a Code 39 barcode font installed to view
the barcode. If you do not have the Code 39 font installed, then
the alphanumeric ID is displayed instead with a prefix and suffix.
This pattern is used: \*%ID%\*.

QR
Code 
This is a two-dimensional or matrix barcode. QR stands for quick
response.

7. Click
   the arrow and select the type of output for the report. You can
   select:

[Print](javascript:TextPopup(this))

To send the report to your printer, select the Print
option.

[View](javascript:TextPopup(this))

To view the report using report viewer, select the View
option.

[File](javascript:TextPopup(this))

To send the report to text file, select the File option. Your
report is prepared as a RTF file and a dialog box appears prompting
you to enter the location and file name for the file to be saved.

[E-mail](javascript:TextPopup(this))

To prepare the report and attach it to an e-mail, select the
E-mail option. The report is prepared as a RTF file and it is
attached to a Microsoft Outlook e-mail. See your Microsoft Outlook
user documentation. Click Send when
you are ready to send the message.

To e-mail a PDF instead of an RTF file,
select the PDF Format check box.

8. If you selected Print
   for the report output, you can include documents associated with
   the work order. Select from these check boxes:

[Print
associated documents](javascript:TextPopup(this))

To print all of the documents attached to the work order, select
this option.

[Sequence
attachments](javascript:TextPopup(this))

If you are printing more than one traveller and you would like
to collate the output by work order, and you select this option,
the system outputs the traveller, then the picklist, then the
co-product, then the associated documents. This option is available
only if you have selected the Print Associated Documents check
box.

9. If you are outputting
   a range of work orders by date, specify whether to reprint travellers
   that have already been printed. Select from these check boxes:

[Print
Previously Printed Work Orders](javascript:TextPopup(this))

To print work order travellers that have already been printed,
select this check box.

[Print
Unprinted Work Orders](javascript:TextPopup(this))

To print work order travellers that have not yet been printed,
select this check box.

10. These options are available
    only if you select Traveller Print as the output format:

[Auto
Release all details of each Work Order](javascript:TextPopup(this))

Select this option button to release all operations and material
requirements attached to a work order or leg header card. If the
work order has legs and you select a specific sub ID, then only
the resources and materials attached to the sub ID are released.

[Change
Status of Subordinate Materials and Operations](javascript:TextPopup(this))

If you select the Auto release
all details of each work order check box, all subordinate
legs are released. For example, if you are printing a traveller
for a work order header card, selecting this check box also releases
any leg header cards in the work order along with the materials
and resources attached to the legs. Clear this check box if you
do not want to release subordinate legs when you release a work
order header.

[Exclude
closed/cancelled subordinate legs](javascript:TextPopup(this))

If you select the Auto release all details of each work order
check box and the change status of subordinate materials and operation
check box, select the Exclude closed/cancelled subordinate legs
check box to retain the current status of any closed or cancelled
legs. If you clear this check box, then the closed or cancelled
legs are re-released.

11. Select File,
    Print/View, or click the Print
    toolbar button to output the report.

If printing both travellers and picklists,
they are output in two separate jobs.

You are asked if the travellers/picklists
printed correctly. Answering yes commits the release of  firmed
work orders ready for release. Answering no prompts the print setup
dialog to display again, allowing you to reprint the traveller/picklist.

## Printing Traveller Reports from the Manufacturing Window

If you are working in the Manufacturing Window and
want to print the Traveller Report for the open work order, from the
main menu select File, Work Order
Traveller Reports.

## Formatting Barcodes in the Traveller Reports

By default, the barcodes on traveller reports are
printed in bold-faced font. If you are having issues scanning the
barcode, you can edit the report to print the barcodes in plain font.
Use a report designer to edit the report.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Work_Order_Traveller.md) User-defined Help