Using the Grid View




# Using the Grid View

In the grid display, the master is displayed in a table. The header
is displayed in the first row. Operations, legs, and materials are
displayed in subsequent rows. Like the Text display, information in
the table is indented to show the relationship among operations, legs,
and materials. Operations are indented under their associated legs,
and materials are indented under their associated operations.

The grid display shows more of the information entered in the master,
leg, operation, and material dialog boxes than the text and graphical
displays show.

Because the grid displays more information, it will take longer
to load than the text and graphical displays.

Not all columns in the Grid display table apply to all of the objects
in the table. For example, Operations do not use Part IDs, so the
Part ID column does not apply to Operations. You can choose how you
want the system to indicate that a column does not apply to a particular
object using the Grid View Display Options dialog box.

If you use the Grid display, you can export the information from
the grid into Microsoft Excel. You can also import information from
Excel into the grid display provided that your Excel spreadsheet is
formatted properly.

You can also edit information directly in the Grid display. Because
the system does not display all information related to the master
in the Grid display, you should still access the Header, Leg, Operation,
and Material Requirements dialog boxes to ensure you have completed
all pertinent information.

## Specifying Grid View Display Options

You can specify which color you would like to use for a non-applicable
column in the Grid View Display Options dialog box. You can also choose
how you would like the system to display the Detail column.

To specify grid view display options:

1. Select Options,
   Grid View Display Options.
2. Specify the following:

Non-applicable Column
Color Some columns in the Grid Display table do not apply
to every row in the table. Specify the color to use to indicate that
a column does not apply to a row. Select one option:

Use Specified Color
Select this option to use the same color for all non-applicable
columns. If you select this option, click the Color button and select
the color you would like to use. This color will be used for all non-applicable
columns regardless if the row is a header, leg, operation, or material.

Use Faded Object Color
Select this option to use a lighter shade of the color you specified
for the header, leg, operation, or material in Setting Color Preferences.
For example, if you specified that operations are blue, then cells
that dont apply to operations are a lighter shade of blue. If you
select the Use Faded Object Color option, specify a Fade Factor. The
Fade Factor indicates how much lighter the non-applicable column color
will be than the object color. The higher the number, the lighter
the shade. Enter a value from 0.1 to 0.9. Avoid using 0. If you use
0, the non-applicable color will be the same as the object color.

Tree View Detail
Select this check box if you would like the Detail column to use
a tree view. In the tree view, the system draws lines between associated
objects. The system displays the Plus and Minus buttons used to expand
and collapse the master structure directly in the Detail column. Clear
this check box if you do not want to view lines connecting the master
objects. The system displays the Plus and Minus buttons used to expand
and collapse the master structure in the first column.

## Configuring the Grid View

You can add columns related to the master to the grid view. For
example, you can add user-defined field information from the Part
record to the view.

1. Select Options,
   Grid Display Table Configuration. A
   list of available columns is displayed.
2. To include a column
   in the Grid View, select the Include
   check box. To remove a column from the Grid View, clear the Include check box.
3. Click Save.

If you add information from the Part record to the grid, note these
caveats:

* Users can view user-defined
  and specification information in the Manufacturing Window even
  if they do not have permission to view the information in Part
  Maintenance.
* If a protocol, such as http://,
  has been defined in a URL customizable user-defined field, and
  at least one part in the master contains a URL, the protocol is
  displayed in all rows that contain parts. The protocol is displayed
  even if a URL has not been defined for a particular part. See
  [Setting Up Customizable
  User Defined Fields](Using_Customizable_UDFs.md).

## Using the Grid View

The Grid View table displays most of the information found on the
header, leg, operation, and material cards. If the information is
editable in a card, you can also edit it in the Grid view. For example,
you can change the part ID associated with a material card directly
in the grid view without accessing the material card. Place the cursor
in the part ID field, double-click the part ID browse button, and
select a part from the table.

Refer to the Building Masters section for more information on editing
objects in a master.

After you make changes in a grid line, click anywhere outside the
grid line. The system prompts you to save your changes. The system
also prompts you to save your changes if you tab out of a row.

## Exporting the Grid View to Excel

You can export the master or portions of the master to Microsoft
Excel.

1. To export the entire
   master, either do not select any lines or select all lines. You
   can also send selected lines. Hold down the CTRL
   button and click the lines to export.
2. Select File,
   Send to Microsoft Excel.
3. The system launches
   Microsoft Excel and inserts the information from the Manufacturing
   Window.

You can edit the spreadsheet and import the information back into
the Manufacturing Window.

## Importing from Excel into an Existing Master in the Grid View

You can import information from a Microsoft Excel spreadsheet into
the Manufacturing Window. You can import information to an existing
master, or you can use Excel to create a new master. You can import
information from Excel, provided that the following conditions are
met:

* You are using the grid view
* The columns in the Microsoft
  Excel spreadsheet are named correctly. For example, if you rename
  the You may find it helpful to export a master from the Manufacturing
  Window first before importing information to be sure that the
  columns are named correctly.
* The information in the system
  is valid. For example, if you specified G in the Status column,
  the system would not import the information since a status of
  G does not exist in VISUAL.
* For existing masters, the
  card has no material issues or labor tickets applied against it.

To import from Excel:

1. From the Manufacturing
   Window Grid View, select File, Import from Excel.
2. Select the Excel file
   and click Open.

The system imports the information from the Excel file into the
database. The system updates any existing header, leg, operation,
or material cards you edited in the spreadsheet and creates any new
cards you added to the spreadsheet, provided that you formatted the
information correctly. The system adds any new headers, legs, operations,
or material cards you created in the spreadsheet.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Manufacturing_Window.md) User-defined Help