Specifying Database User Information on an Icon




# Specifying Database User Information on an Icon

VISUAL works in the context of a specific relational
database. It is possible for you to have more than one database. During
implementation, you may have a test or demo database, along with the
actual production one. When starting, VISUAL must have access to the
name of the database.

Additionally, you need a user name and password to gain access to
a database. These items are specific to an individual database. To
have access to two different databases, a user must have an account
in both.

When a database is created, there is always a default user that
has the privilege to add other users. See your relational database
administrator documentation for details.

You can specify database, user name, and password in the definition
of the program icon, or in the VISUAL.INI file. If you specify all
three of these items, VISUAL starts up directly, without requiring
you to go through a login dialog box. If you do not specify one or
more, the login dialog box appears and requires you to complete the
information. To specify this information in an icon, use these switches
on the command line:

-D Database Name

-U Username

-P Password

You can enter these parameters in any order. For example, to start
VISUAL with database VMFG and username JOE, you would specify this
information:

C:\Infor\VISUAL\VM.EXE -D VMFG -U JOE

The user is required to enter the password upon start-up.

You can also specify this information in the Default Login Profile
option of Application Global Maintenance.

Any specification of database, user, or password information on
the command line for the icon overrides settings in the VISUAL.ini
file.

If system security is an issue for you, you should never specify
a password in an icon or in the VISUAL.ini file. This not only allows
access to anyone with access to the machine, but also allows the password
text to be read from the file or icon.