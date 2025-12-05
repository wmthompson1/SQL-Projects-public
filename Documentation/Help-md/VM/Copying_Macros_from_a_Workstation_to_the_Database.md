Copying Macros from a Workstation to the Database




# Copying Macros from a Workstation to the Database

If you previously stored macros on a workstation,
but you now store macros in the database, you can copy the macros
from the workstation to the database. When you copy macros from the
workstation to the database, the macro files are not deleted from
the workstation. While the macro files are still stored on the workstation,
the workstation macros are no longer used.

Before you begin this procedure, make sure that the Store Macros
in Database check box on the Defaults tab in Application Global Maintenance
is selected. See [Setting
Up VISUAL to Store Macros in the Database](Setting_Up_VISUAL_to_Store_Macros_in_the_Database.htm).

When you copy macros from a workstation, the macros are associated
with the user who is signed in. For example, if you sign in as user
JSMITH and then copy macros into the database, then all the macros
are associated with JSMITH. Only JSMITH can run the macros. If you
sign in as user SYSADM and then copy macros into the database, then
the macros are associated with SYSADM, but the SYSADM user can share
the macros with others in Security Maintenance.

Before you copy macros into your database, we recommend that you
evaluate who should use the macros. If the macros currently stored
on the workstation should be available to all users, then the SYSADM
user should copy the macros into the database. If the macros currently
stored on the workstation are private macros intended for use by a
particular user, then that user should copy the macros into the database.
If some of the macros should be shared and others are private, then
we recommend using this process to load macros into the database:

1. Remove any private macros
   from the VISUAL executable directory and store them in another
   location. Leave the shared macros in the VISUAL executable directory.
2. Sign in as the SYSADM
   user and load the shared macros into the database.
3. Remove the shared macros
   from the VISUAL executable directory and store them in another
   location. Restore the private macros to the VISUAL executable
   directory.
4. Sign is as the user
   who owns the private macros and load them into the database.

To copy macros from a workstation to the database:

1. On the workstation,
   sign into VISUAL as the user who owns the macros.
2. Select Admin,
   Load Macros. In the title bar of the
   dialog, Copy Macros to Database is displayed. All macros currently
   on the workstation and currently stored in the database are displayed.
   An arrow is displayed in the row header of the macros that are
   going to be copied to the database. For each macro that is to
   be copied, this information is displayed:

File Name The
name of the current vms file is displayed.

Program The
executable file name of the VISUAL program where the macro was created
is displayed.

Name The name
of the macro is displayed.

Macro The macro
code is displayed.

3. Click Save.
   The macro files are generated and saved to the workstation.