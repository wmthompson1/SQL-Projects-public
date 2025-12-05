Setting Up User Toolbars




# Setting Up User Toolbars

You can customize the buttons appearing in the toolbar
to open any application.

The toolbar is not displayed until you add at least one button to
the command list.

You can drag personal toolbars so they float over the window or
dock them to any side of a window.

To set up a user toolbar:

1. Select Admin,
   Toolbar Maintenance.
2. Click the Insert
   button.
3. Specify this information:

Program Name
Double-click the browse button and select the program where you want
to use the toolbar. To use the same toolbar buttons in multiple programs,
you must set up a separate toolbar for each program.

Toolbar ID Specify
a unique identifier for this toolbar.

Position Specify
the position number from 120 where you want to place the button.
You can add up to 20 buttons on each toolbar.

Bitmap Double-click
the browse button and select the bitmap to display for this button.
Toolbar buttons have three modes: the active mode, the inactive mode,
and the hover mode. To display properly, your bitmap must have all
three modes. See [Setting
Up Toolbar Bitmaps](Setting_Up_Toolbar_Bitmaps.htm).

ToolTip Specify
a short tip that is displayed when you hover your cursor over the
button.

4. Specify the action to
   take when the toolbar button is clicked:
5. To open a
   URL in the default browser, specify this information:

Toolbar Type Select
URL.

Execute Command
Specify the URL to open.

* To run a macro
  stored on the workstation, specify this information:

Toolbar Type Select
VMMacro.

Execute Command
Double-click the browse button and select the macro to run. Ensure
that the macro that you select can be run in the program specified
in the Program Name field. Otherwise, the macro will not be run See
[Setting
Up VISUAL to Store Macros on Workstations](Setting_Up_VISUAL_to_Store_Macros_on_Workstations.htm).

* To run a macro
  stored in the database, specify this information:

Toolbar Type Select
VMMacro.

Execute Macro in DB
Double-click the browse button and select the macro to associate
with the toolbar. Only macros that can be run in the program specified
in the Program Name field are displayed. Select a macro that you run
manually. If you select a macro that is automatically run based on
an event, such as OnAfterSave, this message is displayed when you
save the toolbar: Standard macros are not allowed. This column is
displayed only if the Store Macros in Database check box is selected
in Application Global Maintenance. See [Setting
Up VISUAL to Store Macros in the Database](Setting_Up_VISUAL_to_Store_Macros_in_the_Database.htm).

* To run a VISUAL
  executable, specify this information:

Toolbar Type Select
VMExecutable.

Execute Command
Double-click the browse button and select the VISUAL executable to
run.

* To run a query
  created in the Query Tool, specify this information:

Toolbar Type Specify
VMQuery.

Execute Command
Double-click the browse button and select the name of the query to
run.

* To open a
  third-party executable, specify this information:

Toolbar Type Specify
Other.

Execute Command
Double-click the browse button and select the executable to run.

Use Key in Cmd Line
To pass information to an external, custom program, select the Use
Key in Cmd Line check box. You can use the command line information
to populate your external program with information from the current
window. See [Using
Toolbar Buttons to Pass Information to Custom Applications](Using_Toolbar_Buttons_to_Pass_Information_to_Custom_Applications.htm).

This table shows the applications that can
pass information to an external program and the information that is
passed.

|  |  |
| --- | --- |
| **Executable** | **Information passed in command line** |
| Customer Order Entry | * Customer Order ID * Line Number of currently   selected line |
| Order Management Window | * Customer Order ID * Line Number of currently   selected line |
| Part Maintenance | * Part ID |
| Customer Maintenance | * Customer ID |
| Purchase Order Entry | * Purchase Order ID * Line Number of the   currently selected line |
| Purchase Management Window | * Purchase Order ID * Line Number of the   currently selected line |
| Manufacturing Window - Header Card | * Type * Base ID * Lot ID * Split ID * 0 |
| Manufacturing Window - Leg Card | * Type * Base ID * Lot ID * Split ID * Sub ID * Seq No * Piece No * Part ID/Space * L (indicates information   is from the Leg Card) |
| Manufacturing Window - Operation Card | * Type * Base ID * Lot ID * Split ID * Sub ID * Seq No |
| Manufacturing Window - Material Card | * Type * Base ID * Lot ID * Split ID * Sub ID * Seq No * Piece No * Part ID * M (indicates information   is from the Material Card). |
| Vendor Maintenance | * Vendor ID |
| Shop Resource Maintenance | * Shop Resource ID |

In addition to the information displayed in
the table, the user ID, password, and database name is passed to the
external executable.

5. The Add Entry to Toolbar
   check box is available for the SYSADM user only. To display this
   toolbar button on the toolbars for all VISUAL users, select the
   Add Entry to Toolbar check box.
6. Click the Save
   button.
7. After setting up your
   toolbars, click the Close button.
8. Restart VISUAL.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_Toolbars.htm)
User Toolbars

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Displaying_User_Toolbars.htm)
Activating the User Toolbar Function

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Using_Toolbar_Buttons_to_Pass_Information_to_Custom_Applications.htm) Using Toolbar Buttons to Pass Information
to Custom Executables

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Setting_Up_Toolbar_Bitmaps.htm)
Setting Up Toolbar Bitmaps

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Concepts_Common_Features.htm) User-defined Help