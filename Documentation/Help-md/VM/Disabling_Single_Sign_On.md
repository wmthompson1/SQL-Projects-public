Disabling Single Sign On




# Disabling Single Sign On

To disable single sign on, you must sign in as the SYSADM user as
described in [Logging
on as SYSADM when Single Sign On Is Enabled](Logging_on_as_SYSADM_When_Single_Sign_On_Is_Enabled.md). After you sign in
as SYSADM, select Security, Single Sign On Maintenance. Clear the
Single Sign On Enabled check box.

After you disable single sign on in VISUAL, disable the feature
on each client. Depending on how you set up the client, do one of
these tasks:

* Remove the -SSO argument
  from the shortcut.
* Remove the SingleSignOn=Y
  entry from the VISUAL.ini file, or set the value to N.

After you disable Single Sign On, users must supply credentials
to sign into VISUAL.