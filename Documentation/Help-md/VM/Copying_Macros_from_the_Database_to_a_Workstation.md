Copying Macros from the Database to a Workstation




# Copying Macros from the Database to a Workstation

If you previously stored macros in the database, but
you now store macros on workstations, you can copy the macros from
the database to the workstation. When you copy macros from the database
to a workstation, the macros are not deleted from the database. While
the macros are still stored in the database, the database macros are
no longer used.

Before you begin this procedure, make sure that the Store Macros
in Database check box on the Defaults tab in Application Global Maintenance
is cleared. See [Setting
Up VISUAL to Store Macros on Workstations](Setting_Up_VISUAL_to_Store_Macros_on_Workstations.htm).

When macros are saved to the database, they are saved by user ID.
When you copy macros from the database to the workstation, only the
macros created by the currently signed in user are copied. Therefore,
to copy all macros from the database to a workstation, each user who
created macros should perform this procedure.

To copy macros from the database to a workstation:

1. On the workstation,
   sign into VISUAL.
2. Select Admin,
   Load Macros. In the title bar of the
   dialog, Copy Macros to File System is displayed. All macros currently
   on the workstation and currently stored in the database are displayed.
   An arrow is displayed in the row header of the macros that are
   going to be copied to the workstation. For each macro that is
   to be copied, this information is displayed:

File Name The
file path and file name of the new vms file is displayed.

Program The
executable file name of the VISUAL program where the macro was created
is displayed.

Name The name
of the macro is displayed.

Macro The macro
code is displayed.

3. Click Save.
   The macro files are generated and saved to the workstation. The
   macros are not removed from the database.

If other users created macros in the database that should be stored
on the workstation, these users must sign into the workstation and
perform this procedure.