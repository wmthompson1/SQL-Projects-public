Defining Record Layouts




# Defining Record Layouts

On the bottom half of the Generate VMDI Layouts window
there are five tabs: Header Tables, Header Special Details, Line Item
Tables, Sub Line Item Tables, and Adt Line Item Tables.

Each tab represents a record type in the layout. Not all tabs are
used in each layout. If a tab or record type is not relevant to a
key type, no tables appear when you select the tab.

Each tab also displays a list of default tables that contain the
most appropriate fields for the selected key. Usually, all of the
fields you want to access are available by default. If not, you can
"join" additional tables to the ones displayed.

1. Select a tab to start
   defining a record layout.
2. Click the Data
   button to select data elements for the record type you are defining.
   (There is a Data button below each list of tables.)

The Select Data Elements dialog box appears.

The dialog box shows all of the available
columns of the tables for that record type. The table displays the
table name (or view), the column or field name, the data type, the
position in the .VDI file record, the length of the field, the scale
(number of decimal places) and whether the inbound data may be null
for this column.

3. Select Print,
   View, File,
   or E-mail and click the Print
   button if you want to print, view, or send the data elements you
   have selected thus far.

Because this information is taken directly
from the database catalog, the data fields must already be defined
in the schema. If you intend to import user-defined columns and/or
tables, these columns and tables must be added to the database prior
to using the Generate VMDI Layouts window.

See [Joining
Tables](Joining_Tables.md) for more information

When you first define a new layout, the
default tables appear. These tables are mandatory. You can remove
the columns from a layout, but the table itself is not removable.

If one or more data elements that you require
is not displayed in the default tables, you can add the tables that
store those fields to the end of an existing table list. Any user-defined
or custom tables should have primary keys defined so that the join
process can find the primary key automatically.

If you join additional tables to a tab,
the mandatory tables appear first in the table lists, followed by
each table you added.

4. To include a column
   as part of the .VDI layout, highlight the appropriate column and
   click the Select button.

The x in the row header disappears and the
position of the data element in the record appears in the Pos column.
This position is only accurate if the File Style of the layout is
Fixed; VISUAL updates the position any time you select or deselect
an element.

The sequence in which the columns appear
in the table window is the same sequence they will appear in the .VDI
file layouts for each record. This sequence is critical because the
.VDI files will be created or read by an external application, most
likely an EDI mapping tool. The use of an external application needs
to be designed around the .VDI layout.

5. Once you define the
   record layouts for each tab you want to use, click Ok.

You return to the Generate VMDI Layouts
window.

6. Click Save.

VMDI import and export data is placed in
files having predefined names. The only user-defined portion of the
file-naming is the directory in which they reside. Thus, when importing
or exporting is done, the program always looks for or creates the
same files in a user-defined place.

If you want to keep multiple versions of
the files (i.e., archive each imported or exported file) then you  must
do this outside of the VMDI mechanism.

.VDI files are named for their layout key
target and layout version.

For multiple files format, there may be
up to five files, for each tab used in the Generate Layout window.
Each file has a suffix indicating its contents:

ASN9999H.VDI Header
(HDR) records

ASN9999D.VDI Header
Special Detail (SDL) records

ASN9999L.VDI Line
Item (LIN) records

ASN9999S.VDI Subline
records (SUB) records

ASN9999A.VDI Additional
Line Item records (ASL) records

Note: Where 9999
is the layout version.

Single file formats:

XXX9999.VDI Contains HDR and LIN records

Note: Where XXX
is the layout key and 9999 is the layout version.

See [Including
Trace IDs when exporting ASN data](Including_Trace_IDs_when_exporting_ASN_data.md) for more information about exporting
Trace.

All tables where XXX is the layout key (CPO,
CSH, ACK, ASN, PLN, INV, RCA, VPO), and 9999 is the layout version.
H indicates the file contains header records, L indicates it contains
line item records, S indicates it contains subline item records, no
trailing letter indicates it contains all types. .VDI is the file
type.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Data_Interchange.md) User-defined Help