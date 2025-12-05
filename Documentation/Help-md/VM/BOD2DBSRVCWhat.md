Installing the BOD to Database Service




# Installing the BOD to Database Service

When a BOD is sent to VISUAL, information is placed
in VISUAL's inbox (the database table COR\_INBOX\_ENTRY). To transfer
the information from the inbox to the appropriate locations within
the VISUAL database, install the BOD2DBSRVC service. The BOD2DBSRVC
service reads BODs sent to VISUAL and inserts or updates information
in the VISUAL database.

To install the BOD2DBSRVC service:

1. Navigate to the directory
   where you store you VISUAL executables.
2. Launch BOD2DBSRVC.exe.
   Depending on the operating system you use with VISUAL, you may
   need to run BOD2DBSRVC.exe as an Administrator. For example, if
   you have installed the VISUAL executables on a Windows 7 machine,
   you must right-click BOD2DBSRVC and select Run
   as Administrator.
3. Log in to the VISUAL
   database.
4. Specify this information:

Service Name
Specify the name to use for this service. The name you specify is
displayed in the Services section of the Windows Control Panel.

Log File Directory
Specify the location where the log files are stored. Two log files
are generated. The bod2db.log records actions taken by BOD2DBSRVC
program. For example, it records information when you install the
service. The BOD2DBSRV.log lists the BODs imported from the inbox
table to the other tables in your VISUAL database.

Service Poll Interval
Specify how frequently the service should check for new information
in the inbox. Specify this value in seconds.

5. Click Install
   Service.
6. Click Ok.

The fields not described in this procedure are for importing data
manually. We recommend that you do not import data manually.

## Installing BOD2DBSRVC when using Single Sign On (SSO)

If you are using SSO, you must install the BOD2DBSRV service from
a command line prompt with the System Administrator parameter.

1. Select Start,
   All Programs, Accessories.
2. Right-click Command
   Prompt and select Run as administrator.
3. In the Command Prompt
   line, specify <BOD2DBSRVC path>/BOD2DBSRVC.EXE -SYSADM.

Replace <BOD2DBSRVC path> with the
path where the BOD2DBSRVC executable is installed.

4. Proceed with step 3
   through 6.

## Uninstalling the BOD2DBSRVC

To uninstall the service:

1. Launch BOD2DBSRVC.exe.
   Depending on the operating system you use with VISUAL, you may
   need to run BOD2DBSRVC.exe as an Administrator. For example, if
   you have installed the VISUAL executables on a Windows 7 machine,
   you must right-click BOD2DBSRVC and select Run as Administrator.
2. Log in to the VISUAL
   database.
3. Click Uninstall
   Service.