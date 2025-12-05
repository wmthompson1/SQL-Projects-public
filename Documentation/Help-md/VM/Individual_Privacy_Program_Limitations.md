Individual Privacy Program Limitations




# Individual Privacy Program Limitations

The Individual Privacy program searches for a data
subjects name in the FIRST\_NAME, LAST\_NAME, and NAME columns in the
tables listed in [Finding
Data Subject Information](Finding_Data_Subject_Information.htm). If a data subjects name is stored in
any other database column, you must search for and remove the data
subjects name manually.

The Individual Privacy program redacts only the data displayed in
the table in [Data Redaction](Data_Redaction.htm). No other
data is redacted.

The Individual Privacy program does not search for nor redact information
in these areas:

* Database User IDs
* Primary keys, such as employee
  IDs, customer IDs, and vendor IDs
* Data in the HISTORY\_DATA
  table
* Data in VISUAL reporting
  tables. You must manually reload the reporting tables after you
  redact data. See [Manually
  Loading Existing Data into the Reporting Database Tables](Manually_Loading_Existing_Data_into_the_Reporting_Database_Tables.htm).
* Database views
* Notations
* Specifications
* Document Attachments
* Activities
* Pictures
* User-defined fields
* Custom tables or custom
  columns in standard tables
* BOD in-box and out-box database
  tables
* Fields that could contain
  a persons name, such as Planner User ID and Buyer User ID fields
  in Part Maintenance or the Engineered By field in the Manufacturing
  Window

In addition to the areas in the above list, other areas of the VISUAL
database could contain personal information that you must search for
and redact manually.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMINDPRVWhat.htm)
What Is Individual Privacy?

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User-defined_Help_Files_-_Security.htm) User-defined Help