Abouit the Account Balance Dimensions Service




# About the Account Balance Dimensions Service

When you add dimensions to transactions, the dimension balances
are processed when you post manufacturing journals to the general
ledger. On SQL Server databases, the processing of dimensions can
slow VISUALs performance. To process dimensions on a SQL Server database,
you must install the Account Balance Dimensions Service.

When you use the service, information about batches processed by
the Post Manufacturing Journal program is written to a database table,
ACCT\_BAL\_DIM\_BATCH. The Account Balance Dimensions Service polls this
table to identify the dimensions to process. You can specify the polling
frequency.

The service is not supported with Oracle databases.

To use the service in multiple sites, you must install a separate
instance of the service for each site.

## Starting the Account Balance Dimensions Service Window

1. Navigate to the directory
   where you store the VISUAL executables.
2. Right-click VMACCTBALDIMSVC.EXE
   and select Run as Administrator.

## Tasks

This table shows the tasks that you can complete in the Account
Balance Dimensions Service window:

| Task | Description |
| [Installing the Service](VMACCTBALDIMSVCfrmMain.md#Install) | If you do not use single sign-on, use this procedure to install the service. |
| [Installing the Service in a Single Sign-on Environment](VMACCTBALDIMSVCfrmMain.md#SSOinstall) | If you use single sign-on, use this procedure to install the service. |
| [Uninstall the Service](VMACCTBALDIMSVCfrmMain.md#Uninstall) | Use this procedure to uninstall the service. |

## Fields

The form contains these fields:

Site ID

Specify the site where you want to run the service.

Log File Directory

Specify where to store the log file for the service.

Polling Interval

Specify in seconds how frequently the service should check for updates
to the ACCT\_BAL\_DIM\_BATCH table.

Log Level

Specify the level of information to write to the log file. Click
one of these options:

None To write
the time that the service started, click this option. This option
is recommended for normal production environments.

Error To write
the time that the service started and any error messages, click this
option.

Info To write
the time that the service started, error messages, and additional
information about the service, click this option. The use of this
option is recommended only if you are troubleshooting issues with
the service. When you use this option, the size of the log file grows
quickly.

The log files name is the name of the service executable combined
with the name of your site. For example, if you installed the service
on site MMC, the name of the log file is VMACCTBALDIMSVC\_MMC.log.
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