Working with the Account Balance Dimensions Service




# Working with the Account Balance Dimensions Service

## Installing the Service

To install the service:

1. Navigate to the directory
   where you store the VISUAL executables.
2. Right-click VMACCTBALDIMSVC.EXE
   and select Run as Administrator.
3. Sign in to the database
   where you want to run the service. You can use any valid VISUAL
   user ID and password. This is the user ID that the service will
   use when accessing the database. The user ID that you specify
   can still be used to access the VISUAL executables. The service
   does not need its own user ID.
4. Specify this information:

Site ID Specify
the site where you want to run the service.

Log File Directory
Specify where to store the log file for the service.

Polling Interval
 Specify in seconds how frequently the service should check
for updates to the ACCT\_BAL\_DIM\_BATCH table.

Log Level Specify
the level of information to write to the log file. Click one of these
options:

None To write the
time that the service started, click this option. This option is recommended
for normal production environments.

Error To write
the time that the service started and any error messages, click this
option.

Info To write the
time that the service started, error messages, and additional information
about the service, click this option. The use of this option is recommended
only if you are troubleshooting issues with the service. When you
use this option, the size of the log file grows quickly.

The log files name is the name of the service
executable combined with the name of your site. For example, if you
installed the service on site MMC, the name of the log file is VMACCTBALDIMSVC\_MMC.log.
The size of the log file is limited to 1 MB. When the log file approaches
1 MB, the log is renamed by appending the current date and time. A
new log file is created.

Max # of Retries
Specify the number of times that the service will attempt to process
a batch. The service might not be able to process a batch due to a
SQL error or connection issues with the database. If the service has
not processed the batch after the maximum number of retries, the batch
is ignored. If you select Error or Info as the log level, then information
about failures is written to the log file.

5. Click Install
   Service.
6. To start the service
   now, click Yes. To start the service
   later, click No. You can start
   the service from the Services section of Administrative Tools
   in the Windows Control panel.
7. To install the service
   in another site, repeat steps 1 through 6.

## Installing the Service in a Single Sign-on Environment

If you use single sign-on, you must install the service from a command
line prompt with the System Administrator parameter.

1. Select Start,
   All Programs, Accessories.
2. Right-click Command
   Prompt and select Run as administrator.
3. In the Command Prompt
   line, specify <Service path>/VMACCTBALDIMSVC.EXE -SYSADM

Replace <Service path> with the path
where the service executable is installed.

4. Proceed with steps 3
   through 6 of the Installing the Service procedure.

## Uninstalling the Service

Uninstall the service by site. If you installed the service for
more than one site, you must repeat this procedure for each site to
completely remove the service. To uninstall an instance of the service:

1. Launch the service executable:
2. If you do
   not use single sign-on, navigate to the directory where you store
   the VISUAL executables. Right-click VMACCTBALDIMSVC.EXE and select
   Run as Administrator.
3. If you do
   use single sign-on, launch the service executable as described
   in "Installing the Service in a Single Sign-on Environment."

2. Specify this information:

User ID Specify
the user ID that the service uses to sign in to VISUAL.

Password Specify
the password associated with the ID.

Database Specify
the database on which you are running the service.

3. Click Sign
   In.
4. In the Site ID field,
   specify the site where you no longer want to run the service.
5. Click Remove
   Service.

Related Topics

[About the Account Balance Dimensions
Service](VMACCTBALDIMSVCWhat.md)