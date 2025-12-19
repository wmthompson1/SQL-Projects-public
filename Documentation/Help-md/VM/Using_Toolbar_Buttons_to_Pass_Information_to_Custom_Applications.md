Using Toolbar Buttons to Pass Information to Custom Applications




# Using Toolbar Buttons to Pass Information to Custom Applications

Any information you enter into an external application launched
from your User Toolbar is not in any way attached to or saved with
the record you are viewing.

You can pass primary key information from these windows to a third-party
external program:

* Customer Maintenance
* Customer Order Entry
* Order Management Window
* Manufacturing Window
* Part Maintenance
* Purchase Order Entry
* Purchase Management Window
* Purchase Requisition Entry
* Shop Resource Maintenance
* Vendor Maintenance

For example, if you are working in Customer Maintenance, you can
set up a button on the user toolbar that opens your custom program
and sends it the Customer ID from the current customer record. The
information is sent by attaching comma-delimited keys to the command
line that launches your application. In this example, this is attached
to the command line:

VM800,SYSADM,@@@@@,FLEET,,,,,,,,,

VM800 in the database name, SYSADM is the user name, the @@@@@ is
the users encrypted password, and FLEET is the customer ID.

The entire command line is enclosed in single quotes.

You can set up your custom application to parse the information
in the command line and extract additional information from the database.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_Toolbars.md)
User Toolbars

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Displaying_User_Toolbars.md)
Activating the User Toolbar Function

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Setting_Up_User_Toolbars.md)
Setting Up User Toolbars

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Setting_Up_Toolbar_Bitmaps.md)
Setting Up Toolbar Bitmaps

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Concepts_Common_Features.md) User-defined Help