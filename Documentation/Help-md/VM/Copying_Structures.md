Copying Structures




# Copying Structures

During the building or maintenance process, you may
wish to replicate a portion of an existing master or work order in
another one. This is useful for building masters and work orders using
standard strings of operations and material requirements. You can
do this using the Copy From command.

If you are licensed to use multiple sites, you can
use this function within the same site only. You cannot copy from
one site to a second site.

If an existing operation contains an obsolete resource,
then you cannot copy the operation.

To copy an existing master/work order to a new master, use the following
steps:

1. Create a new master
   using the New command.

VISUAL creates a single header.

2. Select the header and
   select Copy From from the Edit
   menu.

A dialog box appears, allowing you to enter
Base ID, Lot/Eng ID, and Split ID of the master/work order from which
you are copying. You can also use the standard Search function.

3. Specify the master/work
   order you are copying.
4. Click the Ok
   button.

VISUAL copies the selected master/work order
to the new header.

|  |  |
| --- | --- |
| POSTIT.gif | The Copy From function copies all data elements from the indicated Work Order/Master including quantity, release date and want date. You should use New Work Order From functions to launch new work orders to be released, as they do not overwrite these values.  If the master/work order you are copying contains any document references, VISUAL copies those references to the header card of the new work order. |

To copy an entire master/work order to become a leg of the current
master work/order:

1. Select the operation
   to which you want to add the leg and add the leg using the procedures
   described above.
2. Select the leg header
   and choose Copy From
   from the Edit menu.

A dialog box appears, allowing you to enter
Base ID, Lot/Eng ID, and Split ID of the master/work order from which
you are copying. You can also use the standard Search function.

3. Click the Ok
   button.

VISUAL copies the selected master/work order
to the leg. The leg header you selected replaces the header of the
copied master/work order, and the entire structure is added to the
new leg. This also includes any legs on the copied structure.

|  |  |
| --- | --- |
| POSTIT.gif | If the master/work order you are copying contains any document references, VISUAL copies those references and adds them to any references you have on the header card of the current master/work order. |

To copy an operation of an existing master/work order to REPLACE
an existing operation of the current work order:

1. Select the operation
   that you want to replace with the copied operation and select
   Copy from the Edit
   menu.

A dialog box appears, allowing you to enter
Base ID, Lot/Eng ID, and Split ID of the master/work order from which
you are copying. You can also use the standard Search function.

2. Specify the master/work
   order ID information.

A table appears, listing every operation
in the specified master/work order.

Select ONE operation that you want to use
to replace the current one.

3. Click the Ok
   button.

The currently selected operation retains
its sequence number, but VISUAL replaces it with the contents of the
copied operation. Any material requirements on the copied operation
are also copied, but requirements on the current operation are NOT
removed. You can only copy requirements if they have a different Piece
Number from requirements on the current operation. For example, you
cannot copy an operation that has a requirement with a Piece Number
10 if the current operation already uses that piece number.

|  |  |
| --- | --- |
| IMPORTNT.gif | Using Copy From allows you to build masters and work orders from standard templates and other existing pieces. However, you should consider the following issues when using this feature:   * Copying an Engineering   Master into another work order makes that engineering   master unique to that work order. This means that if you   change the engineering master, it is NOT changed in that   work order (or any other work order to which it has been   copied). * If you are building   and stocking subassemblies and issuing them to work orders,   you should NOT use Copy From. You should add the subassembly   to the work order as a material. That way, if you have   to change the engineering master, it also changes in any   work orders to which it has been added using the Add Material   function. * Use Copy   From if you are building a unique subassembly as   a part of a work order. You can copy from an existing   engineering master and modify it once it is in the work   order, if necessary. * If an operation   in the master contains an obsolete resource, then a message   is displayed informing you that the master contains an   obsolete resource. You cannot complete the copy process |

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Manufacturing_Window.htm) User-defined Help