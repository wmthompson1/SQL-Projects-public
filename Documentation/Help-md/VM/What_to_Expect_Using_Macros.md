What to Expect Using Macros




# What to Expect Using Macros

Macros act on the data visible to the user in the
context of the program. Consider Order Entry. It has about 60 or 70
data fields on the main window, not including the line item table.
The line item table has about 40 columns of data. The Macro feature
runs on the window as a whole, seeing both the header level variables
and line level information at the same time.

Header level variables are visible to the script by name. For instance,
if the program possesses a field named "dfnORDER\_QTY" it
will be exposed to the script as "ORDER\_QTY." Each field
on the header is similarly exposed to the script.

Line data requires that the program provide a mechanism to expose
rows and columns of data. The collection of rows is visible to the
script as "LINES". Each line is one of the variables within
the collection of LINES. The line is a collection of variables, one
for each column.

Macros for the form are presented to the user on a menu entitled
Macros. The program dynamically loads this menu with the list of macros
that can be used in the program.

Use the Edit option in the Macros menu to edit existing macros and
create new macros. A list of variables available for macros in the
current window is displayed. You can select a variable from the list
or manually type the variable.

You can use a standard editor to create macros. Macros created outside
of VISUAL are available in VISUAL provided that you name and store
the file correctly. When you save your macro, use this naming convention:

[VISUAL Executable name]\_[Macro Name].vms.

For example, if you created a macro called MARKUP that you run in
Part Maintenance, you would name the macro file VMPRTMNT\_MARKUP.vms.

After you create the macro outside of VISUAL, store the macro file
in your VISUAL executable directory. If you store macros on workstations,
no further steps are needed. Your macro is displayed in the Macros
menu. If you store macros in your database, you must import the macro
into the database before you can use it. See [Storing
Macros](Storing_Macros.htm).