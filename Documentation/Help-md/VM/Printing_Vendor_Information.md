Printing Vendor Information




# Printing Vendor Information

There are
a number of options available for outputting vendor information.

1. Select
   Print from
   the File menu.

The print dialog box appears.

2. If
   necessary, alter the printer setup from the print dialog box by
   clicking on the Print Setup button.
3. Enter
   the Vendor ID for the first vendor you want to print in the Starting
   Vendor ID field.

Enter the last vendor you want to print
in the Ending Vendor ID field.

Leave both blank to print all vendors.

4. Choose
   the output destination by clicking on the arrow and selecting
   one of the following:

Print - To output
the file to a printer, select this option. The file is sent to the
selected default printer in Printer Setup.

View - To preview
what the printed output will look like before you print it, select
View. When the information appears on the window, you can scroll through
it and print it if you need a hard copy.

File - To save
the vendor information to a text file, select File from the pull down
menu. Select OK to bring up a dialog box
for the entry of a file location and name. Enter the desired location
for the file and whether or not the field names are to be included
in the text file. The file can now be edited outside of Infor VISUAL
using any text editor.

E-Mail - Select
this option to send the report in a Rich Text Format (.RTF) through
electronic mail. When you generate the report the system attaches
the file to a Microsoft Outlook e-mail. For more information on addressing
and sending the e-mail, refer to your Microsoft Outlook user documentation.
If you are sending a PDF, VISUAL starts the distiller, converts the
document to PDF, and attaches it to the e-mail.

5. Select
   from the following print options:

Print Barcodes
To include barcodes in the report, select the Print Barcodes check
box  and select
a barcode type.

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

Print Associated Documents
To print all of the documents you have associated with this customer,
select the Print Associated Documents option.

Send To Document Contacts
If you want to send this report to all of the contacts in this customers
E-mail Documents list, select the Send To Document
Contacts option.

PDF Format If
you want to attach a PDF (Portable Document Format) file to your e-mail
instead of a RTF file, select the PDF Format
check box in the Type section.

6. Click
   Ok.

## Printing Labels

Printing labels is done basically the same way as printing vendor
information.

1. Select Print
   Label Setup from the File menu.

The Printer Setup dialog box appears.

2. Select the appropriate
   printer for printing your labels.
3. Select Print
   Labels from the File menu.

The Print Labels dialog box appears.

4. Enter the number of
   labels you want to print for each vendor.
5. Enter the Vendor ID
   for the first vendor you want to print in the Starting Vendor
   ID field.

Enter the last vendor you want to print
in the Ending Vendor ID field.

Leave both blank to print all vendors.

6. If you want to print
   barcodes, click the Print Barcodes check box.
7. Select the print format
   for the labels in the Format section of the dialog box.
8. Click Ok
   to print the labels.

## Printing Formats

You can modify the format of the Vendor report and labels using
Centura Report Builder. The following QRP report files apply:

|  |  |  |
| --- | --- | --- |
| Print Vendors | | VMVNDRP1.QRP |
| Labels |  |  |
|  | Standard | VMVLBFRM.QRP |
|  | User-Defined 1 | VMVLBUD1.QRP |
|  | User-Defined 2 | VMVLBUD2.QRP |
|  | User-Defined 3 | VMVLBUD3.QRP |

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Vendor_Maintenance.md) User-defined Help