Analyzing Data before Importation




# Analyzing Data before Importation

The Analyze Data function helps debug import files.
When you use this function, VDIU reads the tab-delimited import file
and parses the data in each record and assigns a token (placeholder
or array value) to each piece of data. VDIU aligns each piece of data
with the associated field and displays the length of each data item.
Tokens that show a 0 (zero) length indicate that VDIU found no data
even though the record does contain a <tab> as a place holder
to intentionally skip the field. Tokens that show a NULL value indicate
that the record was not complete. This is an acceptable condition
as long as all required fields are found. When VDIU analyzes data
it does NOT import it; VDIU only interprets the data.

|  |  |
| --- | --- |
| POSTIT.gif | The analyze function does not validate data or populate default information. |

1. From the File menu of
   the VISUAL Data Import Utility, select Analyze
   Input Data.
2. Using the search dialog
   box that appears, locate the text file that contains the information
   you are importing. After you have located and opened it, the text
   file appears for your review.

You can pint analysis information by clicking
the Print button.

3. Click the Ok
   button when you are finished viewing the input data.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Data_Import_Utility.htm) User-defined Help