Activating Single Sign On




# Activating Single Sign On

When you set up single sign on, the credentials that
users specify to log on to their domain are also used to sign in VISUAL.
Users do not need to specify separate credentials to sign in VISUAL.

When you enable single sign on for a database, it is enabled for
all users.

To use single sign on, the users VISUAL user ID and password must
match the users domain user ID and password.

When single sign on is enabled, the Sign In dialog box is never
displayed.

To set up single sign on:

1. Log into the domain.
2. Launch VISUAL.
3. Sign in as SYSADM.
4. Select Security,
   Single Sign On Maintenance.
5. To enable single sign
   on, select the Single Sign On Enabled
   check box.

In the Current Windows Domain field, the
name of the domain you are signed into is displayed.

6. Optionally, specify
   a VISUAL user group. If you set up a user group for VISUAL users
   on the domain, specify the group name in this field. If you specify
   a value in this field, the user must be a member of the group
   to log into VISUAL.
7. In the SSIDs and User
   IDs table, all current VISUAL database users are displayed. To
   activate a user, click the appropriate row, then click Activate
   User. The users current domain name, Windows user SID, domain
   user SID are displayed. If you specified a VISUAL User Group and
   this user is a member of the group, the Visual User Group SID
   is also displayed.

If you do not activate a user, the user
must sign in to VISUAL manually.

8. Click Save.