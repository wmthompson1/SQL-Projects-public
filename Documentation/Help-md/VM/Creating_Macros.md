Creating Macros




# Creating Macros

To create a macro:

1. From an application
   that supports macros, select Macros, Edit. In the Manufacturing
   Window, click the Macro button in the header card Edit dialog
   box.
2. In the Macro Name field,
   specify the name of the macro. If you are creating a macro that
   must be manually run, you can specify any name of your choosing.
   If you are creating a macro that is automatically run based on
   an event, you must specify one of these names:

OnSave The OnSave
macro is run before the ability to save information has been validated.
For example, if the OnSave macro populates certain fields, the fields
would be populated when the user clicks Save.

OnAfterSave
The OnAfterSave macro is run after the user saves the record. For
example, if the OnAfterSave macro shows a count of records currently
in the database after that record is saved, every time the user saves
a record, the macro is run and a count of the current records is shown.

OnLoad The OnLoad
macro is run when the user opens an existing record. For example,
if external information is available for records, an OnLoad macro
might show that information when the user opens the record.

OnNew The OnNew
macro is run when the user clears the window by clicking the New toolbar
button. For example, if the OnNew macro launches another application
to record additional information, when the user clicks the New toolbar
button, the OnNew macro would launch that application.

OnDelete The
OnDelete macro is run when the ability to delete information has been
validated, but before the deletion actually occurs. For example, you
can use an OnDelete macro to summarize the information that is about
to be deleted.

OnAfterDelete
The OnAfterDelete macro is run after information has been deleted
from the database, but before the window has been cleared. For example,
you can use an OnAfterDelete macro to send an email about the deleted
record.

SaveProcess
The SaveProcess macro is used in conjunction with Performance Leadtime.
The macro is run when you save a record.

3. To add a database column
   to the script entry field, click the Available Fields arrow and
   select the column. Then, click a database column to include in
   the macro. This list contains all columns for both the header
   and line item portions of the window.
4. After you select the
   column, click the Insert button.
5. Repeat this procedure
   for each field you want to add.
6. Specify the scripting
   syntax to complete the macro.
7. Click the Save
   button. The macro is added as a menu option in the Macros menu.
   In addition, these actions are taken:

* If macros
  are stored in the database, then the macro is associated with
  your user name. If you are not the SYSADM user, then only you
  can use the macro. If you are the SYSADM user, then you can share
  the macro with others. See [Assigning
  Shared Macros to Profiles](Assigning_Shared_Macros_to_Profiles.md).
* If macros
  are stored on the workstation, then a vms file is created and
  stored in your VISUAL executable directory. The file name is built
  using the file name of the executable and the name of your macro.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](What_are_Macros_.md)
What are Macros?

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Concepts_Common_Features.md) User-defined Help