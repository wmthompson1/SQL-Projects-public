Adding Preferences for Individual Users




# Adding Preferences for Individual Users

You must sign in as the SYSADM user to perform this procedure.

The SYSADM user can set up preferences for individual users. To
set up a users preferences:

1. Select Admin,
   Preferences Maintenance.
2. Click the User ID drop-down
   button and select the user for whom you are setting up preferences.
3. Click the Insert
   button.
4. Double-click the Entry browse button and select an entry. The
   Entry browse lists the section of the VISUAL.ini file where the
   setting was located and the Entry text string. The Entry browse
   also lists acceptable values for each entry and a description
   of the entry and its values. Make note of the value so you can
   enter it in the Preference Maintenance table. After you select
   an entry, click Ok.

If you know the Section associated with
the entry, you can enter the section first, then click the Entry browse
button. If you enter the Section first, the browse table shows only
the entries for the section you specify.

5. In the Value column,
   specify the value for the Section and Entry. You must enter an
   acceptable value. Your entry is not validated. If you do not enter
   an acceptable value, the system may not behave in the manner you
   expect.

If the value text is red, then the preference
setting is a required default setting. You cannot change the value.

If the value text is blue, then a default
setting exists for the preference, but the default setting is not
required. The blue text indicates that the value you specified does
not match the default value. The override setting that you specified
is used for the preference.

6. Click Save.