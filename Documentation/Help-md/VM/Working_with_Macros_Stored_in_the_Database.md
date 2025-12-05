Working with Macros Stored in the Database




# Working with Macros Stored in the Database

When macros are stored in the database, they are saved
to the MACRO table by the user who created them. Except for macros
created by the SYSADM user, one user cannot access a macro created
by another user.

Macros created by the SYSADM user can be shared with other users.
Macros created by the SYSADM user can be assigned to other users through
profiles in Security Maintenance. The SYSADM user can assign macros
to a profile and can then assign the profile to users. After a profile
is assigned to a user, the user can execute any macros associated
with the profile.