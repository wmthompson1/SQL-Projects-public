Using the Order Point Tool




# Using the Vendor History Tool

Use the Order Point tool to view non-consigned part
inventory information for which you have specified order point information.

The Order Point tool has two levels of information: Part and Warehouse.

To use the Order Point tool, select the Order Point option from
the Tool menu.

Viewing Warehouse Order Point Information

To view warehouse order point information, double-click Order Point
and select the part in which you are interested.

A list of all of the warehouses for the part appears below the part
name in the explorer panel.

Generating Purchase Orders

There are three methods you can use to create purchase orders in
the Order Point child window:

Using the Auto Generate Button If you
have specified Order Point and Order Up To quantities for your parts,
you can create purchase orders from the Order Point child window.
For example, if you have the following condition:

Quantity On Hand = 9

Quantity On Order = 123

Quantity In Demand = 0

Order Point = 120

Order Up To = 240

Even though you do not have a demand, you have specified an order
point. VISUAL calculates the quantity to be purchased as:

Order Up To Qty on Hand Qty On Order = Calculated Quantity to
Order

|  |  |
| --- | --- |
| POSTIT.gif | If you have not defined the Order Up To Quantity or have defined it as zero, VISUAL uses the Order Point Quantity as the Calculated Quantity to Order. |

To generate purchase orders, select the Part in the explorer pane,
the warehouse in the table pane, and click the Auto
Generate button.

|  |  |
| --- | --- |
| POSTIT.gif | VISUAL only creates a new Purchase Order with a status of Firmed: you must release the order using the Purchase Order Entry child window or the Session P/O History window. |

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Purchase_Management_Window.htm) User-defined Help