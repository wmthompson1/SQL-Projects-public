Viewing Part Purchase History




# Viewing Part Purchase History

Use the Part Purchase History feature to view a parts
purchasing history. You can view part purchase history only at the
site level.

If you are licensed to use multiple sites, you must specify a Site
ID to access Part Purchase History. After you access the dialog, you
can view information for sites that share the same parent entity as
the site specified in the Site ID field.

To view part purchase history:

1. Select Inventory,
   Part Maintenance.
2. If you are licensed
   to use multiple sites, click the Site ID
   arrow and select the site to use. If you are licensed to use a
   single site, this field is unavailable.
3. In the Part ID field,
   specify the ID of the part to view.
4. Select Info,
   Purchase History. You can use the selected
   part from the Part Maintenance window, or you can specify a new
   site range and part. To specify a new site range and part:

   1. If you are licensed to use
      multiple sites, click the Site ID(s)
      arrow and select the sites to use. The drop-down menu is limited
      to sites that belong to the same entity as the site you selected
      in Part Maintenance. If you are licensed to use a single site,
      this field is unavailable.
   2. Click the Part
      ID browse button and select the part to view. If you
      selected multiple sites, the browse table lists the part ID
      once for each site. You can select either instance of the
      Part ID. The information displayed in the Purchase History
      window is the same.

5. View this information
   in the table:

Order Date The
date on which you placed the order.

Desired Recv Date
The date on which you want the serviced parts returned from the
outside service vendor. You can modify this date.

Promise Date
The date the outside service vendor promised to have the parts returned.

Last Received Date
The last date on which you last received this part on this order.

Purchase Order
The unique identifierPurchase Order IDfor the service order.

Site ID The
site associated with the order.

Vendor The vendor
supplying the outside service.

Purchase Line Number
The purchase order line number for that service.

Order Quantity
The total part amount to be sent to the outside service vendor.

Received Quantity
The total serviced part amount returned from the outside service
to date.

Currency The
functional currency of the parent accounting entity.

Unit Price The
price per unit expressed in the functional currency.

Native Currency
The native currency of the order.

Native Unit Price
The price per unit in the native currency.

Discount % The
discount percentage applied to the order.

Fixed Cost The
one time cost from the purchase order.

Standard Unit Cost
The part cost from Part Maintenance.

Delivery Schedule
This check box is selected if the purchase order contains a delivery
schedule.

6. If your database contains
   many purchase orders, you can sort by and sequence the purchase
   orders by using the option buttons in the Sort Order and Sort
   Sequence sections.
7. Click Close.

## Exporting Part Purchasing Information

You can export the information in the Part Purchasing table to Microsoft
Excel or to an XML file.

To export to Excel, select File, Send to Microsoft Excel. Excel is launched, and
the information in the table is written to the file.

To export to an XML file, select File,
Send to XML. Specify this information:

File Name Specify the name of the exported
file.

XML to Write Specify the type of XML
to export. Click one of these options:

Schema Click this
option to export the XML schema. The schema is a list of elements,
attributes, and data types. The document shows the structure of the
information, but does not include any of the information in the Part
Purchasing dialog. A schema has a DTD extension.

Document Click
this option to export the data in the Part Purchasing dialog in an
XML file.

Both Click this
option to export both the Schema and the Document.

Tags Specify how to construct the tags
for elements. To use the names of the columns as displayed in the
Part Purchasing table, click Columns. To use the names of the database
columns, click Use Item Name.

Click Export.