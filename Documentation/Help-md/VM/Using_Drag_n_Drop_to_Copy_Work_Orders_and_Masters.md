Using Drag n Drop to Copy Work Orders and Masters




# Using Drag n Drop to Copy Work Orders and Masters

The Manufacturing window supports the dragging and
dropping of work order/master material and operations from an existing
work order/master to a new work order/master - new meaning only a
header card exists thus far. Dragging and dropping is equal to copying
and pasting: VISUAL copies material and operation information from
the source work order/master to the new work order.

Because dragging and dropping is a physical From/To operation, you
must have multiple windows open - a window with the work order/master
from which you are copying information and a window with a header
card to which you are copying the information. See earlier for more
information on opening and arranging multiple windows.

If an existing operation contains an obsolete resource, then you
cannot copy the operation.

If you are licensed to use multiple sites, you can drag and drop
between sites provided that the resources and materials you are dragging
and dropping exist in both sites. After you drag and drop, check the
warehouse ID field on any material cards to ensure that the warehouse
specified exists in the site on the master header.

For example:

1. Open an existing work
   order. This is the work order from which you want to copy information.
2. Start a new work order.
   Enter necessary information in the Edit dialog box and save the
   work order.
3. Tile the windows so
   you can view both and easily drag and drop between the two.
4. Point anywhere on the
   existing work order and left-click until a box appears.
5. Drag the box into the
   adjacent window and release the left mouse button anywhere on
   the new work order/master header card.

VISUAL displays the progress of the copy
and paste operation in a dialog box. If, for some reason, the operation
was not successful or the paste types were incompatible, VISUAL displays
an error message.

|  |  |
| --- | --- |
| POSTIT.gif | VISUAL automatically copies any document references from the information you are copying; VISUAL assumes you want to copy these document references. |

If you try to drag and drop a work order/master
to another window in which there is a work order/master with an identical
sequence number, VISUAL displays a message box warning you that pasting
would cause a duplicate key for an operation.

It is important to remember that when VISUAL
performs a copy and paste function, it copies operations and materials
but does not copy quantity and other header fields, such as engineering
drawings or revision numbers. Nor does VISUAL copy a work order/masters
labor tickets or materials issues/links to the new work order/master.
After youve created the new work order, you can modify it as necessary.
Because the new work order does not inherit status, you can now release
it to the floor and begin to report labor against it.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Manufacturing_Window.htm) User-defined Help