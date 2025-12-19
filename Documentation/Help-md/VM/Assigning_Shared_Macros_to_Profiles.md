Assigning Shared Macros to Profiles




# Assigning Shared Macros to Profiles

Only a user with system administrator privileges can
perform this procedure.

Any macro created by the SYSADM user can be shared with other users.
This includes any macros the SYSADM user creates after the Store Macros
in Database check box is selected in Application Global Maintenance.
This also includes any macros that the SYSADM user copied from the
workstation to the database using the Load Macros dialog. To share
SYSADM macros with other users, the macros must be assigned to Profiles
in Security Maintenance.

The SYSADM user can share macros that must be manually run and macros
that are automatically run based on an event. If the SYSADM user assigns
an automatic macro to a user through a profile, then the macro is
run when the user triggers the event. For example, if the SYSADM user
shares a Part Maintenance OnAfterSave macro with user JSMITH, the
macro is run anytime JSMITH saves a part. JSMITH cannot stop the macro
from running.

If the SYSADM user shares a macro with a user, and the user already
has macro with the name, then the users macro is used. For example,
if the SYSADM user shared a macro named NEWPART, and the user already
has a macro named NEWPART, then the users macro is used when NEWPART
is run.

Note: The SYSADM user can
have only one macro of a particular name per application. For example,
the SYSADM can have only one OnSave macro for Part Maintenance. If
you want to assign different OnSave macros in Part Maintenance to
different users, load the macros as private macros per user. See [Copying
Macros from a Workstation to the Database](Copying_Macros_from_a_Workstation_to_the_Database.md).

To assign SYSADM macros to user profiles:

1. Sign into VISUAL as
   a user with system administrator privileges.
2. Select Security,
   Profile/User/Group Security.
3. In the Security By section,
   click Profile.
4. In the Profile ID field,
   specify the profile to which you are assigning macros.
5. Click the Macros
   tab.
6. Click Insert.
7. Double-click the Macro Name browse button and select the macro
   to assign to the profile.
8. Click Save.
   Users assigned to the profile can run the macros. See [Assigning
   User Profiles to Users](Assigning_User_Profiles_to_Users.md).