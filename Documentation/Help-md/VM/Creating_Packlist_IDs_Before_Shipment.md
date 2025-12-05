Creating Packlist IDs Before Shipment




# Creating Packlist IDs Before Shipment

1. Select Sales, Shipping Entry.
2. If you are generating a packlist ID for a particular order, specify the ID of the order in the Order ID field. Otherwise, leave this field blank.
3. Select File, Print Pack Lists.
4. In the Print section, click Before Shipment.
5. If you are generating the packlist ID for the order that you selected in the main Shipping Entry window, click Current Order. Otherwise, use the filters in the Selection section to specify the packlist IDs to create:

All Released Orders due through Click this option to print packlists for all released customer orders that have lines with Ship Dates on or before the date that you specify in the Dated thru field. If a Ship Date is specified on the order line, that date is used to determine if the line falls within the report criteria. If the a Ship Date is not specified on the order line, the Desired Ship Date from the customer order is used to determine if the line falls within the report criteria. Note that the Dated From date does not apply for this option.

Selected Order Lines Shipped Between To select specific order lines between a specific date range, click Selected Order Lines Shipped Between.

If you click this option, specify the From and Thru dates and select the order lines to include from the table that is displayed at the bottom of the Print Packlists dialog. Use the SHIFT and CTRL keys to select multiple lines.

Lines Due Through Select the Lines Due Through check box to further constrain the printing of packlist lines.

For Before Shipment packlists, selecting this option filters out packlist lines that have a desired ship date later than the specified date. If a Ship Date is not specified on the order line, the Desired Ship Date for the customer order is used. This option is useful when using Print Current Order to focus on lines due before a certain date.

Select multiple released orders If you select this option, a browse dialog with all released, on hold, and firmed orders is displayed when you click Ok to print the packlists. Select the orders to print, then click Ok.

Select range of released orders If you select this option, the Starting Order ID and Ending Order ID fields become available. Use these fields to specify a range of released orders to print.

6. In the Filters section, optionally specify these additional filters:

Territory Select this check box to print packlists for orders in a particular territory. After you click the option, click the arrow to specify the territory. If the territory is specified on the customer order, then the packlist for the order is included in the report.

Warehouse Select this check box to print packlists for orders that are shipped from a particular warehouses. After you click the option, click the arrow to specify the warehouse. If the warehouse is specified on the customer order line, then the packlist for the line is included in the report.

7. In the Format section, select the print format.

You can choose between the standard format provided with the application (you can also customize this form), a laser print format or three other user-defined formats. The User-defined option buttons are only active if you have defined the forms for those formats. You may want to create different forms for Before Shipment and After Shipment lists, and for internal and customer uses.

Click Print Form to print the report with a preprinted form using a laser printer. The resulting report is of better quality than the report you can print using the Standard print format option. You must have a laser printer to use this format.

8. In the Include section, select the information for the report:

Part Locations Select the Part Locations check box to include all warehouse locations that carry this part in the report.

Only Locations with Quantity This option depends upon the previous option. Select the Print Part Locations check box to activate this check box. Select the Only Locs. w/QTY check box to include all warehouse locations that contain positive part balance. Locations with a zero on-hand balance do not.

Locations Quantity To include all locations that carry the part and the balances in those locations, select the Locations QTY check box. Use this option in tandem with the Print Part Locations check box.

Traceable Part Properties To include the Trace information for Traceable parts, select the Traceable Part Properties check box.

Barcodes To include barcodes in this report, select the Barcodes check box and select a barcode type.

Code39 This barcode type, also known as Code 3 of 9, contains variable length, discrete symbology. You must have a Code 39 barcode font installed to view the barcode. If you do not have the Code 39 font installed, then the alphanumeric ID is displayed instead with a prefix and suffix. This pattern is used: \*%ID%\*.

QR Code This is a two-dimensional or matrix barcode. QR stands for quick response.

Associated Documents To print a list of the associated documents for this packlist, select the Associated Documents check box.

Note: By default, all line items print on each packlist for an order, whether a quantity was shipped for the item or not. A zero is displayed for the quantity of each item that was not shipped. To suppress printing of such lines, add the setting in Preferences Maintenance. Insert the SuppressZeroLines entry line in the Shipping section, and specify a value of Y.

9. If this is an international order, click the Language ID arrow and select the language in which you want the packlist printed. Click the output arrow and select the output for report:

Print To send the report to your printer, select the Print option.

View To view the report using the report viewer, select the View option.

File To send the report to text file, select the File option. Your report is prepared as a RTF file and a dialog is displayed prompting you to specify the location and file name for the file to be saved.

E-mail To have the report prepared and attached to an e-mail, select the E-mail option. The report is prepared as a RTF file and it is attached to a Microsoft Outlook e-mail. See your Microsoft Outlook user documentation. Click Send when you are ready to send the message.

To attach a PDF (Portable Document Format) file to your e-mail instead of a RTF file, select the PDF Format check box in the Type section.

To send this report to all of the contacts in this customers E-mail Documents list, select the Send To Document Contacts option.

10. Click OK.

If you selected the Print output, a standard print dialog is displayed allowing you to select the print quantity and range.

After you print the packlist, a message is displayed asking you if the packlist printed correctly. Click Yes if the packlist printed correctly. If the packlist was not printed correctly, click No. The Pack List, ASN, and Invoice numbers assigned to the shipment are not generated. If you click Yes in the first message, a second message is displayed that states that the Pack List, ASN, and Invoice numbers assigned to the shipment will be permanently saved. Click Yes to save this information. Click No if you do not want to save the information.