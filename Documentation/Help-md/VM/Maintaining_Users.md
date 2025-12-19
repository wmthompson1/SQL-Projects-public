Maintaining Users




# Adding Users

Only a system administrator
user can perform the procedures described in this topic.

Users have access to the VISUAL database. Create a
user ID for anyone who needs to input information into the VISUAL
database.

Your license key determines the number of users you
can add. License keys can specify a number of named users or a number
of concurrent users.

If your license provides for named users, the number
of users allowed by the license is the number of User IDs you can
create in the database. For example, if your license allows for 100
named users, you can create up to 100 User IDs. If you attempted to
create a 101st User ID, you would be prevented from adding it.

If your license provides for concurrent users, the
number of users allowed by the license is the number of users that
can access the database at any one time. For example, if your concurrent
license allows for 100 users, you could create 200 User IDs, but only
100 users could be signed into the database simultaneously.

| POSTIT.gif | If you use VISUAL CRM and your VISUAL license is a named user license, then you can specify which application license is used by each user. For more information, refer to [Setting Up Users in an Integrated VISUAL and CRM Environment Using Mixed Licensing](#Setting_Up_Users_in_an_Integrated_VISUAL_and_CRM_Environment_Using_Mixed_Licensing). |

## Accessing User Maintenance

1. Sign into VISUAL using
   the system administrator account.
2. Select Security
   > Users.

You can use Users Maintenance to:

* Add users to the database
* Change a users password
* Delete a user

## Adding Users

To add a new user:

1. Select Security,
   Users.
2. Click Insert.
3. Specify this information:

User ID - Enter
an identification for the user in the User ID field. The ID can be
up to 19 characters long.

NOTE:
While the User ID field accepts up to 20 characters, you must limit
user IDs to 19 characters. When you create a User ID, a secondary
user ID is also created. This secondary user ID is used to manage
tasks such as changing the users password. The secondary user ID
is created by adding a # character to the end of the user ID. If you
specify a user ID with 20 characters, then the secondary user ID will
have 21 characters. The 21-character length can cause issues with
database triggers and other functions. Therefore, you must limit user
IDs to 19 characters. You cannot use the secondary user ID to sign
into VISUAL.

Password - Specify
the users password. See [Managing
Password Configuration](Managing_Password_Configuration.md).

Repeat Password
- Repeat the user's password.

4. The applications that
   you are licensed to use are displayed. Select the check boxes
   for the applications that the user can access.
5. Click Save.

## Changing Users Passwords

If users forget their passwords or are locked out of the system,
the system administrator can change the password on the users behalf.
Users can be locked out of the system based on how passwords are configured.

To change a users password:

1. Select Security,
   Users.
2. Select Search
   and enter user ID.
3. Click Search
   or manually find the User ID.

4. For the user whose password
   you are changing, specify this information:

Password Specify
the users password. See [Managing
Password Configuration](Managing_Password_Configuration.md).

Repeat Password
Repeat the users password.

5. Click Save.

## Prompting Users to Change Passwords

Use this procedure to prompt users to change their passwords during
their next login. Users must change their passwords when prompted.
They will not be able to sign in to VISUAL with their existing passwords.

To create a password expiration policy, use the Password Configuration
dialog. See [Managing
Password Configuration](Managing_Password_Configuration.md).

1. Select Security,
   Users.
2. Select Search
   and enter user ID.
3. Click Search
   or manually find the User ID.
4. Select the Reset
   Password check box in the rows that contain the users who
   must reset their passwords when they next sign in.
5. Click Save.

## Deleting a User

You can delete obsolete user IDs. To delete a user ID:

1. In the Users window,
   select Search and enter user ID.
2. Click Search
   or manually find the user ID and select the User
   ID you would like to delete.
3. Click Delete
   User.

The system removes the user ID from the
database.

## Setting Up Users in an Integrated VISUAL and CRM Environment Using Mixed Licensing

VISUAL uses either a concurrent license or a named user license.
CRM uses a concurrent license.

If your VISUAL license is a concurrent license, then you can import
all VISUAL User IDs into CRM. All User IDs can access both systems
until the concurrent limit is met.

If your VISUAL license is a named user license, then you can decide
which users are licensed to use VISUAL, which are licensed to use
CRM, and which are licensed to use both applications. The VISUAL named
license does not limit the number of CRM-only users that you can create
allowing you full use of your CRM concurrent license.

If a user is licensed for VISUAL only, then that user can only use
VISUAL and cannot use CRM. The user cannot sign into CRM by launching
the CRM executable or by drilling into CRM from Activities Maintenance.
A VISUAL-only user is counted against the named user license.

If a user is licensed for CRM only, then that user can only access
CRM. The user cannot use VISUAL either directly through the VISUAL
executables or by drilling into VISUAL using the CRM Back Office menu.
A CRM-only user is not counted against your VISUAL named user license.
You can create as many CRM-only users as you need.

If you specify that a user is licensed for both VISUAL and CRM,
then the user can access both applications. The user is counted against
your VISUAL named user license.

When you import users from VISUAL into CRM, you can import users
with the CRM check box selected.

You can specify application licensing usage when you create the
user or update existing users.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User-defined_Help_Files_-_Security.md) User-defined Help