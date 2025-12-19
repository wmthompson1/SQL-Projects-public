Adding an Operation




# Adding Operations

After you create the base master, you can begin to
add operations to it. There must be at least one operation for you
to specify material requirements or legs. Because each operation is
different and your requirements for operation information may vary,
the procedure below describes how to add an operation with only the
basic operation information. Procedures for adding supplemental operation
information follow this procedure.

1. Select the leg to which
   you want to add the operation.

You may select the leg by clicking on the
master header (if you want to add to the main leg) or a leg header.
You can also select a leg by clicking on any other operation or material
on the same leg.

For a brand new master, your only option
is to select the header to add the first operation.

2. Select Add
   Operation from the Edit menu.

The Operation window for the new operation
appears.

3. Specify an Operation
   Type, if any. You can define Operation Types in Shop Resource
   Maintenance; they act as operation templates and can contain all
   of the information you need to fill in here.

If you want to use a template, enter its
name, or select it from the drop down menu.

VISUAL asks to confirm that you wish to
copy the default information in the type. If you select Yes, VISUAL
copies all of the information in the operation type into this operation.

You can set up a preference in Preferences
Maintenance to always load the default information type and suppress
this message. See [Suppressing
the Load Defaults from Operation Type Message](Suppressing_the_Load_Defaults_from_Operation_Type_Message.md).

4. Adjust the Sequence
   Number, if necessary.

The Sequence Number identifies the operation
within the selected leg. By default, VISUAL generates numbers in increments
of ten. The sequence number for a new operation always defaults to
ten plus the last operation number, so VISUAL adds the new operation
to the end.

If you want to add the operation at another
position, adjust the sequence number so that it is in between the
two surrounding operations.

|  |  |
| --- | --- |
| POSTIT.gif | When building masters, be sure to leave enough room between operations. If you feel you may add more than nine operations between the current ones, use increments larger then ten. |

5. Specify a Resource ID.

Each operation must specify the Resource
ID of the shop resource it uses. You can enter the ID, or select it
by pressing the Resource ID button. You
can modify the Setup, Run time, Duration and At Start for the selected
resource. Shop Resources are defined in Shop Resource Maintenance.

If you are licensed to use multiple sites,
you can select only those resources that exist in the site on the
header card. If you are licensed to use a single site, you can select
any resource in your database.

6. If you specified a subcontractor
   resource, enter the Service ID, or click the Service
   ID button and select a Service ID from the table.

You can define Service IDs in Service Maintenance.
They define information for the actual service to be used to meet
the resource requirement.

If you are licensed to use multiple sites,
you can select only those services that exist in the site on the header
card. If you are licensed to use a single site, you can select any
service in your database.

7. Enter Setup and Run
   Information, including:

Setup hrs - Enter
a setup time if it applies. The default is zero.

Run/Run Type -
Use the Run and Run Type fields together to express the run time.

In the Run field, enter the number of the
run, which you qualify in the Run Type filed.

You can specify run time in Hours/Piece,
Pieces/Hour, Minutes/Piece, Pieces/Minute, Hours/Load, Loads/Hour.
Keep in mind that "piece" refers to any unit quantity of
the material.

For example, if a product is produced in
feet, and you know it takes 15 minutes to produce a foot, the run
time is 15 Minutes per Piece. Enter 15 in the Run field, and Minutes/Piece
in the Run Type field.

Load - You can
also express run time in terms of a standard load size for the resource.
Use the field when the material is processed in discrete loads. When
you specify Hours/Load or Loads/Hour, you must also provide the load
size.

VISUAL breaks the Start Quantity for the
operation into the number of loads needed. For example, if 101 units
are incoming and the load size is 100, VISUAL needs to process two
loads to complete the job.

For subcontractor operations, enter Transit
Days in the Transit Days field. This is the total time between the
start of the operation and the time the material is back in house
and ready for the next operation.

You enter this information instead of setup
and run time.

8. Enter any text specifications
   in the multi-line Specifications field. These specifications appear
   in the Manufacturing Window, engineering reports, and shop traveller.
9. Enter the Move Information.

In the Move Hrs field, enter the number
of hours that must pass between the end of this operation and the
beginning of the next.

In the Min Move Qty field, enter the minimum
number of pieces, or quantity of material, that can be moved from
one operation to the next when the total operation is not yet complete.
This allows scheduling of overlapping operations based on a continuous
quantity feeding from one to the next. Leave this field blank to specify
no overlap.

To specify the maximum overlap possible,
enter 0.0001, the smallest minimum move quantity supported. This essentially
schedules the operations in parallel.

10. Click the Save
    button.

VISUAL adds the operation to the Manufacturing
Window.

|  |  |
| --- | --- |
| POSTIT.gif | If you want to quickly add an operation with minimal details, clear the Operation Edit Form option on the Views menu.  When you add an operation, a list of resources appears, select the resource you want to use for the operation.  VISUAL creates an operation for that resource with the next sequential number using only the information from the resource.  If you have opened the Operation child window, you can use the Show/Hide Edit Operation Form toolbar buttons to hide or show the Operation window. |

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Entering_Scrap_Yield_Information.md) Entering Scrap/Yield Information

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Selecting_a_Test_ID.md)
Selecting a Test ID

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Specifying_a_Drawing_Number.md)
Specifying a Drawing Number

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Specifying_When_Setup_Can_Begin.md) Specifying When Setup Can Begin

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Setting_Up_Labor_Reporting_on_the_Operation_Card.md) Setting Up Labor Reporting

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Scheduling_Discontinous_Operations.md) Scheduling Discontinuous Operations

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Specifying_a_Predecessor_Operation.md) Specifying a Predecessor Operation

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Specifying_Capacity_Use_Information.md) Specifying Capacity Use Information

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Overriding_Costs.md)
Overriding Costs

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Specifying_Concurrent_Resources.md) Specifying Concurrent Resources

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Embedding_a_Picture_Object.md)
Embedding a Picture/Object

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Adding_Outside_Service_Information.md) Adding Outside Service Information

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Adding_Quotes.md)
Adding Quotes

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Dispatching_Services.md)
Dispatching Services

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Manufacturing_Window.md) User-defined Help