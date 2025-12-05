Importing and Exporting Data In the VMDI Exchange Window




# Importing and Exporting Data In the VMDI Exchange Window

Use the VMDI Exchange window to import or export data
to and from the VE database.

1. In
   the Key/Version fields, specify which VISUAL key (ACK, ASN, CPO,
   CSH, INV, PLN, RCA, VPO, or WSA) and layout version number you
   want to use (defined using VMDIGEN.EXE).

When you specify the key and version, VISUAL
selects the appropriate radio button from the Direction section. The
data is either incoming or outgoing. VISUAL also determines the file
type, the inbound or outbound rule, and the file style for the data
(previously defined using VMDIGEN.EXE).

2. In the Directory field,
   specify the target directory for the .VDI file.

The Directory field For Imports (Inbound
file), this is the location in which VISUAL will find your .VDI file.

For Exports:

(Outbound files), this is the location in
which VISUAL will create the .VDI files. VMDI runs each key/version
separately.

VISUAL updates the Run Date for the selected
VMDI layout after each exchange (the Run Date field displays the date
and time that your layout was last run).

For Inbound layouts, this is a "display
only" field and changing the date/time has no affect on your
imports.

For Outbound ACK, INV, RCA, and VPO transactions,
setting back the run date allows to re-export previously exported
transactions.

VMDI Exchange only exports ACK, INV, RCA,
and VPO transactions with a create date equal to or later than the
Run Date of the VMDI layout. You can enter an earlier date/time to
re-export the data, but use caution; using an earlier Run Date will
re-send all data again from the specified date and later.

3. Click the Exchange
   button to perform the exchange.

At the end of your Exchange session, the
program displays a Run Dialog that lists the number of records inserted,
records updated, duplicates rejected, forecasts replaced, records
not allowed, and errors. VISUAL writes out files that show: number
of documents inserted/updated, exceptions, good records, and errors.
For example, if you ran an import of your CPO0001.VDI file, then the
logs generated would be named as follows:

CPO0001IN.XML
Insert /Update log

CPO0001EX.XML
Exceptions

CPO0001G.XML Good
(successfully imported) records

CPO0001.XML Errors

These files are all located in the same
user-specified directory as your import file. You should check the
log files after each exchange, especially if your Run Dialog indicates
that your run generated errors.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Data_Interchange.htm) User-defined Help