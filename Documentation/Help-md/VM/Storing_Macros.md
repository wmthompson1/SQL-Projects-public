Storing Macros




# Storing Macros

Macros can be read from the workstation or from the
database. Use the Store Macros in Database check box on the Defaults
tab in Application Global Maintenance to determine from where macros
are read and where any new macros are stored. If the check box is
selected, then all macros are read from the database, and any macros
added after the check box is selected are stored in the database.
If the check box is cleared, then all macros are read from the workstation,
and any macros added after the check box is selected are stored on
the workstation. You cannot read certain macros from the database
and other macros from the workstation.

Macros function in the same way regardless of where they are stored.
The decision to store macros in the database or on individual workstations
depends on how your company uses macros. If your macros are specific
to users, then it may be beneficial to store the macros in the database.
When the macros are stored in the database, users can access their
macros regardless of the workstation they use to sign into VISUAL.
If your macros are specific to particular functions, and only certain
workstations are used to perform those functions, then it may be beneficial
to store the macros on the workstation. When macros are stored on
the workstation, any user who signs into the workstation can use the
macros.

A primary benefit of storing macros in the database is tighter control
over the macros a user can run. For macros stored in the database,
users can run only those macros they have created themselves and any
macros that the SYSADM user has created and assigned to them.

This table shows some of the key differences between storing macros
on work stations and storing macros in the database:

|  |  |  |
| --- | --- | --- |
|  | **Macros Stored on Work Station** | **Macros Stored in Database** |
| Who can access macros? | Any user who can sign into VISUAL on a work station can access the macros saved on the work station. | Users can access macros they created themselves or macros the SYSADM user has assigned to their profiles in Security Maintenance. |
| Are the macros portable? | Yes. You can copy and paste macros from one work station to another work station. | Yes. Since the macros are in the database, users can access their macros from any work station. |
| Can I use a User Toolbar button to launch a macro? | Yes | Yes |
| Can I share macros with other users? | Yes. You can send users your .vms files. | Yes. If the SYSADM user created the macros, the macros can be assigned to multiple users through profiles. |

If you decide to store macros on the workstation, then see these
topics:

* [Working
  with Macros Stored on the Workstation](Working_with_Macros_Stored_on_the_Workstation.htm)
* [Setting
  Up VISUAL to Store Macros on Workstations](Setting_Up_VISUAL_to_Store_Macros_on_Workstations.htm)
* [Copying
  Macros from the Database to a Workstation](Copying_Macros_from_the_Database_to_a_Workstation.htm)
* [Creating
  a User Toolbar Button for a Workstation Macro](Creating_a_User_Toolbar_Button_for_a_Workstation_Macro.htm)

If you decide to store macros in the database, then see these topics:

* [Working
  with Macros Stored in the Database](Working_with_Macros_Stored_in_the_Database.htm)
* [Setting
  Up VISUAL to Store Macros in the Database](Setting_Up_VISUAL_to_Store_Macros_in_the_Database.htm)
* [Copying
  Macros from a Workstation to the Database](Copying_Macros_from_a_Workstation_to_the_Database.htm)
* [Assigning
  Shared Macros to Profiles](Assigning_Shared_Macros_to_Profiles.htm)
* [Creating
  a User Toolbar Button for a Database Macro](Creating_a_User_Toolbar_Button_for_a_Database_Macro.htm)