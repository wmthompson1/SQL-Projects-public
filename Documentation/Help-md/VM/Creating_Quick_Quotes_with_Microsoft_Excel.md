Creating Quick Quotes with Microsoft Excel




# Creating Quick Quotes with Microsoft Excel

You can use Microsoft Excel to build a Quick Quote.

To successfully import a quote, the Excel spreadsheet must meet
this criteria:

* The quote must be a single-level
  quote. The quote cannot contain legs.
* The Excel spreadsheet must
  contain column for W/O Sub ID, Part ID, Seq No, and Piece No.
  If these columns are missing, the spreadsheet cannot be imported.
  You can include other columns from the Quick Quote dialog.
* Column names in the Excel
  spreadsheet must match exactly the column names in the Quick Quote
  tables. The spelling and the case must match. To ensure that columns
  are named correctly, you may find it useful to use the Send to
  Microsoft Excel function.

You can add Quantities quoted, Prices quoted, and Pieces to the
spreadsheet. The information will be imported to the line item table
in the main Estimating Window.

After you build the quote in Excel, you can import it into the Quick
Quote window using the Copy From function.

To build a Quick Quote with Microsoft Excel:

1. Select Sales,
   Estimating Window.
2. Click Insert
   Line.
3. Specify the part that
   you are quoting.
4. In the Quantities quoted
   field, specify at least one quantity. You can override this quantity
   when you import the Excel quote into Quick Quote.
5. In the Cost From column,
   specify either Quote Master or Engineering Master.
6. Click Save.
7. Select the line, and
   then select Edit, Quick
   Quote.
8. Optionally, click the
   Send to Excel button.
   When you click the Send to Excel button, an Excel file with a
   row for the quote header is created. All available columns in
   the Quick Quote dialog are also created.
9. Optionally, add columns
   for Quantities quoted, Prices quoted, and Pieces to the spreadsheet.
   Specify quantities and prices on the row that was created for
   the header row. Use the Quantities quoted and Prices quoted columns
   to prepare quotes for parts that are not piece tracked. Use the
   Pieces and Quantities quoted columns to prepare quotes for piece-tracked
   parts. If you are quoting multiple quantities, separate the values
   with a semicolon (;). Do not include spaces between the values.

For example, to specify quote quantities
of 5, 10 and 15, you would specify 5;10;15.

10. Complete the quote in
    Excel.
11. In Quick Quote, click
    the Copy From button.
12. In the Type section,
    click Excel.
13. Click the File Name
    browse button and navigate to the Excel spreadsheet.
14. Click Ok.

Information from the spreadsheet is imported into Quick Quote. If
you specified quantities quoted, prices quoted, or pieces, the information
is imported into the line item table in the Estimating Window.

The spreadsheet is attached to the quote as a document attachment.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Estimating_Window.htm) User-defined Help