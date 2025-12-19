Installing the Reporting Service




# Installing the Reporting Service

To print work order travellers and picklists with
a service instead of manually, install the Reporting Service. After
the service is installed, any user who has access to the Set as Scheduled
dialog in the Work Order Traveller window can schedule a traveller
print job.

Before you install the service, make sure the computer where you
are installing the service meets the [prerequisites](Prerequisites_for_Installing_VISUAL_Services.md).

To install the service:

1. In your VISUAL executables
   directory, locate VRPTSVC.EXE.
2. Perform one of these
   steps:
3. If you do
   not use single sign-on, right-click VRPTSVC.EXE and select Run as Administrator. The Sign In dialog is
   displayed.
4. If you do
   use single sign-on, run a command prompt as the System Administrator.
   In the Command Prompt line, specify <service path>/VRPTSVC.EXE
   -SYSADM. Replace <Service path> with the path where VRPTSVC.EXE
   is installed.
5. Specify this information:

User ID Specify
the user ID that the service uses to sign into the VISUAL database.
This can be any valid VISUAL user ID who has permission to access
the Work Order Traveller window (VMTRVRPT.exe).

Password Specify
the password associated with the user ID.

Database Specify
the database on which to run the service.

4. Click Sign
   In. The name and description of the service is displayed.
5. Specify this information:

Log File Directory Specify where to store the
log file for the service.

Polling Interval Specify how frequently the
service should check to see if travellers and picklists be printed.
Specify the interval in seconds. The maximum value is 900 seconds.
If you specify a value greater than 900, your value is replaced with
900.

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

The log file's name is VRPTSVC.log. The
size of the log file is limited to 1 MB. When the log file approaches
1 MB, the log is renamed to VMRPTSVC\_[Current date time].log, and
a new VRPTSVC.log is created.

6. Click Install
   Service.

After you install the service, specify the printers to use with
the service.

## Specifying Printers to Use with the Service

When you set up the service schedule in the Work Order Traveller
window, you select the printer to use from a drop-down list. Use the
Available Printers dialog to specify the printers to include in the
drop-down list.

To add a printer:

1. In the Infor VISUAL
   Report Generation Service dialog, click Printers.
2. Click Add.
3. Select the printer to
   add. If necessary, click the Setup button
   to specify the printer settings to use. The settings available
   depend upon your printer.
4. Click Ok.
5. Click Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VRPTSVCWhat.md)
What is the Reporting Service?

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Work_Order_Traveller.md) User-defined Help