Generating Bills Of Lading




# Generating Bills Of Lading

A Bill of Lading is a legal document that defines
ownership of goods being transported via a commercial carrier. This
document is usually handed to the driver when a shipment goes out.
You should generate a Bill of Lading per customer, per shipping destination.
For example, if you have two shipments going to two different locations
for one customer, you should generate two Bills of Lading.

1. Select Print
   Bills of Lading from the File menu.

The Bill of Lading dialog box appears.

2. Enter the Bill of Lading
   ID for the shipment.

If you have enabled Auto Numbering, you
can leave this field blank; VISUAL assigns the next available number.

3. Enter the Advance Shipping
   Notice ID in the ASN field.

You can also check the Assign ASN check
box to have VISUAL assign the next available number.

Multiple Bills of Lading can have the same
ASN ID, which is for use with EDI.

4. Enter the Carrier ID,
   or click the Carrier ID button and select
   a carrier from the Carriers table.

VISUAL completes the Shipping Instructions
and routes fields from the Carrier ID information.

5. Enter the Ship Date
   and Time, if necessary.

The Ship Date defaults to the current date.
The Ship Time defaults to the current time.

6. Enter the expected delivery
   date in the Exp Del Date field. Enter the expected delivery time
   in the Time field.

The expected delivery date is the date on
which the customer should receive the shipment, allowing for shipping
time to the destination.

7. Click the Packlists
   tab.

The Packlists section of the dialog box
appears.

8. If the Bill of Lading
   is associated with a shipper, enter the Packlist ID (or click
   the Packlist ID button and select the
   packlist from the Packlists table), then click the >>
   button.

VISUAL completes the Ship To Address in
the General section of the dialog box and completes line item information
from the packlist.

9. Click the Value/COD
   tab and enter the following information in the Value/COD section:

Declared Value
- The monetary value of the shipment.

COD - Select from
the following COD options:

Not COD - The
shipment does not allow cash on delivery.

COD/Consignee
- The customer (consignee) is responsible for paying the carrier's
COD fee.

COD/Shipper -
Your company (shipper) is responsible for paying the carrier's COD
fee.

COD Amount - The
cash on delivery amount for the shipment.

COD Fee - The
carrier's default COD fee. This is the amount of money the carrier
charges to handle COD shipments.

Freight Terms
- Select the appropriate freight terms for the shipment.

10. Click the Instruction
    tab and enter or modify the information in the following fields:

Ship Instructions
- The carrier's general shipping instructions.

Route - The carrier's
delivery route.

Vehicle Number
- The number of the carrier's vehicle transporting the shipment.

11. Edit any information
    in the line item table, or click the Insert
    button to add additional lines containing the following information:

NMFC ID - Enter
the National Motor Freight Code for the shipment, or double click
the column header and select a code from the National Motor Freight
Classes dialog box.

Weight - Enter
the weight of the shipment.

U/M - The unit
of measure for the shipment.

Package Type -
The package in which the shipment is contained (crate, drum, etc.)

Count - The number
of packages in the shipment.

Full Truck - Click
this box if the truck containing the shipment is full. The rate class
for that NMFC Code changes from Less Than Load Class to Truck Load
Class.

Hazardous - Click
this check box to indicate that the shipment consists of hazardous
materials.

Article - This
is a classification of the NMFC.

Sub - A sub-classification
of the article.

Rate Class - The
rate class for the shipment.

Description -
A description of the shipment.

12. Click the Save
    button to generate the Bill of Lading.

## Printing Bills of Lading

1. After you have completed
   setting up your Bill of Lading, choose the output destination
   by selecting the arrow next to the output field. Select one of
   the following:

Print - Select
this option to output the file to a printer. VISUAL sends the file
to the selected default printer.

View - To see
what the printed output will look like before you print it, select
View. When the information appears on the screen, you can scroll through
and print it.

File - To save
the information to a text file, select File. You can then edit the
file outside of VISUAL.

E-Mail - Select
this option to send the report in a Rich Text Format through electronic
mail. If you want to convert this document to PDF (Portable Document
Format), select the PDF Format check box.
If you want to send this e-mail to all of the contacts associated
with this document, select the Send to Document
Contacts check box.

2. Click the Print
   button to generate the Bill of Lading.

A standard Windows printer dialog box appears,
allowing you to select the number of copies to be print.

If you selected E-Mail, when you generate
the report the system attaches the file to a Microsoft Outlook e-mail.
For more information on addressing and sending the e-mail, refer to
your Microsoft Outlook user documentation. If you are sending a PDF,
VISUAL starts the distiller, converts the document to PDF, and attaches
it to the e-mail.

If you selected the Send
to Document Contacts check box, VISUAL addresses the e-mail
to the associated contacts and sends the e-mail without any further
input from the user.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Shipping_Entry.md) User-defined Help