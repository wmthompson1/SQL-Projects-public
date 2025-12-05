Drill To Columns




# Drill To Columns

When you create a data source, you can specify which columns in
the metric grids are drill-to columns. When a grid column is a drill-to
column, users can click the information in the column to view more
information in a related VISUAL executable.
To create drill-to columns and to specify the VISUAL executable
that is opened when a user clicks a dill to link, use the Class Name
field.

Depending on the value that you specify in the Class Name field,
the column becomes a drill-to column in the grid. If you specify Date
in the Class Name field, the column does not become a drill-to column.
In all other cases, the class name that you select determines the
window that is opened when a user clicks a drill-to link. For example,
if you select Activity ID in the Class Name field, then clicking the
drill-to link opens Activity Maintenance.

To function properly, the primary key for the window that is opened
with the drill-to link must be provided. If the column where you add
the drill-to link contains the primary key, then you do not need to
complete any additional configuration steps. For example, if Seq No
6 in your data source is set up to show customer\_order.customer\_ID,
and you specify Customer ID in the Class Name field, then the drill-to
to Customer Maintenance is complete.

If the column where you add the drill-to link does not contain the
primary key for the drill-to window, then you must use the Drill To
Configuration dialog to complete the drill-to link. The Drill To Configuration
dialog lists the parameters that are used to open the associated window.
For each parameter, specify either a column from your data source
or a literal value. If you use a literal value, then the value you
specify is always used for the parameter. For example, if you are
creating a drill-to link for work order IDs, you can specify the literal
value W for work order type instead of including a work order type
column in your data source.

This table shows the class names, the window associated with each
class name, and the expected parameters for each class:

| Class name | Window | Expected Parameters | Notes |
| --- | --- | --- | --- |
| Activity ID | Activity Maintenance | Activity ID |  |
| Control No | Accounts Payable Payment Entry | Bank Account ID  Control No | You must use the Drill To Configuration dialog to set up this drill-to link. |
| Customer ID | Customer Maintenance | Customer ID |  |
| Customer Name | Customer Maintenance | Customer ID | You must use the Drill To Configuration dialog to set up this drill-to link. |
| Customer Order ID | Customer Order Entry  Order Management Window | Customer Order ID |  |
| Date | n/a | n/a | Use the Date class name to create a standard date column. |
| IBT ID | IBT Entry | IBT ID |  |
| Inventory Transaction ID | Inventory Transaction Entry | Inventory Transaction ID |  |
| Invoice ID | Accounts Receivable Invoice Entry | Invoice ID (Accounts Receivable) |  |
| Labor Transaction ID | Labor Ticket Entry | Labor Transaction ID |  |
| Packlist ID | Shipping Entry | Packlist ID |  |
| Part ID | Part Maintenance | Part ID  Site ID | Site ID is optional. To specify site information, you must use the Drill To Configuration dialog. If you specify a value for the Site ID parameter, then the site-level record for the part is opened in Part Maintenance. If you do not specify a Site ID parameter, then the tenant-level record is opened. |
| Part Description | Part Maintenance | Part ID  Site ID | You must use the Drill To Configuration dialog to set up this drill-to link.    Site ID is optional. See the notes for the Part ID class name. |
| Payment ID | Cash Application | Customer ID  Payment ID | You must use the Drill To Configuration dialog to set up this drill-to link. |
| Project ID | Project Maintenance | Project ID |  |
| Purchase Order ID | Purchase Order Entry  Purchase Management Window | Purchase Order ID |  |
| Quote ID | Estimating Window | Quote ID |  |
| Receiver ID | Purchase Receipt Entry | Receiver ID |  |
| Resource ID | Shop Resource Maintenance | Resource ID  Site ID | If the column contains the resource ID, you do not need to configure the parameters. |
| RFQ ID | Request for Quote Maintenance | RFQ ID |  |
| Vendor ID | Vendor Maintenance | Vendor ID |  |
| Vendor Name | Vendor Maintenance | Vendor ID | You must use the Drill To Configuration dialog to set up this drill-to link. |
| Voucher ID | Accounts Payable Invoice Entry | Voucher ID |  |
| Work Order ID | Manufacturing Window | Type  Base ID  Lot ID  Split ID  Part ID | You must use the Drill To Configuration dialog to set up this drill-to link.    Part ID is optional. |