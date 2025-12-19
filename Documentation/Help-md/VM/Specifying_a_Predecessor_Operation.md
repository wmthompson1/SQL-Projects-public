Specifying a Predecessor Operation




# Specifying a Predecessor Operation

Specify a predecessor operation on the Other tab. The operation
that you specify as the predecessor operation must be scheduled to
be complete before the selected operation. For example, if you specify
4/20 as the predecessor operation of operation 5/10, then operation
4/20 is scheduled to be complete before operation 5/10.

You can specify any operation as the predecessor of another operation
provided that the predecessor operation is not in the same sub ID
structure. If you specify a predecessor operation that would result
in a loop, the system prevents you from saving the predecessor operation.
For example, if you specify 4/20 as the predecessor operation of operation
5/10, you could not successfully specify 5/10 as the predecessor of
4/20.

To specify a predecessor operation:

1. Open the operation card
   you want to use. The operation you open is the operation that
   has a required predecessor.
2. Click the Other
   tab.
3. Click the Pred
   Sub ID browse button and select the operation that must
   be completed before the work on the operation you are viewing
   can begin.
4. Click Save.

When the system schedules the work order, the system schedules the
predecessor operation before the selected operation.

## Viewing Predecessor Operations

You can view the predecessor operations defined on a work order
or engineering master. Select Info, Predecessor Operations. The system displays operations
along with their predecessors.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Manufacturing_Window.md) User-defined Help