Viewing Audit Results




# Viewing Audit Results

After you specify the database columns to track and
users make changes to configured columns, the Audit Maintenance window
shows the changes users have made. By default, changes made in the
last 14 days are shown.

Select Admin, Audit
Maintenance. This information is displayed:

Users table The Users table shows the
IDs of the users who have made changes to the tracked tables.

Tables table The Tables table shows
the names of the tables where changes were made. For reports, the
file name of the reports users ran is shown. The Audits columns shows
the number of tracked changes made to the table.

Results table The Results table shows
this information:

Create Date The
date the column was changed is shown.

Column The name
of the changed column is shown. For reports, the file name of the
report is shown.

Data Type The
columns data type is shown. The types are String (text), Number,
or Date.

Action For database
columns, the type of action performed on the column is shown. The
types are Update, Insert, or Delete. For reports, Audit is inserted.

Primary Key The
primary key for the record displayed in the row is shown.

Old Value For
database columns, the value of the table column prior to the change
is shown. If the row refers to a report and you have selected the
Audit Report Times and Report Audit check boxes, the start time of
the report is shown.

New Value For
database columns, the change made to the column is shown. If the row
refers to a report and you have selected the Audit Report Times and
Report Audit check boxes, the system inserts the end time of the report.