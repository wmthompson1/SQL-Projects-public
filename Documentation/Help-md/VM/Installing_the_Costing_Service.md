Installing the Costing Service




# Installing the Costing Service

The Costing Service is installed by site. If you have
multiple sites, install the service for each site where you want to
use the service to run costing.

Before you install the service, make sure the computer where you
are installing the service meets the [prerequisites](Prerequisites_for_Installing_VISUAL_Services.htm).

To install the service:

1. In your VISUAL executables
   directory, locate VMCSTSVC.EXE.
2. Perform one of these
   steps:

* If you do
  not use single sign-on, right-click VMCSTSVC.EXE and select Run as Administrator. The Sign In dialog is
  displayed.
* If you do
  use single sign-on, run a command prompt as the System Administrator.
  In the Command Prompt line, specify <service path>/VMCSTSVC.EXE
  -SYSADM. Replace <Service path> with the path where VMCSTSVC.EXE
  is installed.

3. Specify this information:

User ID Specify
the user ID that the service uses to sign into the VISUAL database.
This can be any valid VISUAL user ID who has access to the site for
which you are setting up the service. This user must also have security
permissions to access Costing Utilities (VMAPLUTL.exe)

Password Specify
the password associated with the user ID.

Database Specify
the database on which to run the service.

4. Click Sign
   In. The name and description of the service is displayed.
5. Specify this information:

Site ID Specify
the ID of the site where you want to run costing with the service.

Log File Directory
Specify where to store the log file for the service.

Polling Interval
Specify how frequently the service should check to see if costing
should be run for the site. Specify the interval in seconds. The maximum
value is 900 seconds. If you specify a value greater than 900, your
value is replaced with 900.

Log Level Specify
the level of information to write to the log file. Click one of these
options:

None To write the
time the service started, click this option. This option is recommended
for normal production environments.

Error To write
the time the service started and any error messages, click this option.

Info To write to
the time the service started, error messages, and additional information
about the service, click this option. The use of this option is recommended
only if you are troubleshooting issues with the service. When you
use this option, the size of the log file grows quickly.

The log file's name is VMCSTSVC\_[Your Site
Name].log. The size of the log file is limited to 1 MB. When the log
file approaches 1 MB, the log is renamed to VMCSTSVC\_[Your Site Name]\_[Current
date time].log, and a new VMCSTSVC\_[Your Site Name].log is created.

6. Click Install
   Service.
7. To start the service
   now, click Yes. To start the service
   later, click No. If you click No, you
   can start the service in the Windows control panel.
8. To install the service
   for another site, repeat steps 5 through 7. Repeat these steps
   for each site where you want to run costing with the service.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMCSTSVCWhat.htm)
Running Costing with the Costing Service

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Costing_Utilities.htm) User-defined Help