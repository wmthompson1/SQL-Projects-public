Customizing VISUAL Windows




# Customizing VISUAL Windows

Using Gupta Technologies Team Developer Object Nationalizer,
you can create and modify screen overlays for most of your VISUAL
windows. When you start a VISUAL program, VISUAL checks for the existence
of an overlay for that program. If VISUAL detects an overlay, it starts
the program with the overlay.

By developing custom overlays for your VISUAL windows, you can change
windows to better fit your needs or the needs of specific departments
within your company. For example, if you are working in the Customer
Maintenance window and do not want your employees to be able to view
customer credit amounts, you could create an overlay that hides the
credit amount and any other field you see fit to hide.

## Creating Screen Overlays

Before you can use an overlay you must use Guptas
Object Nationalizer version 4.0 or later to create the .txt overlay
file. After you have created the .txt file you can use any standard
text editor to make further changes.

| POSTIT.gif | If you use the Edit Windows dialog to open the Object Nationalizer and make changes, the Object Nationalizer will create a new .txt overlay overwriting the previous one or a new overlay with a different name, which VISUAL cannot use: the .txt file name must be the same as the VISUAL program name. |

To create screen overlays:

1. From the Admin menu
   of VISUAL main window, select the Window Editor
   option.

The Edit Windows dialog box appears populated
with all of the VISUAL windows eligible for editing.

The windows you have already edited appear
with the Modified check box selected.

2. Select the VISUAL window
   for which you want to create an overlay and click the Ok
   button.

The name of the VISUAL program for which
you are creating an overlay appears in the title bar.

3. Make the changes you
   want to the window and select the Save As
   option from the File menu. Save your overlay as text (.txt) file
   using the same name as the VISUAL program. For example, if you
   created an overlay for VMPRTMNT.exe, save the overlay file as
   VMPRTMNT.txt in the same directory as your programs.

Because your original VISUAL program will
be overwritten, do NOT save your changes using an executable (.exe)
file extension.

Depending on the speed of your computer
and the VISUAL program for which you are creating an overlay file,
the conversion and save process may take up to one hour.

4. When you have finished
   saving your overlay file, close the Object Nationalizer.
5. If you have not already
   done so, close the Edit Windows dialog box.

The next time you open the Edit Windows
dialog box, the overlay you created appears with a selected check
box.

## Modifying Overlays Using a Text Editor

Because overlay files are text based files, of you have created
the initial overlay file using Guptas Object Nationalizer, you can
use any text based editor to modify your overlays.

To modify overlays:

1. Using a text editor,
   open your .txt overlay file.

A notice appears at the top of the .txt
file informing you that you must not edit anything outside the curly
brackets { }.

2. Make the changes you
   want.
3. Save the text file.

|  |  |
| --- | --- |
| POSTIT.gif | Because you can render the .txt overlay file unusable, when modifying your overlay files in a text editor, do NOT edit anything outside of the curly brackets { }. |

For more information regarding Gupta Technologies products, refer
to your Gupta documentation.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Admin_Guide.md) User-defined Help