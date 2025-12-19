Update Database Statistics




# Update Database Statistics

This function should be selected on a periodic basis
to allow the database manager an opportunity to update its own statistics
about the database. Only SYSADM has permission to execute this option.

SQLBase needs to know certain characteristics about your database
in order to select the most efficient way to query your data. Rather
than maintaining these statistics all the time, SQLBase requires an
authorized user to perform this update manually. This significantly
improves performance since statistics are time-consuming to obtain.

During implementation you should execute this option at least once
a day if you are adding large amounts of data to the system. Thereafter,
execute this option AT LEAST weekly. You may be advised to run this
program on a daily basis in order to improve system performance.

You can expect this program to run anywhere between 5 and 30 minutes,
depending upon the size of your database.

To begin, select Update Database Statistics
from the Admin menu.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Admin_Guide.md) User-defined Help