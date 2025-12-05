About the Examine Indexes Window




# About the Examine Indexes Window

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

## Starting the Examine Indexes Window

Select Admin, Examine
Indexes.

## Tasks

This table shows the tasks that you can complete in the Examine
Indexes window:

| Task | Description |
| [Analyzing Indexes](Analyzing_Indexes.htm) | Use this procedure to identify inconsistences between the indexes in your database and a master list of indexes. |
| [Repairing Indexes](Repairing_Indexes.htm) | Use this procedure to attempt to repair incorrect indexes. Ensure that the SYSADM user is the only user signed in to VISUAL when you complete this procedure. |

## Fields

System Version

The current version of VISUAL.

Database Brand and
Patch Level

The database engine that you use and the current patch level.

Database Version

The version of the database

Total
Indexes Expected

The total number of valid indexes.

Total Indexes
Found

The total number of indexes in your database.

Missing Indexes

Valid indexes that were not found in your database.

Total
Missing Indexes

 The number of missing indexes.

Additional Indexes

Indexes that were found in your database but are not in the list
of valid indexes.

Total
Additional Indexes

The number of additional indexes.

Incorrect
Indexes

Indexes that were not correctly created.

Total
Incorrect Indexes

The number of incorrect indexes.