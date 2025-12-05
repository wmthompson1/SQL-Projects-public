Creating Security Profiles




# Creating Security Profiles

You can create security profiles to act as templates. You can use
these templates to streamline the permissions setting process.

If you store macros in your database, you can also assign macros
created by the SYSADM user to security profiles. See [What
are Macros?](What_are_Macros_.htm).

You can use profiles in two ways. You can assign the profile to
the user, or you can copy the profile settings to a user.

When you assign a profile, the user inherits the profile settings,
including macros. The settings are not copied to the user's security
record. Therefore, when you view a user's security record, the system
does not display the security settings that the user inherited from
the profile. If you change a profile after you assign it to a user,
the user inherits the changes you make.

When you assign multiple profiles to a user, the system applies
security settings cumulatively. For menu security and program security,
the most restrictive settings are applied. For example, say you assigned
Profile 1 and Profile 2 to a user. Profile 1 denies access to the
Inventory menu but grants access to all other menus; Profile 2 denies
access to the Engineering menu but grants access to all other menus.
The user would not have access to either the Inventory menu or the
Engineering menu.

For statuses and macros, the least restrictive settings are applied.
For example, say you assigned Profile 1 and Profile 2 to a user. Profile
1 grants users the ability to use the Closed purchase order status,
but denies permission to all other statuses. Profile 2 grants users
the ability to use the Released status, but denies permission to all
other statuses. The user would be able to use both the Closed and
Released purchase order settings.

When you copy a profile to a user, the user inherits all of the
profile settings except for the macro settings. The Status, ECN Status,
Menu Security, and Program Security settings are transferred from
the profile to the user's security record. Any subsequent changes
you make to the profile are not applied to the user. If you use profiles
to assign macros to users, you must assign the profile to the user.
If you copy the profile to a user, the user will not have access to
the macros associated with the profile.

The process for setting up profiles is similar to the processes
for setting up individual users. To create a security profile:

1. Select Security,
   Profile/User/Group Security.
2. In the Security by section,
   select Profile.
3. In the Profile ID field,
   specify an ID for the profile. Specify a description for the profile
   in the field to the right of the Profile ID field.
4. Click the Language
   drop-down field and select the language that the profile uses.
5. Click the Status
   tab and specify settings for each document type. For more information,
   refer to [Setting
   Information on Status Tabs](Setting_Information_on_Status_Tabs.htm).
6. Click the ECN
   Status tab and specify settings for ECNs. For more information,
   refer to [Setting
   Information on Status Tabs](Setting_Information_on_Status_Tabs.htm).
7. Click the Menu
   Security tab and specify which menus users with the profile
   can access. For more information on setting menu security, refer
   to [Setting Information on
   the Menu Security Tab](Setting_Menu_Security.htm).
8. Click the Program
   Security tab and specify security settings for each program.
   For more information on setting program security, refer to [Setting Information on the
   Program Security Tab.](Setting_Program_Security.htm)
9. The Macros tab is available
   only If you store macros in the database. Click the Macros tab
   to associate macros with this profile. You can specify any macro
   created by the SYSADM user. To specify macros:

   1. Click Insert.
   2. Double-click the browse button
      and select the macro.
   3. Click Ok.
10. Click Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Assigning_User_Profiles_to_Users.htm) Assigning User Profiles to Users

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User-defined_Help_Files_-_Security.htm) User-defined Help