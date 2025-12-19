Viewing the Supplier Performance Graph




# Viewing the Supplier Performance Graph

After you specify [performance
criteria](Setting_Up_Supplier_Performance_Criteria.md), you can view supplier performance in the graph.

To generate the graph:

1. Select Purchasing,
   Supplier Performance Rating.
2. Click Refresh.

The number of suppliers you specified to display in the Limits section
of the Setup dialog box are shown.

Under the graph, the grid shows all purchase order lines that fit
the limits and filters you specify. Purchase order lines for suppliers
not shown in the graph are also displayed. One row is displayed for
each line in the purchase order.

Click a suppliers bar in the graph to view only the purchase order
lines that contributed to the suppliers rating.

This information is shown in the grid:

Desired Recv Date The date you would
like to receive the parts is displayed. If a delivery schedule has
been set up for the purchase order line, then the earliest date specified
on the schedule is displayed. If no delivery schedule has been set
up, then the date specified on the purchase order line is used. If
a date was not specified on the line, then the date specified on the
purchase order header is used.

Last Recv Date The date that materials
were last received for the order is displayed.

Days Difference If the Last Recv Date
is later than the Desired Recv Date, the number of days difference
between the two dates is displayed.

Site ID The ID of the site where the
order was placed is displayed.

Vendor ID The ID of the vendor (supplier)
specified on the purchase order is displayed.

Purchase Order The ID of the purchase
is displayed.

Part ID The part ID ordered is displayed.

Order Qty The quantity of part ordered
is displayed.

Received Qty The quantity of part that
has been received is displayed.

Qty Difference If the Received Qty is
less than the Order Qty, the difference between the two quantities
is displayed.

% Quantity Complete The percentage received
is displayed. To calculate the percentage, the received quantity is
divided by the order quantity and then multiplied by 100.

For information about the common functions and features available
in grids, see [Grids](Grids.md).

## Filtering Information in the Supplier Performance Window

You can view supplier performance information for any combination
of sites you choose. You can also view supplier performance information
for a single part.

To filter the graph for a particular site, part ID, or a combination
of sites and a part ID, specify this information:

Site
ID  Click the Site arrow and select the sites to include
in the performance analysis.

Part
ID  Specify the ID of the part to include in the performance
analysis. You can specify only one part. The graph is updated to show
performance data for the part you selected. The grid shows only purchase
orders for the selected part that where created on or after the date
you specified in the Setup dialog.

Click Refresh. The graph is updated to
show performance data for the sites and part you selected. The grid
shows only the purchase orders for the sites and part that you selected
that were created on or after the date you specified in the Setup
dialog.

To clear the part ID field, click New.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Exporting_Supplier_Performance_Information_to_Microsoft_Excel.md) Exporting Supplier Performance Information
to Microsoft Excel