Printing Inactive Inventory Reports




# Printing Inactive Inventory Reports

Use the Inactive Inventory Reports to view inventory
activity for a part or a range of parts for a specified period of
time. You can print the report to include all transaction types and
classes. You can also include parts with a zero on-hand balance. Use
this report to monitor materials in inventory undergoing few quantity
changes that you may want to classify as obsolete. See [Classifying
a Part as Obsolete](Classifying_a_Part_as_Obsolete_.htm).

If you are licensed to use multiple sites, you can print the inactive
inventory report by site or by the tenant level. If you print part
information at the tenant level, all parts are included in the report.
If you print part information by site, only parts assigned to the
site are included in the report.

To print inactive inventory reports:

1. Select Inventory,
   Part Maintenance.
2. If you are licensed
   to use multiple sites, click the Site ID arrow and select the
   site to use in the report. To view all sites in the report, click
   the Site ID arrow and select \*\*Tenant\*\*.

If you are licensed to use a single site,
this field is unavailable.

3. Select File,
   Inactive Inventory Report.
4. To include a range of
   parts in the report, click the Starting and Ending Part ID browse
   buttons and select the range of parts.

To print a report for one part, specify
the same Part ID in both fields. To print a report for all parts,
leave both fields empty.

If you are licensed to use multiple sites
and selected a Site ID in the Part Maintenance window, the browse
table is limited to parts assigned to the site.

3. To include transactions
   after a certain date, click the calendar button to select a transactions
   after date. To include transactions for all dates, leave this
   field blank.
4. In the Transaction Type
   section, select the transaction types to include:

Issues and Issue Returns
- To include issues and issue returns, select this check box. Issues
include customer shipments and issues to work orders. Issue returns
include customer returns and material issue returns.

In the report, CLASS = I (Issue); TYPE=I
or O (In or Out)

Receipts and Return Receipts
- To include receipts and receipt returns, select this check box.
Receipts include purchase order receipts and receipts of finished
goods into inventory. Return receipts include purchase returns and
returns of finished goods.

In the report, CLASS = R (Receipt); TYPE=I
or O (In or Out)

Adjustments In/Out
- To include adjust in and adjust out inventory transaction, select
this check box.

In the report, CLASS = A (Adjustment); TYPE=I
or O (In or Out)

5. To include parts with
   Select the Include Parts with Zero On Hand
   Quantity check box to include parts with a zero on hand
   quantity in the report.
6. Select an output for
   the report:

Print - Select
this option to output the file to a printer.

View - Select
this option to see what the printed output looks like before you print
it.

File - Select
this option to save the information to a text file. You can then edit
the file outside of VISUAL using any text editor.

E-mail - To prepare
the report and attach it to an e-mail, select the E-mail option. You
can attach the report as a PDF or as a CSV file. To attach a PDF,
select the PDF Format check box. To attach a CSV, clear the PDF Format
check box. When you click Ok, a Microsoft Outlook message is opened
and the report is attached.

7. Click the Ok
   button to output the report.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Part_Maintenance.htm) User-defined Help