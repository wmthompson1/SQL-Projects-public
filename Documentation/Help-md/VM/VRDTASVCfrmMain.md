Installing the Visual Reporting Data Loader Service




# Installing the VISUAL Reporting Data Loader Service

The Reporting Data Loader Service updates the reporting
tables on the days and times you specify. The service is run against
a specific VISUAL database. If you have multiple VISUAL databases
and would like to run the service on all databases, then you must
install the service once for each database.

To use the service to update the reporting tables, you must also
specify when to run the service. Specify when to run the service in
Application Global Maintenance. See [Scheduling
the Reporting Data Loader Service](Scheduling_the_Reporting_Data_Loader_Service.md).

Before you install the service, make sure the computer where you
are installing the service meets the [prerequisites](Prerequisites_for_Installing_VISUAL_Services.md).

To install the service:

1. In your VISUAL executables
   directory, locate VRDTASVC.EXE.
2. Right-click VRDTASVC.EXE
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
   In. The name and description of the service is displayed.
5. Specify this information:

Log File Directory
Specify where to store the log file for the service.

Polling Interval
Specify how frequently the service should check for updates. The
maximum value is 900 seconds. If you specify a value greater than
900, your value is replaced with 900.

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

The log file's name is VRDTASVC.log. The
size of the log file is limited to 1 MB. When the log file approaches
1 MB, the log is renamed to VRDTASVC\_[Current date time].log, and
a new VRDTASVC.log is created.

6. Click Install
   Service.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VRDTASVCWhat.md)
What is the VISUAL Reporting Data Loader Service?

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMDBOARDWhat.md)
What is the Dashboard?

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_File_Menu.md) User-defined Help