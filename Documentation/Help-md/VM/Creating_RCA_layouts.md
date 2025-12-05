Creating RCA layouts




# Creating RCA layouts

The 861 Purchase Order Receipt transaction is used
to send your vendors receipt information regarding purchase orders
for which have received product. In addition to the receipt fields,
typically most of the same data fields that were exported in your
VPO documents are also exported as your RCA documents.

1. From the Key/Version
   list box, select RCA and then enter a version for the layout in
   the adjacent field.
2. Select a File Type,
   Single or Multiple.

Single file -
The single file type writes all records to one file.

Multiple file
- The multiple file type writes each record type to a separate file.
Available record types for RCA are HDR, LIN, and SUB.

3. Select the appropriate
   file style from the File Style section (selection is grayed-out
   when using the layout in VMDI Exchange).

The file style refers to the format of the
data contained in the .VDI file. You can select:

Fixed This style
indicates that the data in the .VDI files will always occupy the same
"fixed" space for each field and record.

Delimited If
you select Delimited as the style, you need to define the character
that will indicate the end of a field (Asterisk, Comma, or Tab) and
the character that will indicate the end of a record (NewLine or Null).
For example, if a field in the .VDI file represents the Part ID, that
field would be 30 characters long in a Fixed file. However, in a Delimited
file, the actual Part ID would be used (no leading or trailing spaces)
and it would require a delimiter to indicate the end of the field
(an Asterisk, Comma, or Tab).

For Fields, select from Asterisk, Comma,
or Tab. Null is a special delimiter that is used to import or export
all records on their own lines. In order to use the Null field delimiter,
you MUST select the Fixed radio button and New Line record delimiter.
For Records, select from New Line and Null.

|  |  |
| --- | --- |
| POSTIT.gif | If you are creating a Null (fixed length) layout (i.e. with each record contained on its own line), choose the following settings:  File Style: Fixed  Record: Newline  Field: Null (Fixed Length) |

4. Click the Ok
   button to commit these settings.
5. Begin to define a record
   layout.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Data_Interchange.htm) User-defined Help