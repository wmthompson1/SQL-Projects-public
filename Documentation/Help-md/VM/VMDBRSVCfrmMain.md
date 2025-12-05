Installing the DBR Scheduler Service




# Installing the DBR Scheduling Service

The DBR Scheduling Service is installed by site. If you have multiple
sites, install the service for each site whose DBR schedules you would
like to run with the service.

The computer where you install a service must have these components
installed:

* VSRVANY.EXE
  VSRVANY.EXE is a VISUAL tool that allows the service executables
  to be run as a service. VSRVANY.EXE must be installed in the same
  directory as the service executables. VSRVANY.EXE is installed
  with the VISUAL installer.
* SC.EXE
  SC.EXE is a Microsoft Windows tool used to make modifications
  to services and to remove services. SC.EXE is commonly installed
  with Microsoft Windows. Run a Microsoft Windows search to verify
  that SC.EXE is installed. SC.EXE does not have to be in the same
  directory as the services executables; you can leave SC.EXE in
  the directory where Microsoft installed it.
* Gupta
  Runtimes You must also have the Gupta runtimes for your
  version of VISUAL installed on the computer where you run the
  service.

To install the service:

1. In your VISUAL executables
   directory, locate VMDBRSVC.EXE.
2. Perform one of these
   steps:
3. If you do
   not use single sign-on, right-click VMDBRSVC.EXE and select Run as Administrator. The Sign In dialog is
   displayed.
4. If you do
   use single sign-on, run a command prompt as the System Administrator.
   In the Command Prompt line, specify <service path>/VMDBRSVC.EXE
   -SYSADM. Replace <Service path> with the path where VMDBRSVC.EXE
   is installed.

3. Specify this information:

User ID Specify
the user ID that the service uses to sign into the VISUAL database.
This can be any valid VISUAL user ID who has access to the site for
which you are setting up the service. This user must also have security
permissions to access the DBR Scheduler (VMDBRSCH.exe)

Password Specify
the password associated with the user ID.

Database Specify
the database on which to run the service.

4. Click Sign
   In. The name and description of the service is displayed.
5. Specify this information:

Site
ID Specify the ID of the site whose DBR schedules you want
to run with the service.

Log
File Directory Specify where to store the log file for the
service.

Polling
Interval Specify how frequently the service should check
to see if the DBR scheduler should be run for the site. Specify the
interval in seconds. The maximum value is 900 seconds. If you specify
a value greater than 900, your value is replaced with 900.

Log Level Specify
the level of information to write to the log file. Click one of these
options:

None
To write the time the service started, click this option. This option
is recommended for normal production environments.

Error
To write the time the service started and any error messages, click
this option.

Info
To write to the time the service started, error messages, and additional
information about the service, click this option. The use of this
option is recommended only if you are troubleshooting issues with
the service. When you use this option, the size of the log file grows
quickly.

The log file's name is VMDBRSVC\_[Your Site
Name].log. The size of the log file is limited to 1 MB. When the log
file approaches 1 MB, the log is renamed to VMDBRSVC\_[Your Site Name]\_[Current
date time].log, and a new VMDBRSVC\_[Your Site Name].log is created.

6. Click Install
   Service.

To install the service for another site, repeat steps 5 and 6. Repeat
these steps for each site whose schedules you would like to run with
the service.