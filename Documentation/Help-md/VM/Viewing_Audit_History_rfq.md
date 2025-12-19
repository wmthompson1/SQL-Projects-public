Viewing Audit History




# Viewing Audit History

If you are auditing information in database tables
related to RFQs, you can view a history of the changes made to audited
table columns for an RFQ record in the Audit History dialog.

A system administrator must grant you permission to view this dialog.

Use Audit Maintenance to set up the audit. See [Audit
Maintenance](VMAUDMNTfrmAuditConfiguration.md).

Information is written to this dialog if you are auditing columns
in these database tables:

* REQUEST\_FOR\_QUOTE
* RFQ\_LINE
* RFQ\_VENDOR
* RFQ\_VENDOR\_QUOTE

To view audit history information:

1. Select Purchasing,
   Vendor RFQ Entry.
2. Open an RFQ record.
3. Select Info,
   Audit History.
4. This information is
   displayed:

ID The primary
key of the database record that was changed.

User ID The
ID of the user who made the change.

Date The date
that the change was made.

Field The database
table and column that was changed.

Old Value The
original value.

New Value The
new value.

Action The action
that occurred to update the date. These actions are used:

Insert A new value
was created.

Update An existing
value was changed.

Delete A value
was deleted.

## Exporting Audit Information

You can export Audit Information to Microsoft Excel or to an XML
file.

### Exporting Audit Information to Microsoft Excel

To export the information to Microsoft Excel:

1. Select Purchasing,
   Vendor RFQ Entry.
2. Open an RFQ record.
3. Select Info,
   Audit History.
4. In the table, select
   the rows to export.
5. Right-click the table
   and select Send to Microsoft Excel.
   Microsoft Excel is opened, and the rows you selected are inserted
   in the spreadsheet.

### Exporting Audit Information to XML

To export audit information to XML:

1. Select Purchasing,
   Vendor RFQ Entry.
2. Open an RFQ record.
3. Select Info,
   Audit History.
4. In the table, select
   the rows to export.
5. Right-click the table
   and select Send to XML.
6. Specify this information:

File Name Specify
the name to use for the XML file.

XML to Write
Specify the content to include in the file. Click one of these options:

Schema Click this
option to export the schema only. The XML structure is exported, but
no information from the table is exported.

Document Click
this option to export the rows that you selected in the Audit History
table in XML format.

Both Click this
option to export both a schema file and a document file.

Tags Specify
the information to use for the XML tags. Click one of these options:

Use column name
Click this option to use the database column names for the tags.

Use item name Click
this option to use the column names as displayed in the Audit History
table for the tags.

7. Click Export.