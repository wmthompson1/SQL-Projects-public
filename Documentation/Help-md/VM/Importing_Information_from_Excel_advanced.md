Importing Information from Excel inth the Advanced Browse Table




# Importing Information from Excel into the Advanced Browse Table

Use the Import from Excel option to import data from
an Excel spreadsheet into your database. You can use the Import from
Excel feature to edit existing records or add new records to your
database. You cannot use the Import from Excel to delete records from
your database.

You can import information only if all of the following are true:

* You are not searching for
  data (the Filter icon is not displayed in the top left corner
  of the table).
* You have authority to edit
  the table. The system administrator controls access to the editing
  function.
* The browse table you are
  viewing is the primary data for the window (for example, if you
  are working in Part Maintenance, you must be viewing the Part
  ID browse).

Your Microsoft Excel spreadsheet must be set up in a specific way.
The first row in the spreadsheet must contain either the column titles
corresponding to the browse table you are viewing or the column names
as they appear in the database. The system imports data from the spreadsheet
until it encounters a blank row. When the system encounters a blank
row, it stops importing data.

You may find it useful to first export information from the browse
table to Excel. This will help you set up your Excel spreadsheet properly.

To import the information:

1. Access the appropriate
   advanced browse dialog.
2. Click Import
   from Excel. If you exported information to Excel during
   your current browse session and still have the spreadsheet open,
   the system imports data from your open spreadsheet. Otherwise,
   the system prompts you for a file name.
3. After the information
   is imported, the Open for Edits function is activated. Review
   the information you imported and make any necessary changes.
4. Click File,
   Save. The system begins validating and
   saving the data. If any invalid data is encountered, such as a
   status value that does not exist in the database, an error message
   is displayed and processing is stopped. Correct the error, then
   click Save to continue committing the information to your database.