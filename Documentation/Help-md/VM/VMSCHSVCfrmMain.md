Installing the Scheduling Service




# Installing the Scheduling Service

To run the Concurrent Scheduler with a service instead
of manually, install the Scheduling Service. The Scheduling Service
is installed by site. If you have multiple sites, install the service
for each site whose schedules you would like to run with the service.

Before you install the service, make sure the computer where you
are installing the service meets the [prerequisites](Prerequisites_for_Installing_VISUAL_Services.htm).

To install the service:

1. In your VISUAL executables
   directory, locate VMSCHSVC.EXE.
2. Perform one of these
   steps:
3. If you do
   not use single sign-on, right-click VMSCHSVC.EXE and select Run as Administrator. The Sign In dialog is
   displayed.

* If you do
  use single sign-on, run a command prompt as the System Administrator.
  In the Command Prompt line, specify <service path>/VMSCHSVC.EXE
  -SYSADM. Replace <Service path> with the path where VMSCHSVC.EXE
  is installed.

3. Specify this information:

User ID Specify
the user ID that the service uses to sign into the VISUAL database.
This can be any valid VISUAL user ID who has access to the site for
which you are setting up the service. This user must also have security
permissions to access the Concurrent Scheduler (VMGLBSCH.exe)

Password Specify
the password associated with the user ID.

Database Specify
the database on which to run the service.

4. Click Sign
   In. The name and description of the service is displayed.
5. Specify this information:

Site
ID Specify the ID of the site whose schedules you want to
run with the service.

Log File Directory Specify where to store the
log file for the service.

Polling Interval Specify how frequently the
service should check to see if the concurrent scheduler should be
run for the site. Specify the interval in seconds. The maximum value
is 900 seconds. If you specify a value greater than 900, your value
is replaced with 900.

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

The log file's name is VMSCHSVC\_[Your Site
Name].log. The size of the log file is limited to 1 MB. When the log
file approaches 1 MB, the log is renamed to VMSCHSVC\_[Your Site Name]\_[Current\_date\_time].log,
and a new VMSCHSVC\_[Your Site Name].log is created.

6. Click Install
   Service.
7. To install the service
   for another site, repeat steps 5 and 6. Repeat these steps for
   each site whose schedules you would like to run with the service.

After you install the service, specify [when
to run the service](Scheduling_the_Scheduler_Service.htm) in the Set as Schedule dialog in the Concurrent
Scheduler window.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMSCHSVCWhat.htm)
What is the Scheduling Service?

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Concurrent_Scheduler.htm) User-defined Help