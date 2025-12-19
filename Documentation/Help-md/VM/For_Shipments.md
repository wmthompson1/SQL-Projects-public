For Shipments




# For Shipments

1. Enter Shipment Line
   information in Shipping Entry.

When shipping finished goods, first enter
the Ship Quantity for each line, and modify the Warehouse ID and Location
ID if necessary, and enter any Actual Freight.

When you are finished entering line information,
click the Save button or the Ship
All button, if appropriate.

VISUAL automatically fills in the Ship Quantities
and then informs you that you must enter part traceability before
you can complete the shipment.

2. For each line containing
   a traceable part, select the line and click the Part
   Traceability button.

The Traceability dialog box appears.

Total Quantity displays the Ship Quantity
that you entered on the line. This is the quantity that must be attributed
to one or more lots or serial numbers.

The Warehouse ID and Location ID from the
line item appear at the top of the dialog box. You can change it here,
if necessary. You cannot specify multiple warehouse locations in a
single transaction.

3. Create and/or Enter
   Lot Numbers.

There are two possibilities for each part:

Traceability Has Already
Begun - If When to Apply for the parts traceability profile
had Receiving or Labor Ticket Entry checked, then traceability for
this part has already started, and it should already have a lot number
(i.e., serial number, lot number, etc.). In this case, all of the
existing lot numbers with unissued quantities are shown. The parts
you are shipping should be among these lot numbers.

Traceability Starts with
Shipment - If Receiving and Labor Ticket Entry traceability
arent checked, then the parts havent been traced up to now. In this
case, enough new lines to handle assignment of new lot numbers will
automatically be inserted into the table. This is done by referencing
the Maximum Lot Size for the part in its traceability profile. For
example, if Ship Quantity is 10, and Maximum Lot Size is 1 (i.e.,
serial number traceability), then 10 lines are inserted, one for each
individual serial number needed.

4. Set the quantities.

VISUAL automatically fills in the Quantity
fields of the existing lines, whether they are new lot numbers or
existing ones, so as to distribute the total Ship Quantity across
the lot numbers. In the example given above, each of the 10 lot numbers
created would get a Quantity of 1.

You are not required to use these defaults.
If traceability has begun, they may not correctly specify the lot
numbers of the parts you are actually shipping. If you want to modify
ship quantity for a lot number, change the Quantity fields as needed.
If you wish to ship to more lot numbers than are shown, click the
Insert button to create new rows. If the shipment actually contains
less lot numbers, select the unwanted lines and click the Delete button.
Use the Reset button to reset the dialog box to the original default
lines and quantities.

You can keep track of how much of the total
Ship Quantity you have accounted for by watching the Numbered Quantity
field at the upper right. This field is the total of all entries in
the Quantity column. You usually want this to equal Total Quantity.

You are allowed to have Numbered Quantity
be greater than or less than Total Quantity. When you press Close,
you are warned, and given the option to cancel or accept the override.
If you choose to override, VISUAL automatically adjusts the Ship Quantity
for the line to the Numbered Quantity.

As an example, consider a shipment of 300
pieces that actually comprise 3 lot of 100 pieces, each that were
created upon receipt of finished goods to inventory. When you enter
traceability for shipping, all lot numbers that are unshipped display.
The 300 are distributed among the first entries. You must find the
three correct lot numbers, if these are not, and enter 100 for the
Quantity of each. Then, enter 0 for any incorrect lot numbers that
still have a quantity.

5. Enter Properties and
   Comments.

When you create a new lot number, you must
enter all properties at that point. Afterwards, you can only change
the lot numbers using Part Trace Maintenance. If a property is marked
as required in the traceability profile for the part, you cannot complete
the transaction until you enter a value for the property. Additionally,
you may enter any comments at this point.

6. Modify the Expiration
   Date, if necessary.

If the part you are shipping has a finite
shelf life, the expiration date is set when the lot number is created
by adding the shelf life to the creation date. If needed, you can
override this date at any point.

7. Click the Close
   button to exit the Traceability dialog box.

If Numbered Quantity does not equal Total
Quantity, VISUAL gives you the option of aborting the close or overriding
the quantity. If you override, VISUAL resets the Ship Quantity for
the line to the current Numbered Quantity.

8. Repeat this procedure
   for each line then click Save or Ship All as appropriate to complete the transaction.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Part_Trace_Maintenance.md) User-defined Help