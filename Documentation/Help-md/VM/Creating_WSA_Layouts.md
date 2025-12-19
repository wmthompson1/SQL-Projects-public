Creating WSA Layouts




# Creating WSA Layouts

To create WSA layouts:

1. From the Key/Version
   list box, select WSA and then enter a version for the layout in
   the adjacent field.
2. Select a File Type,
   Single or Multiple.

Single file -
The single file type writes all records to one file.

Multiple file
- The multiple file type writes each record type to a separate file.
Available record types for WSA are HDR, LIN, and SUB.

3. Select the appropriate
   file style from the File Style section.

The file style refers to the format of the
data contained in the .VDI file. You can select:

Fixed - This style
indicates that the data in the .VDI files will always occupy the same
"fixed" space for each field and record.

Delimited - By
selecting this option, you are informing the Data Import Utility that
the data in the .VDI file varies in size. You also need to select
a delimiter for the end of each record and the character VISUAL should
use to separate each field in the record. Please see the detailed
description of Delimited styles in the previous section.

For Record, select from Blank, Newline,
and Null (Fixed Length).

For Field, select from Blank, Asterisk,
Comma, Tab, or Null (Fixed Length) as a delimiter.

|  |  |
| --- | --- |
| POSTIT.gif | If you are creating a Null (fixed length) layout (i.e. with each record contained on its own line), choose the following settings:  File Style: Fixed  Record: Newline  Field: Null (Fixed Length) |

4. Click the Ok
   button to commit these settings.
5. Begin to define a record
   layout.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Data_Interchange.md) User-defined Help

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Defining_Record_Layouts.md)Defining