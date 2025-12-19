Creating a User Toolbar Button for a Database Macro




# Creating a User Toolbar Button for a Database Macro

If you use User Toolbars, you can add a button that
launches a macro stored in your database. You can add toolbar buttons
only for macros you manually run. You cannot add a toolbar button
for macros that are run automatically based on an event. See [Types
of Macros](Types_of_Macros.md).

To add a user toolbar button for a database macro:

1. Select Admin,
   Toolbar Maintenance.
2. Click Insert.
3. Specify this information:

Program Name
Specify the name of the program where the macro is used.

Toolbar ID Specify
the ID of the toolbar where you are adding the macro button.

Position Specify
where on the toolbar to place the macro button. You can specify a
value from 1 to 20.

Bitmap Specify
the bitmap to use as the toolbar button.

Tool Tip Specify
the text that is displayed when you place your mouse over the toolbar
button.

Execute Command
Leave this field blank.

Execute Macro in DB
Double-click the browse button and select the macro to associate
with the toolbar. Only macros that can be run in the program specified
in the Program Name field are displayed. Select a manual macro. If
you select a macro that is automatically run based on an event, this
message is displayed when you save the toolbar: Standard macros are
not allowed.

Use Key in Cmd Line
Clear this check box.

Add Entry to Toolbar
This check box is displayed for the SYSADM user only. To share this
toolbar button with all users, select this check box. To retain this
toolbar button for the SYSADM's use only, clear this check box. If
you specified a shared macro in the Execute Macro in DB field, then
you may also want to share the toolbar button for the macro.

4. Click Save.