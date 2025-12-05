What is the Examine Index Tool?




# What is the Examine Index Tool?

Use the Examine Index tool to identify differences
between the indexes found in your database and a master list of valid
indexes for a VISUAL database. The tool lists indexes that are missing
from your database, indexes that are found in your database but not
in the master list, and indexes that are incorrect. An index is incorrect
if keys in the index are missing or are in the incorrect order.

If you use Oracle as your database engine, then valid indexes could
have a different name than the anticipated name. If an index is not
named when the index is created, then Oracle generates a name for
the index. When indexes are examined, any additional indexes that
have been identified are compared to missing indexes. If the structure
of an additional index matches the structure of a missing index, both
the additional index and missing index are removed from the lists.

After you analyze indexes, you can use the Repair tool to add missing
indexes and repair incorrect indexes.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Admin_Guide.htm) User-defined Help

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMCHKIDXfrmTestIndexes.htm)
Analyzing Indexes

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Repairing_Indexes.htm)
Repairing Indexes