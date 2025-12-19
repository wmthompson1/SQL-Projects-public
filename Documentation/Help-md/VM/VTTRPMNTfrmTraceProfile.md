Setting Up a Traceable Part




# Setting Up a Traceable Part

Set up traceable parts by giving a Traceability Profile
to a part previously defined in Part Maintenance. After this profile
exists, all relevant Infor VISUAL applications recognize this part
as traceable and behave accordingly. Usually, this means having to
call up a Part Trace dialog before completing an operation, and entering
or verifying traceability information.

To configure the traceability profile for a previously non-traceable
part, use the following procedure. These steps can be completed in
any order, with the exception of step 1, which must be completed first.

|  |  |
| --- | --- |
| POSTIT.gif | When no traceability profiles are defined in the system, push buttons and other traceability controls are hidden throughout the system. The first time you setup a profile, notice the extra buttons and columns in many applications that were not previously visible. These items are usually disabled (grayed) when a non-traceable part is being referred to on the screen. |

1. If you are licensed
   to use multiple sites, click the Site ID arrow and select the
   site where you want to trace parts. If you are licensed to use
   a single site, this field is unavailable
2. Enter the Part ID. You
   can also click the Part ID button and
   select the part from the Part Table.

The part description appears to the right
of the Part ID.

3. Enter a label up to
   30 characters in length.

The Label field sets the terminology used
to refer to groups of the traceable part. The two most commonly used
labels are Lot or Lot Number, and Serial Number. This label is used
in table column titles and report labels for the Trace ID for this
part. The defined label sets the title of table columns throughout
the traceability user interface.

4. Enter any description
   or comments about the traceability profile for this part in the
   Comments field.

This is a multi-line, free form text field.

5. Set up a Numbering Scheme
   by selecting one of the following radio buttons in the Numbering
   section:

Automatic - The
system always assigns the lot or serial number, based on a Numbering
Profile that you set up.

Automatic Numbering may be preferable for
fabricated parts. For example, use automatic numbering to automatically
generate serial numbers for parts that you ship.

If you select Automatic Numbering, you must
specify a Numbering Profile ID. The numbering profile specifies an
alphanumeric prefix and suffix, starting number, and whether leading
zeros appear.

User - The user
always enters the number manually. No numbering profile is set up.

User numbering is useful for purchased materials
that come with a vendor Lot ID or serial number. If you wish to use
that number for your internal lot number or serial number, you can
manually enter it when receiving. You can also use this type of numbering
whenever you need to assign numbers in a way that cannot be manually
generated.

For example, you may assign serial numbers
to finished goods based on the customer, work order ID, date, configuration
or other parameters.

Automatic or User -
Both modes of numbering are allowed.

6. If you selected Automatic
   Numbering above, select a Numbering Profile ID using the drop
   down box in the Numbering Profile ID field.

Numbering profiles are similar to auto-numbering
information set up for other VISUAL objects, such as purchase orders.

By default, \*None\* appears in the Number
Profile ID field. Use this setting if you are using User Numbering.
Otherwise, you must make a selection from the drop down box.

|  |  |
| --- | --- |
| POSTIT.gif | Numbering profile sequences are not specific to a Part ID. All parts that use the numbering profile ID share the sequence of numbers generated. If you need a part to receive an unbroken sequence of numbers, create a separate numbering profile and use it only with that part. |

7. Specify if numbers must
   be preassigned by checking the Numbers Must Be Preassigned check
   box.

This allows strict control of lot numbers
by assigning them ahead of time, rather than assigning them upon receipt
or issue. The assignment is done using the Pre-Assign Numbers function
in Part Trace Maintenance.

If you select this option, you must be sure
that numbers are preassigned on time, or that a supervisor or other
appropriate person has access to the preassign function. No transactions
for the part are possible if a number is not available to use.

8. If you want to allow
   the user to edit the Expiration Date for this profile, select
   the Allow Editing of Expiration Date
   check box.
9. In the Quantity Fill
   section, select whether you want to automatically or manually
   enter the quantity in the Traceability for Part dialog box.

For example, if you are in Labor Ticket
Entry and enter a quantity of 12 for the parts completed, 12 appears
as a quantity for the transaction when you click the Part Traceability
icon on the toolbar.

|  |  |
| --- | --- |
| POSTIT.gif | You can also select the Quantity Fill type by selecting Auto-fill from the Options menu. |

10. Specify the shelf life
    in days for the part in the Shelf Life (Days) field.

Shelf life is for perishable parts. Using
the information from this field, VISUAL calculates an expiration date
by adding shelf life to receipt date, and warns you when this expiration
date arrives. An entry is not required; a blank indicates that a shelf
life does not apply.

11. Specify Maximum Lot
    Size.

This number specifies the maximum quantity
of a part that can be grouped under one lot number. This helps the
system intelligently assign numbers, and detect errors in your assignments.

For material purchased in standard lots,
you can set this number to the standard lot size, or the largest one
if there are several sizes available.

For any serialized parts, it is important
that you set this number to one (1). This specifies that a quantity
of one for a part gets one unique serial number; any other value here
allows multiple quantities of a part to be assigned the same serial
number.

Leave this field blank to indicate that
there is no maximum lot size.

12. Define the alpha and
    numeric properties.

Properties allow you to specify extra pieces
of information that are entered when new lots, serial numbers, or
other trace numbers are created.

There are two types of properties, Alpha
and Numeric. The only difference between the two is the data type.
Alpha properties allow alphanumeric input (letters and numbers), and
should be used for non-numeric information. Numeric properties allow
input of numbers only, and should be used for information you may
wish to apply to mathematical and statistical functions. You can define
up to five of each type of property.

One use of properties is to record variable
characteristics of materials. A material with a single Part ID might
have a variable strength, grade, tolerance, color, or other characteristic
that does not make it a separate part, but must be recorded and may
affect production. Use properties to record this information upon
receipt.

For each alpha or numeric property you wish
to specify, enter a label to identify the property. These labels appear
as titles for traceability table columns.

Additionally, you can specify the following:

Required - Select
the Required check box if you want the user to enter information into
the property column.

Editable - Select
the Editable check box if you want the user
to be able to edit information n the column after you have saved it.

Visible - If you
do not want the column to be visible, select the Visible
check box.

If you select Print Traceability
Info, VISUAL prints properties on Work Order Travellers along
with other trace information.

13. Specify when the system
    applies Traceability.

Traceability is a "horizontal"
feature of Infor VISUAL - when it is activated, it affects a number
of applications. You can specify the individual points in your material
movement cycle when part trace information is provided or verified.
There are four categories.

Receiving - Traceability
information is required when the part is received to inventory. For
purchased parts, this occurs when using Purchase Receipt Entry.

For fabricated parts, this occurs when using
Inventory Transaction Entry. In both cases, the received quantity
and lot number are entered for each group being received.

For returns of purchased materials, and
for receipt returns of finished goods, the quantity returned must
be specified in terms of specific lot numbers or serial numbers being
returned.

In general, you should select this option
for purchased materials, as you usually want to begin traceability
with initial receipt. For a fabricated part, however, you may wish
to receive it to inventory in an untraced form, and begin traceability
when it is shipped to fill an order.

Issuing/Shipping
- Traceability information is required when the part is issued to
a work order, or shipped to a customer.

For purchased parts, this occurs when using
Inventory Transaction Entry to issue a part to a work order.

For fabricated parts, this occurs when using
Shipping Entry. In both cases, you are required to indicate which
lot numbers or serial number the issued material comes from, and in
what quantities.

For returns of raw materials issued to a
work order, and for returns of shipped goods, the system recalls the
lot numbers initially issued from. You are required to specify the
return from those lot numbers only.

Adjustments -
Traceability information is required when inventory adjustments are
made in or out. This will occur when using Inventory Transaction Entry
for Adjust In or Adjust Out transactions, or when performing a Physical
Inventory of traceable parts.

Labor Tickets
- Traceability information is required when a run labor ticket with
a completed quantity is entered for a fabricated part that is traceable,
at the operation marked Begin Traceability. You are required to enter
the lot numbers and quantities being completed. This option does not
apply to purchased materials. Check the box next to each desired
option in the When To Apply section.

14. Click the Save
    button to save the Part Trace Profile.

The profile takes effect on the next transaction
for the part.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Part_Trace_Profile_Maintenance.md) User-defined Help