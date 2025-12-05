Setting Report Format File Overrides




# Setting Report Format File Overrides

To customize reports using report format file overrides:

1. Select Admin,
   Application Global Maintenance.
2. Select Maintain,
   Report Format File Overrides.
3. Click Insert.
4. Specify this information:

Standard QRP filename
Double-click the browse button and select the standard QRP file
to override. To determine the standard QRP file name, run the report
using the View output option. The file name of the QRP is displayed
in the title bar.

Context Specify
when the override should be used. Click one of these options:

User If the override
is specific to a single user, click this option. When you click this
option, the User ID field is displayed. Specify the User ID in the
field. After you save the override row, User ID: plus the name of
the user you specified in inserted in the Context column.

When you specify a user override for a particular
report file, the override is always used for the user, even if you
have also specified an override with any other context.

Site If you are
licensed to use multiple sites, click this option if the override
applies to a particular site. When you click this option, the Site
ID field is displayed. Specify the Site ID in the Site field. After
you save the override row, Site: plus the name of the Site you specified
is inserted in the Context column.

When you specify a site override for a particular
report file, the override applies when the site is used, unless you
have defined a user-specific override for the same file.

Entity If you are
licensed to use multiple entities, click this option if the override
applies to a particular accounting entity. When you click this option,
the Entity ID field is displayed. Specify the Accounting Entity in
the Entity field. After you save the override row, Entity: plus the
name of the Accounting Entity you specified is inserted in the Context
column.

When you specify an entity override for a particular
report file, the override applies when the accounting entity is used,
unless you have defined a user-specific or site-specific override
for the same file.

Always If you click
the Always context, the override you specify is always used, unless
you have specified a user override, site override, or entity override
for the same report file.

Overriding QRP Filename
Double-click the browse button and navigate to the override file.

If the file you specify does not exist,
you are prompted to create the new file by copying the standard file.
It is recommended that you always customize a report template by copying
the original and then modifying it. The original report file contains
the definition of all the inputs and report sections. Recreating this
information can be tedious.

You can store your override files in the
same directory as your VISUAL executables, but you may find it easier
to manage your override files if they are stored in a separate directory.

While the standard file is only referenced
by name, you must specify the full directory path to the override
file, including the .qrp extension.

Description
Specify a description of the override.

5. Click Save.

## Adding an Extended Query

You can use extended queries to add information from the database
to your customized reports.

1. Select the report in
   the table.
2. Click Add
   Extended.
3. Enter a SQL statement
   in the multi-line text field.

You need to create a SQL statement to retrieve
the data. For example, the following SQL statement will select the
information stored in the column BACKFLUSH\_WHS\_ID in the Part table:

SELECT BACKFLUSH\_WHS\_ID FROM PART WHERE
PART.ID=:PART ID

Notice the period (.) between PART and ID
and the colon (:) after the equal sign (=). Syntax is important when
entering SQL statements; be careful when entering them.

4. In the Destination variables
   section, specify this information:

Name Specify
the name of the variable.

Type Click the
Type drop-down box and select the type of data. You can select String,
Date/Time, or Number.

5. Click Add
   to List.
6. Click Ok.

## Comparing a Customized Report to a Standard Report

You can compare a customized report to a standard report to view
changes made to the report inputs.

To compare reports:

1. Select the report row
   in the table.
2. Click Compare.

The dialog box shows the differences between
the inputs for the standard report and the customized report. To restore
all customized data input to the standard, click Match to Standard.

3. Click Close.