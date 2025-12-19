Exporting Formats




# Creating Export Formats

Use the Export Formats dialog box to edit and create
new export format field definitions.

1. Select Admin,
   Application Global Maintenance.
2. Select Maintain,
   Export Formats.
3. From the Type list box,
   select a format: ESL, Intrastat, Payment, Payment/XML, or VAT.
   For more specific information on creating a Payment/XML format,
   refer to Creating XML Payment Export Formats.
4. Either enter a new Export
   ID in the Export ID field or select one from the list box.
5. Select a Context: File
   Footer, File Header, Header, or Line Item.
6. Click the Insert
   button to begin adding format definition information in the line
   item table.

The following columns appear in the line
item table:

Start At - The
starting position in the data for this field. Zero is the first byte.
Use this to sequence the data fields.

Abut Previous
- The starting position in the data for this field is one byte after
the last byte of the previous field. Select the check box that appears.

Data Expression
- You may specify any legal SQLWindows (SAL) expression. The exporter
requires the data type returned to be type String.

Supported Expression
- A "Y" appears in this column if the SQLWindows expression
you entered in the Data Expression column is a supported expression.

Data Length -
Length of data in bytes not including quotes and commas. Used this
only when expression refers to the data variable directly, without
conversion.

Data Type - Supported
types are: "C" - character; "N" - number (decimal);
"D," - date; "T," - time; and "I," -
integer. Use this only when expression refers to the data variable
directly, without conversion.

Data Scale - Scale
of decimal number type. Use only for this type and when expression
refers to the data variable directly, without conversion.

Quote Data - If
you select "D," VISUAL double quotes the data before it
places it in the record. In effect, this makes the data two characters
longer. If you select "S," VISUAL single quotes the data.
If you select "X," VISUAL adds no quotes.

Comma Separate
- If you select this check box, VISUAL adds a comma separator after
the data field, if it is not the last data field in the record.

Field Delimiter
- The character that groups or separates items in the command. Enter
a delimiter here.

Terminate Record
- If you select this check box, VISUAL adds a CRLF (0x0d, 0x0a) after
this field, if it is not the last data field in the record. Note,
however, that the last data field in the record is automatically followed
by CRLF. The prior rule prevents two consecutive record terminators.

6. Click the Save
   button to save export format information.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Application_Global_Maintenance.md) User-defined Help