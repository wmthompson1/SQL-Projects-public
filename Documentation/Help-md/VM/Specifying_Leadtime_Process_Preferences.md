Specifying Leadtime Process Preferences




# Specifying Leadtime Process Preferences

It is highly recommended that you set up the leadtime process preference
at the tenant level. While it is possible to set up the leadtime process
preference at the user level, doing so can result in unpredictable
leadtime results.

You must have system administrator privileges to perform this procedure.

In Preferences Maintenance, specify whether to use built-in functionality
to create leadtime process steps.

1. Select Admin,
   Preferences Maintenance.
2. In the User ID field,
   select \*\*Tenant\*\*.
3. Specify this information:

Section Visual
Mfg

Entry UpdateProcessActivity

Value Specify
Y to use built-in functionality. If you
specify Y, the built-in functionality is always used. You can use
macros in addition to the built-in functionality. Specify N
to use only macros.

4. Click the Save button.