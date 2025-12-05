Creating CSH Layouts




# Creating CSH Layouts

1. From the Key/Version
   list box, select CSH and then enter
   a version for the layout in the adjacent field.
2. Select a File Type,
   Single or Multiple.

Single file - The single file type reads
all records from one file. Available record types for CSH are HDR,
and LIN. CSH documents are imported from Single files only; no Multiple
file option is available.

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

4. From the Options men,
   select Special Settings or click the Special Settings button on
   the main toolbar

The Special Settings dialog box appears.
The CSH tab has the default position. You cannot select the other
two tabs.

5. Select the appropriate
   search option:

Search Invoices Based on...

Invoice ID - VISUAL
searches invoices based on Invoice ID

Pack-list ID -
VISUAL searches invoices based on Pack-list ID

BOL ID - VISUAL
searches invoices based on BOL ID

ASN ID - VISUAL
searches invoices based on ASN ID.

6. Click the Ok
   button to commit these settings.
7. When you are importing
   inbound Cash Receipts (Key = CSH), your data is stored in Temporary
   Cash Tables. When you then run the Cash Applications Processor,
   your data is imported from the Temporary Cash Tables into the
   VISUAL database. The Temporary Cash Tables can become quite large
   over time, so this button allows you to delete them. The next
   time you do a CSH import, new Temporary Cash Tables will be created
   automatically.

See [Importing
CSH Transactions](Importing_CSH_Cash_Receipts_Transactions.htm) for more information.

8. Begin to define a record
   layout.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Data_Interchange.htm) User-defined Help