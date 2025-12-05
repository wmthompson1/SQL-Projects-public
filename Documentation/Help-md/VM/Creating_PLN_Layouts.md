Creating PLN Layouts




# Creating PLN Layouts

1. From the Key/Version
   list box, select PLN and then enter
   a version for the layout in the adjacent field.
2. Select a File Type,
   Single or Multiple.

Single file -
The single file type reads all records from one file. The only available
record type for used for PLN is HDR. PLN documents are imported from
single files only. No multiple file option is available.

Multiple file
- Not available for layout PLN

3. Select the appropriate
   file style from the File Style section.

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

Quantity and Cumulative
Base

If Quantity = Discrete,
then Cumulative Base is N/A.

If Quantity = Cumulative,
then Cumulative Base is either Shipped Qty or Fab (Build).

If you are importing Discrete quantities,
then the forecast quantities are imported exactly as they appear in
your .VDI file; VISUAL does not have to do any comparisons, but instead
just imports the amounts as-is.

If you are importing Cumulative quantities,
your initial forecast is compared to the values in the Our Total Shipments,
Their EDI Accum Qty, or Fab (Build) Qty. See Help documentation for
additional details on Cumulative importing.

|  |  |
| --- | --- |
| POSTIT.gif | If you are creating a Null (fixed length) layout (i.e. with each record contained on its own line), choose the following settings:  File Style: Fixed  Record: Newline  Field: Null (Fixed Length) |

4. Click the Ok
   button to commit these settings.
5. Begin to define a record
   layout.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Data_Interchange.htm) User-defined Help