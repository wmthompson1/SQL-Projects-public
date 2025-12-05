Removing the DBR Scheduling Service




# Removing the DBR Scheduling Service

To remove the service for a site:

1. In your VISUAL executables
   directory, locate VMDBRSVC.EXE.
2. Right-click VMDBRSVC.EXE
   and select Run as Administrator. The
   Sign In dialog is displayed.
3. Specify this information:

User ID Specify
the user ID that the service uses to sign into the VISUAL database.
This can be any valid VISUAL user ID.

Password Specify
the password associated with the user ID.

Database Specify
the database on which to run the service.

4. Click Sign
   In.
5. In the Site ID field,
   specify the ID of the site where you no longer want to run the
   scheduling service.
6. Click Remove
   Service. None of the site's schedules will be run with
   the Scheduling Service. You must generate the site's schedules
   manually in the DBR Scheduler window.