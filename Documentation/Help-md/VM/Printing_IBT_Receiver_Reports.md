Printing IBT Receiver Reports




# Printing IBT Receiver Reports

Interbranch
Transfer Receipt Entry allows you to print or view receipt transactions
for a certain date or print the Current Receiver.

1. Select
   Print Receiver from
   the File menu. The Print Receiver dialog box appears.
2. If
   you are licensed to use multiple sites, click the Site ID(s) arrow
   and select the sites to view in the report. The site selection
   applies only if you select the Print IBTs received on option.
   If you select the Print Current IBT Receiver option, then only
   the site associated with the IBT is included in the report.'
3. Select
   the appropriate Options radio button.

If a receiver is currently called up in
the IBT Receipt Entry window, the Print Current
IBT Receiver radio button is selected by default.

If you want to print a group of receivers
for a date, click the Print Orders Received On
radio button and enter a date. This prints all receivers with an Actual
Recv Date or a Return Date with this date.

If no receiver is currently called up, Print Orders Received On is the only option available.

4. Select
   the Print Barcodes check
   box and select a barcode type if you want to print barcodes in
   the report.

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

5. Select
   the appropriate Output method. Select Print, View, File, or E-mail.
6. Click
   Ok.

This report provides essentially all of
the header and line item information that appears in the IBT Receipt
Entry window. If received IBTs are linked to a work order, the linked
work orders also appear. This facilitates routing received materials
to the appropriate place.

If printing all receivers for a date, VISUAL
groups receivers by IBT Order ID. A page break is inserted after each
IBT group, so all the receivers for an IBT print on their own group
of pages.

You can modify the format of the receiver
report using Centura Report Builder. The QRP file name is VMRCVFRM.QRP.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Interbranch_Transfer_Receipt_Entry.md) User-defined Help