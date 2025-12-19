Adding Address Layouts




# Adding Address Layouts

Multiple address
layouts are supported for use throughout VISUAL. You define address
layouts by country. When you select the country in a window such as
Customer Maintenance, the Country ID, name, and address layout update
to the country's associated address layout. If you do not define a
custom layout for a particular country, the default layout is used.

Country Address Layout
IDs correspond to their country descriptions. If you use the same
country description with multiple Country IDs, you can use the same
layout with more than one country. If a country has multiple Country
IDs with unique country descriptions, you can have multiple layouts
for that country. However, it is recommended that you maintain only
one address layout per country by making it flexible enough to accommodate
all potential formats for the country.

Note:
If you type in a free-form description in the Country field and that
description does not exist in the Countries table, the country description
is created, but it is not added to the Countries table. To use the
layout, users must manually specify it in the country description
field in a maintenance window, such as Customer Maintenance.

Address layouts can be
up to five lines and are made up of labels and data fields. The labels
are displayed to the left of the data fields, and you can define one
label for each line. You can use up to seven data fields. You can
place any of the fields on any of the lines in any order.

Users can enter alphanumeric text into the any
of the data fields. Field #9 uses the codes you defined in the States
and Province table.

To define an
address layout:

1. Select Admin,
   Application Global Maintenance.
2. Select Maintain, Address Setup.

The default address layout is the conventional
US address layout.

3. If you want to modify
   an existing address layout, select the appropriate layout from
   the Country list box at the top of the dialog.

If you are specifying a new layout, specify
an ID for the new layout in the Country list box.

|  |  |
| --- | --- |
| POSTIT.gif | Dont waste time reentering the same information. If youre adding a new address layout to the database choose to copy the layout configuration from an existing layout and then modify the new layout as necessary.  Click Copy and specify the name of the new layout. This ID must be the same as the Entitys Country ID.  Click Ok to save the new layout and begin adding configuration information. |

4. Specify this information:

Field # - The
data label fields, 1-5. These are the actual labels appearing down
the left side. For example, in the default, Street Address, City,
State, Zip, and Country are the 5 data address fields. You cannot
edit these values.

Type - Either
L or F. L stands for Data Address Label; F stands for Data Address
Field. You cannot edit these values.

Title - The title
of the data label field. Use this field to customize your address
layouts. Any modifications you make do not appear until you save the
new layout.

Line # - The line
number of the data label field. You can enter numbers 1-5. You can
assign he same number to multiple data label fields. Doing so, however,
causes fields to be placed one atop of the other and may cause confusion.

Position # - If
a data label field has more than one title, you can move the position
of the fields. For example, in the default layout, City, State, Zip
occupies the positions 1,2, and 3 respectively. If you want to move
State to the front, assign State position 1 and the other two the
remaining 2 and 3 positions.

Visible - Select
this column if you want the data label fields to be visible. Visible
is the default.

% - The percent
of the label data field you want displaying. For example, if you want
to extend the length of the City data address field, enter a value
greater than the current value and the field is extended. 999 is the
maximum percent value you can enter.

5. Click Save
   to save the configuration.

After saving, the layout updates to show
your changes.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Application_Global_Maintenance.md) User-defined Help