Turning on Trust




# Turning on Trust

This information applies to SQL Server users only.
This information does not apply to Oracle users.

In SQL Server databases, foreign keys and column constraints can
be disabled, enabled, and trusted. If a foreign key or column constraint
is enabled but not trusted, new data is validated, but any indexes
that may be built will not be used. This can have a significant performance
impact. Using indexes is generally faster than scanning a database
table.

If you converted your VISUAL database to 8.x.x or later from an
earlier version of VISUAL, foreign keys and column constraints are
re-enabled and set to trusted if possible during the upgrade. If bad
data exists in foreign key columns or column constraints, then trust
cannot be enabled for the columns. If bad data is encountered during
the upgrade process, the name of the table and column with the bad
data is written to the vmcvtutl.log file.

After you correct the data issues, you can enable trust for any
columns that had bad data. To turn on trust:

1. In your VISUAL executable
   directory, launch VMCVTUTL.exe.
2. In the Database Engine
   section, click SQL Server.
3. Specify this information:

Database Specify
the name of your VISUAL database.

SA Password
Specify the password you use for the SQL Server sa user.

4. Click Turn
   on Trust.