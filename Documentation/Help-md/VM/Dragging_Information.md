Dragging Information




# Dragging Information

Many of the child windows in the Purchase Management
Window employ the dragging of information. This technique is the fastest
and most accurate method of moving information from tool-to-tool and
eliminates errors caused my entering incorrect information. You can
drag single items from the Explorer panel or multiple lines from tables.

If you are licensed to use multiple sites, you must drag a part
that exists in the site selected in the purchase order tool to successfully
add it to the purchase order. If the part does not exist in the site,
a warning message is displayed.

To drag an item from one window to another:

1. Load the cursor by pointing
   to the information you want to copy, click in it and hold the
   mouse button while holding the cursor still for a moment.

A square appears next to the cursor indicating
you have copied the information.

When dragging from table panels, you can
select multiple lines, for explorer panels, you can only select one
item to drag. Use the CTRL and SHIFT keys to select multiple lines.

2. Without releasing the
   mouse button, drag the information to where you want it copied
   and release the mouse button.

You have now copied the information to the
new location.

|  |  |
| --- | --- |
| POSTIT.gif | VISUAL will not allow you to drag information to invalid locations. For example, you can drag parts from the Part Demand window to the Material Planning window but not from the Material Planning window to the Part Demand window. |

## What Happens When You Drag information:

| Tool: | From | To |
| Part History | You can drag information at both the Part and Demand levels in Detail Mode to the purchase order entry tool.  When dragging a Part ID to a purchase order line, VISUAL creates a purchase order line for that part with a order quantity equal to the sum of the unallocated quantity of its demand. When dragging a demand item, the order quantity is that demand's unallocated quantity. If the Vendor ID is blank, VISUAL uses the preferred Vendor ID as the vendor for the PO. If you enter a Vendor ID, VISUAL checks it against the preferred vendor for the part and prompts you if they are different. | When dragging to the Part History tool, VISUAL populates the table with information for the parts you are dragging. |
| PO Entry |  | You can drag information at both the Part and Demand levels.  When dragging Part IDs to the PO Entry tool, VISUAL creates PO lines for the parts with order quantities equal to the sum of the unallocated quantity of their demand. When dragging a demand item, VISUAL uses that demand's unallocated quantity as the order quantity.  If the Vendor ID is blank, VISUAL uses the preferred Vendor ID as the vendor for the PO. If you enter a vendor ID, VISUAL checks it against the preferred vendor for the part and prompts you if they are different.  Dragging a vendor from the Part Management view to the Purchase Order Entry form populates the purchase order header with information for that vendor.  Dragging a purchase order from the Part Management view to the Purchase Order Entry form opens that PO in the Purchase Order Entry form. |
| Vendor Comparison |  | When dragging to the Vendor Comparison tool, VISUAL populates the table with information for the parts you are dragging. |
| Material Planning | You can drag information at both the demand and supply levels onto the Purchase Order Entry tool. VISUAL adds lines to the purchase order table.  To open a purchase order, you can drag individual rows containing PO supply to the Order ID field of the Purchase Order Entry tool. The appropriate PO appears in the PO Entry tool.  If a demand and supply level row, you have dragged to the PO Entry tool, contains both demand and supply, VISUAL attempts to open the PO or add the line to the PO.  When adding lines to a purchase order, VISUAL passes the Part ID, preferred Vendor ID, net qty required, and the day before the required date to the PO Entry tool.  If the Vendor ID is blank, VISUAL uses the preferred Vendor ID as the vendor for the PO. If you enter a Vendor ID, VISUAL checks it against the preferred vendor for the part and prompts you if they are different.   VISUAL uses the Part ID as the order line Part ID, net qty required as the order qty, and the day before the required date as the line's desired receive date if it is different than the header's desired receive date and it is not before the current system date. | When dragging to the Material Planning tool, VISUAL populates the table with information for the parts you are dragging. |
| Session PO |  | Dragging parts to the Session P/O History child window creates POs for them. VISUAL consolidates parts by preferred vendor. |
| Part Management | Dragging a vendor from the Part Management tool to the Purchase Order Entry tool,  populates the PO header with information for that vendor.  Dragging a PO from the Part Management view to the PO Entry tool opens that PO in the Purchase Order Entry tool. |  |

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Purchase_Management_Window.md) User-defined Help