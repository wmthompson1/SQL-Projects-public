Specifying Alternate Parts




# Specifying Alternate Parts

Use the Alternate Parts tab to specify the parts that can be used
in place of the main part on the material card. The system activates
this tab when you select Allow Alternate Parts on the [Header
Card](Creating_Masters_and_Work_Orders.htm).

If you do not have security access to add alternate parts, the system
deactivates the tab.

After you specify alternate parts, you can use Inventory Transaction
Entry to issue an alternate to a work order. The alternate part you
issue must have the same unit of measure as the part it replaces;
keep this in mind as you build the list of alternate parts.

You can also use the Material Planning Window to replace a material
requirement with an alternate part. When you use the Material Planning
Window, the system replaces the original part ID and usage UM in the
material requirement card with the part ID and usage UM of the alternate
part.

When you create a new material card and access the Alternate Parts
tab, the system inserts the alternate parts identified for the main
part in Part Maintenance. You can add alternate parts on a material
card, but these parts will apply to the active material card only.
Any alternate parts you specify on the material card will not be added
to the main part record in part maintenance.

When you specify an alternate part, make sure your choice is valid
for the work order. For example, if your work orders end product
is Part A, you cannot use Part A as a substitute part for any other
part on the master. Similarly, if your work order consists of several
sub-assemblies, the end product of a sub-assembly cannot be used as
an alternate part for any of the materials that make up the sub-assembly.

Because you specify default alternate parts on the part record in
[Part Maintenance](VMPRTMNTfrmPart.htm), you may find that
some of the alternate parts listed in the Alternate Parts tab are
not valid selections for a particular work order. You can delete the
invalid alternate parts by selecting the line item, then clicking
the Delete button. Click the Save button
to complete the deletion. The system only deletes the alternate part
for use with the selected work order. It does not remove the alternate
part from the Part Maintenance record. If you delete the invalid alternate
part from the material card, the part will not be eligible to issue
to the work order in Inventory Transaction Entry.

To add an alternate part to the material card:

1. Click the Alternate
   Parts tab.
2. Click the Insert
   button.
3. Double-click the Part ID browse button and select a part. If
   you plan to issue the part using Inventory Transaction Entry,
   make sure you select a part ID with the same unit of measure as
   the original part. The system inserts the description.
4. Assign a rank to the
   alternate part. Use the rank field to indicate your preference
   to use the part as an alternate. This field is optional.
5. Click Save.

You can also drag an alternate part from the Alternate Part Information
window or from the Part ID browse table to the alternate part table.

You can issue an alternate part to the work order in Inventory Transaction
Entry. If you decide to use an alternate part, the system creates
a new material card with the alternate part in the part ID field.
The system selects the Alternate Part check box and inserts the piece
number of the original part that the alternate part is replacing.

The system retains the original parts material card. In the Alternate
Parts tab, the system inserts the quantity of alternate part issued
to the material requirement.

The system indicates that an alternate part has been issued in the
following ways:

Material Card The system selects the
Alternate Part check box and inserts the piece number of the original
part in the Original Issuing Piece # field.

Graphical View - 1 Window  On the
material card for the alternate part, the system inserts the piece
number of the original parts material card in parentheses next to
the piece # of the alternate part material card; for example, 20(10).

Graphical View - 2 Window, Text View - 1 Window,
and Text View - 2 Window The system inserts the piece number
of the original parts material card in parentheses next to the piece
# of the alternate part material card; for example, 20(10).

Grid The system inserts the piece number
of the original material card in the Alt Part Parent Piece # column
on the line where the alternate part is displayed. The system inserts
the piece number of the alternate part material card in the Alt Part
Piece # column on the line where the original part is displayed.

## Viewing Alternate Part Information

You can view the availability of the original part and the alternate
parts in the Alternate Parts Information dialog box.

Select View, Alternate
Part Information.

The system lists the original material in the Available Parts list
and the alternate parts specified on the material card in the Alternate
Parts list. Click a part in the left pane to view information about
the part in the tables.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Manufacturing_Window.htm) User-defined Help