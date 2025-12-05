Printing Receiver Reports




# Printing Receiver Reports

Purchase Receipt Entry allows you to print or view
receipt transactions for a certain date or print the Current Receiver.

If you are licensed to use multiple sites, you must
print this report on a site-by-site basis.

1. Select Purchasing,
   Purchase Receipt Entry
2. If you are licensed
   to use multiple sites, click the Site ID
   arrow and select to use for the report. If you are licensed to
   use a single site, this field is unavailable.
3. To print a specific
   receiver, click the Receiver ID button
   and select the receiver to print. To print multiple receivers,
   leave this field blank.
4. Select File,
   Print Receiver.
5. Specify the receivers
   to print:
6. If a receiver
   is currently called up in the Purchase Receipt Entry window, the
   Print Current P/O Receiver radio button is selected by default.
7. If you want
   to print a group of receivers for a date, click the Print Orders
   Received On radio button and enter a date. This prints all receivers
   with an Actual Recv Date or a Return Date with this date.
8. If no receiver
   is currently called up, Print Orders Received On is the only option
   available.

6. Select the Print Barcodes
   check box and select a barcode type to include barcodes for the
   PO ID, line number, and quantity in the receiver report. Barcodes
   are a standard part of the QRP.

Code39 This
barcode type, also known as Code 3 of 9, contains variable length,
discrete symbology. You must have a Code 39 barcode font installed
to view the barcode. If you do not have the Code 39 font installed,
then the alphanumeric ID is displayed instead with a prefix and suffix.
This pattern is used: \*%ID%\*.

QR Code This
is a two-dimensional or matrix barcode. QR stands for quick response.

7. Select the appropriate
   Output method. Select either Print, View, File, or E-mail.
8. If you selected E-Mail,
   use these check boxes to specify the content of the email:

Send to Document Contacts
To send the purchase receipt to contacts in the vendors E-mail
Documents list, select this check box. The purchase receipt is sent
to the vendor contacts that are allowed to receive PO Receivers.

PDF Format To
attach the purchase receipt as a PDF, select this check box. Clear
the check box to attach the purchase receipt as an RTF file.

Preview To view
the email before you send it, select this check box.

9. To include document
   attachments, select the Associated Documents
   check box. This check box is available only if you selected Print
   or E-mail as the output format.
10. Click Ok.

This report provides essentially all of
the header and line item information that appears on the Purchase
Receipt Entry window. If received purchases were linked to a work
order, the linked work orders also appear. This facilitates routing
received materials to the appropriate place.

If printing all receivers for a date, VISUAL
groups receivers by PO Order ID. A page break is inserted after each
PO group, so all the receivers for a PO print on their own group of
pages.

You can modify the format of the receiver
report using Centura Report Builder. The QRP file name is VMRCVFRM.QRP.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Purchase_Receipt_Entry.htm) User-defined Help