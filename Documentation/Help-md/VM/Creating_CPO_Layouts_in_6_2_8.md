Creating CPO Layouts in 6.2.8




# Creating CPO Layouts in 6.2.8

1. From the Key/Version
   list box, select CPO and then enter
   a version for the layout in the adjacent field.
2. In the Description field,
   enter a description for the layout key. Click the Description
   button to choose a predefined layout key description.
3. From the File Type section,
   select a File Type: Single or Multiple.

Single file -
This single file type writes all records to one file. Available record
types for CPO are HDR, LIN, and SUB. VISUAL imports CPO documents
from Single files only; there is no Multiple file option available.

Multiple file
- This option is not available for CPO layouts.

4. From the File Style
   section, select the appropriate file style.

The file style refers to the format of the
data contained in the .VDI file. You can select:

Fixed - Choose
this option if you want the data in the .VDI files to always occupy
the same "fixed" space for each field and record.

Delimited - Choose
this option if the data in the .VDI file varies in size.

5. Select the appropriate
   delimiter for the end of each record, and a character to separate
   each field in the record. Please see the detailed description
   of Delimited styles in the previous section.

For Record, select from Blank,
Newline and Null
(Fixed Length).

For Field, select from Blank,
Asterisk, Comma,
Tab, or Null (Fixed
Length) as a delimiter.

Note: If
you are creating a Null (fixed length) layout (i.e. with each record
contained on its own line), choose the following settings:

File Style: Fixed

Record: Newline

Field: Null (Fixed Length)

6. Click the Header
   tab and choose the appropriate Inbound Duplicates Rule for headers,
   line items, and delivery schedules.

Note: The
Update check box must be selected in the Header Inbound Rule section
to use Line Item Duplicate and Delivery Schedule Duplicate features.

During the import of data, VMDI checks the
import file records to see if duplicate data exists. Duplicate data
has the same primary key in the targeted VISUAL table.

For CPO imports, a duplicate customer order
has the same Customer Order ID as an order that already exists in
the VISUAL database.

Update Duplicate
Select the Update Duplicate option button if you want the data in
the .VDI file to replaces the existing data in VISUAL. The replacement
of data includes default and null data. For example, replacing a duplicate
customer order line with one that has a different Part ID may also
replace the unit price if the new Part ID has a different price than
the old one.

Reject Duplicate
Select the Reject Duplicate option button if you want the data VMDI
to ignore data in the .VDI file that has the same primary keys as
data in the targeted VISUAL table. For CPO imports, VISUAL rejects
all duplicate customer orders and writes details to a log file.

If you choose Reject Duplicate, VISUAL disables
the Line Item and Delivery Schedule options.

Replace Duplicate
This function is unavailable for CPO imports.

7. Choose a method of calculating
   quantity:

Cumulative - Select
the Cumulative option button if you want VISUAL

Discrete - Select
the Discrete option button if you want VISUAL to import the actual
delivery schedule quantities included in the SUB (delivery schedule)
records of the CPO VDI file. VISUAL performs no calculations or computations.

8. Choose a Cumulative
   Base:

Shipped Quantity
- Select the Shipped Quantity option button if you want VISUAL to
use the actual ship quantity plus any adjustment as the starting point.

Fab Build - Select
the Fab Build option button if you want VISUAL to compare delivery
schedule quantities during imports.

If a quantity exists in the SUB record,
VISUAL compares the quantity of the first delivery schedule to it,
and then updates it with the quantity with the difference between
the two. If the first delivery schedule is less than the fab build
qty, VISUAL reduces the first delivery schedule qty to 0. If there
is no fab build qty at the time of import, VISUAL imports the first
delivery schedule qty in the VDI file (as if you had chosen to import
as discrete).

9. Click the Line
   Item tab and select the Delete Unshipped Lines checkbox
   if you want VISUAL to delete any unshipped lines on an order before
   updating with updated data from a new .VDI file. This feature
   is useful for customers whose trading partners insist that they
   delete any customer order line items not shipped on an order prior
   to receiving updates for that order.
10. Click the Sub
    Line Item tab and select the Delete Unshipped Schedules
    checkbox if you want VISUAL to delete any unshipped delivery schedules
    on an order before updating with updated data from a new .VDI
    file. This feature is useful for customers whose trading partner
    insists that they delete any customer order delivery schedule
    lines not shipped on an order prior to receiving in updates for
    that order.
11. Click the Line
    Item tab and begin to establish Match Fields.

If you have chosen Update (see step 6) as
your inbound rule, you can choose how VISUAL determines line item
matches for your CPO layout. If you do not choose any line item match
fields, VISUAL updates line items based on a match of the Part ID.
If you have multiple line items on an order for the same Part ID,
it will only update the first occurrence of the part. You may need
to choose additional match fields to avoid that problem.

It is possible to use the line item number
as a match field, but many EDI trading partners dont use the line
item number in the incoming data. You may need to use other fields
to determine the correct line item for update.

To solve the problem of matching on the
line item number, choose other fields for VISUAL to send in the line
item. You can choose a combination of fields that allow you to create
a unique line item in the order. If the combination you have selected
does not determine unique line items, you will need to add more fields
to your match criteria until you find the right combination. For example,
Part ID and EDI Release Number may determine a unique line item for
your order. If thats not unique, try adding the Shipto ID field.

If you use the line item number field as
part of your match criteria, VISUAL ignores all other match fields
and the line item number determines the match.

Also, if you have delivery schedules on
your line items, do not use
the Desired Ship Date field as part of your match criteria. VISUAL
uses the Desired Ship Dates in all of the delivery schedules for the
line item and finds the earliest date, and then updates the Desired
Ship Date field on the line item with that date. If you use delivery
schedules, make an effort to avoid using the Desired Ship Date field
as part of your match criteria.

If you are not using delivery schedules,
the Desired Ship Date is fine to use as part of your match criteria.

In the Available Match Fields data field,
highlight the field you want to add.

Click the Right Arrow
to move the field into the Selected Match Fields box date field.

Repeat this procedure for each line you
want to add.

12. Choose [CPO
    special settings](Choosing_Special_CPO_Settings.htm) and begin to define a record layout. See
    Defining Record Layouts more information.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Data_Interchange.htm) User-defined Help