Printing Packlists




# Printing Packlists

There are
a number of options available for outputting shipping information.
There are three outputs available from Shipping Entry: Print Packlist,
Print Packlist Report, and Print Labels.

Packlists
show most of the important information for a customer order/shipment,
including Customer Name and Address, Order/Invoice/Shipping Method
and Terms, Order and Line Specs, Line Item Parts, Descriptions, Quantities,
Freight, and Taxes. User-defined fields for the customer, set up in
Customer Maintenance, are also passed to this report.

You can use a Packlist as:

* A document
  that accompanies the product you are shipping to the customer.
  It contains shipping information about the customer order.
* A "picklist"
  for preparing shipments.
* A list
  that shows what is left to be shipped.

To output a packlist:

1. Select
   Sales, Shipping Entry.
2. If
   you are licensed to use multiple sites, click the Site
   ID arrow and select the site for which you are printing
   packlists. If you are licensed to use a single site, this field
   is unavailable.
3. Select
   File, Print Pack
   Lists from
   the File menu.
   If you have used the Print Packlist dialog before, select
   the Use Last Settings check box to load
   the options and check boxes that you used the last time that you
   generated packlists from the dialog. Only option buttons and check
   box selections are reloaded; information that you specified in
   fields, such as the Dated From field, are not reloaded.
4. In the Print section, select
   the print mode for the packlist:

Before Shipment
Packlists print with line items and quantities that still need to
be shipped. In this case, the term picklist applies more than packlist
because it gives a detailed account of what is yet to ship.

After Shipment
Packlists print with line items and quantities that have already
shipped. This is the paperwork that accompanies shipments to customers.

5. In
   the Include section, select the information for the report:

Part Locations
Select the Part Locations check box if
you want VISUAL to include all warehouse locations that carry this
part in the report. The next option allows you to print those locations
with an on-hand balance.

Only Locations with Quantity
This option is dependent on the previous option. Select the Print
Part Locations check box to activate this check box. Select the Only Locs. w/QTY check box if you want VISUAL
to include all warehouse locations within which there is a positive
part balance. Locations with a zero on-hand balance do not appear.

Locations Quantity
If you want VISUAL to include all locations that carry the part
as well as the balances in those locations, select the Locations
QTY check box. Use this option in tandem with the Print
Part Locations check box.

Traceable Part Properties
If you want VISUAL to include the Trace information for Traceable
parts, select the Traceable Part Properties
check box.

Barcodes If
you want to include barcodes in this report, select the Print
Barcodes check box and the barcode type.

Code39
 This barcode type,
also known as Code 3 of 9, contains variable length, discrete symbology.
You must have a Code 39 barcode font installed to view the barcode.
If you do not have the Code 39 font installed, then the alphanumeric
ID is displayed instead with a prefix and suffix. This pattern is
used: \*%ID%\*.

QR
Code 
This is a two-dimensional or matrix barcode. QR stands for quick response.

Associated Documents
If you want VISUAL to print a list of the associated documents for
this packlist, select the Associated Documents
check box.

|  |  |
| --- | --- |
| POSTIT.gif | By default, all line items print on each packlist for an order, whether a quantity was shipped for the item or not. A zero appears for the quantity of each item that was not shipped. If you want to suppress printing of such lines, go to Preferences Maintenance. In the Shipping section, add the SuppressZeroLines entry and specify a value of Y. |

6. In the Selection section,
   select the range of packlists to print:

Current Packlist
If a packlist currently appears in the Shipping Entry window, you
can print it by selecting this option; otherwise, this option is not
enabled.

Current Order
If a packlist or customer Order ID is currently specified in the
Shipping Entry window, you can print all packlists for that order
by selecting this option.

All Released Orders due
through Click this option to print packlists for all released
lines with Ship Dates on or before the date that you specify in the
Dated thru field. An order line is released if its status is Released.
An order line is also considered to be released if the line status
is Inherit and the header status of the order is Released.

This option is only available when you select
the Print Before Shipment Print option.

If you want to print previously printed
packlists, clear the Do Not Print Previously Printed
Pack Lists check box. Usually you will not want to print packlists
you have already printed so this check box appears selected by default.

All Orders shipped between
This prints an After Shipment packlist for all customer orders with
Actual Ship Date between the Dated From and Dated Through dates. Dated
From can be left blank to give an open-ended range. Dated Through
must be specified.

This option is only valid when you select
the Print After Shipment dialog box.

Selected Order lines
shipped between If you want to select specific order lines
between a specific date range, select the Selected
Order lines shipped between option button.

If you select this option, enter the From
and Thru dates and select the order lines you want to include from
the table that appears at the bottom of the Print Packlists dialog
box. Use the SHIFT and CTRL keys to select multiple lines.

Lines due through
If appropriate, select the Lines due through
check box to further constrain the printing of packlist lines.

For Before Shipment reports, selecting this
option filters out packlist lines that have a desired ship date later
than the specified date. If a Ship Date is not specified on the order
line, the Desired Ship Date for the customer order is used. This option
is useful when using Print Current Order to focus on lines due before
a certain date.

For After Shipment reports, the Print Lines
Due Through option filters out packlists with Actual Ship Dates later
than the Dated Through date.

Select multiple released
orders If you select this option, a browse dialog with all
released, on hold, and firmed orders and order lines is displayed
when you click Ok to print the packlists. Select the orders to print,
then click Ok.

Select range of released
orders If you select this option, the Starting Order ID and
Ending Order ID fields become available. Use these fields to specify
a range of released orders to print.

7. In the Filters section,
   specify whether to print picklists or packlists for orders in
   a particular territory or orders that are sent from a particular
   warehouse. You can use these check boxes with either the Print
   Before Shipment or Print After Shipment option:

Territory Select
this check box to print picklists or packlists for orders in a particular
territory. After you click the option, click the arrow to specify
the territory. If the territory is specified on the customer order,
then the packlist for the order is included in the report.

Warehouse Select
this check box to print picklists or packlists for orders that are
shipped from a particular warehouses. After you click the option,
click the arrow to specify the warehouse. If the warehouse is specified
on the customer order line, then the packlist for the line is included
in the report.

8. If this is an international
   order, click the Language ID arrow and
   select the language in which you want VISUAL to print the packlist.
9. In the Format section,
   select the print format.

You can choose between the standard format
provided with the application (you can also customize this form),
a laser print format or three other user-defined formats. The User-defined
option buttons are only active if you have defined the forms for those
formats. You may want to create different forms for Before Shipment
and After Shipment lists, and for internal and customer uses.

Select the Print Form
option button to print the report with a preprinted form using a laser
printer. The resulting report is of better quality than the report
you can print using the Standard print format
option. You must have a laser printer to use this format.

10. Click the output arrow
    and select how you want to view the report:

Print If you
want to send the report to your printer, select the Print
option.

View If you
want to view the report using VISUALs report viewer, select the View option.

File If you
want to send the report to text file, select the File
option. VISUAL prepares your report as a RTF file and a dialog box
appears prompting you to enter the location and file name for the
file to be saved.

E-mail If you
want VISUAL to prepare the report and attach it to an e-mail, select
the E-mail option. VISUAL prepares the report
as a RTF file and attaches it to a Microsoft Outlook e-mail. For more
information on addressing and sending the e-mail, refer to your Microsoft
Outlook user documentation. Click the Send button when you are ready
to send the message.

11. If you want to attach
    a PDF (Portable Document Format) file to your e-mail instead of
    a RTF file, select the PDF Format check
    box in the Type section.
12. If you want to send
    this report to all of the contacts in this customers E-mail Documents
    list, select the Send To Document Contacts
    option.
13. Click OK.

After you print the packlist, a message is displayed asking you
if the packlist printed correctly. Click Yes
if the packlist printed correctly. If you are printing packlists before
shipments, a message is displayed that states that the Pack List,
ASN, and Invoice numbers assigned to the shipment will be permanently
saved. Click Yes to save this information. Click No
if you do not want to save the information.

If the packlist did not print correctly, click No when asked if
the packlist printed correctly. If you click No and are printing packlists
before you shipped the order, then the Pack List, ASN, and Invoice
numbers assigned to the shipment are not generated.

You can use a preference setting to bypass these messages.

## Suppressing Packlist Print Messages

After you print a packlist, a message is displayed asking if the
packlist printed correctly. If you print a packlist before the order
is shipped, then you are also prompted to save the Packlist, ASN,
and Invoice numbers generated during the printing process.

If you always answer Yes to these messages, you can use Preferences
Maintenance to suppress them. When these messages are suppressed,
then it is presumed that the packlists did print correctly. The Packlist,
ASN, and Invoice numbers are saved.

To set up the preference:

1. Select Admin,
   Preferences Maintenance.
2. Click the Insert
   toolbar button.
3. Specify this information:

Section Specify
Shipping.

Entry Specify
PrintPackListPrompt.

Value Specify
N to suppress the packlist messages. Specify Y to display the packlist
messages.

4. Click Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Printing_Packlist_Thermal_Labels.md) Printing Packlist Thermal Labels

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Shipping_Entry.md) User-defined Help