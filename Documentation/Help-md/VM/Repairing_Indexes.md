Repairing Indexes




# Repairing Indexes

Before you perform this procedure, ensure that only
the SYSADM user is signed into the database.

1. Select Admin,
   Examine Indexes. The current version
   of VISUAL, the database brand and patch level, and the database
   version are displayed.
2. Click the Run
   button.
3. Click the Repair
   button. The tool attempts to add missing indexes to your database.
   It also drops incorrect indexes and recreates them. If a missing
   or incorrect index was not repaired, information about the index
   is written to the VMCHKIDX\_ERROR.LOG. This log file is located
   in the same directory as your VISUAL executables.

If you use Oracle as your database engine,
then indexes could be created with incorrect names. If an index does
not have a name, then Oracle then generates a name for the index.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Admin_Guide.md) User-defined Help

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMCHKIDXfrmTestIndexes.md)
Analyzing Indexes