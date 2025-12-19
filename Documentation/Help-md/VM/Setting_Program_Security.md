Setting Program Security




# Setting Information on the Program Security Tab

Use the Program Security tab to set permissions on
individual applications. You can give users full access, read-only
access, or deny access to the program. In some cases, you can grant
or deny access to individual program components, such as tabs and
menu functions. In other cases, you can grant full access or read-only
access to certain program fields.

To specify program security settings:

1. Verify that the correct
   User ID is displayed in the User ID field.
2. Click the Program
   Security tab.
3. Specify which executables
   you would like the user to access. The system provides the name
   of the application as it appears in the VISUAL menus and the program
   ID of the application. The program ID is the actual file name
   of the executable. In the Access column for each program ID, specify
   one of the following:

Yes The user
has full access to the executable, unless you have limited access
to the executables components or field.

Read Only The
user can view information in the executable, but cannot create new
records or edit existing records.

No The user
has no access to the executable.

4. You can set Profile
   String options for the Manufacturing Window, Purchase Order Entry,
   and Purchase Requisition Entry. When you select one of these programs
   in the Program Security table, the system activates the Set Profile
   options button. Click the Set Profile Options button to set up
   the following:

Manufacturing Window
The Manufacturing Window executable controls three separate functions:the
Quotes, Work Orders, and Engineering Masters. You can choose
which of these functions the user can access. Click the arrow and
select Yes, Read Only, or No.

If you specify the same setting for all
three functions, the system changes the Access column to match.

Purchase Order Entry
You can specify a ceiling amount for the user. The user will not
be able to save a purchase order if the total of the purchase order
exceeds the limit you set for the user.

Purchase Requisition
Entry You can specify a ceiling amount for the user. The
user will not be able to save a purchase requisition if the total
of the purchase order exceeds the limit you set for the user.

5. If the Component column
   contains Yes or No, you can control access to specific program
   components such as tabs and menu functions. If the Component column
   contains Yes, then the default component settings have been
   changed. If the Component column contains No, then the default
   component settings have not been changed. For more information
   on the program components for which you can define security settings,
   refer to [Program
   Component Security Settings](Program_Component_Security_Settings.md).
6. If the Field column
   contains Yes or No, you can control access to specific program
   fields. If the Field column contains Yes, then the default field
   settings have been changed. If the Field column contains No,
   then the default field settings have not been changed. For more
   information on the program fields for which you can define security
   settings, refer to [Program
   Field Security Settings](Program_Field_Security_Settings.md).
7. When you are finished
   defining security settings, click Save.

The changes to application user permissions
take effect the next time the user opens the program to which you
have changed that users permission. For example, if you have changed
permissions for user Bob for Part Maintenance and Bob has Part Maintenance
open, those permissions do not take effect until Bob closes Part Maintenance
and starts it again.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User-defined_Help_Files_-_Security.md) User-defined Help