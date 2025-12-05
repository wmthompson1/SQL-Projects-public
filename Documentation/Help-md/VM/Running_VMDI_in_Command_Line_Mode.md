Running VMDI in Command Line Mode




# Running VMDI in Command Line Mode

There are two modes of operation for VMDIXCHG: Standard
and Command Line mode. Standard mode requires input from the user;
Command line mode does not. If VMDIXCHG finds a valid command line,
it executes in command line mode. Command line mode allows you to
specify the run options currently available through the main screen.

When you run the program in command line mode, you use a cumulative
log file, VMDIXCHG.XML. Each time you execute the program, VMDIXCHG
appends time stamped status information to the end of the file.

The VMDIXCHG.XML file resides in the same directory as all other
\*.VDI and \*.LOG files. When you run the program in batch mode, you
can exchange multiple types of data (i.e. PLN, VPO, etc.) in the same
run.

Command Line:

The command line must conform to the following format.

The first value is always the executable program name, VMDIXCHG.

The next three values are the database connection strings. The data
base connection strings follow standard Infor VISUAL format:

-D <database name>

-U <User ID>

-P <password>

All command line arguments up to this point are mandatory. The remaining
arguments are optional. If you do not specify a particular argument,
VMDIXCHG applies a default value where applicable.

Exchange File Path:

-F <file path>

If you omit the F argument, VMDIXCHG uses the value from the Preferences
Maintenance EDI Exchange section, DataFilePath entry. You should only
use the F option if you need to temporarily override the default
directory path.

Next, list the types of values you want to exchange. You may list
more than one type. Keep in mind that you must separate additional
values with a space. The valid types are ACK, ASN, CPO, CSH, INV,
PLN, RCA, VPO, or WSA. You must specify at least one valid data type,
each of which must have a 4 digit unique identifier following it.
The data type / numeric identifier combination equates to the KEY
and VERSION columns of the VMDI\_LAYOUT table.

## Inbound Duplicate Rules:

|  |  |
| --- | --- |
| POSTIT.gifstyle="width: | Inbound rule parameters are only applicable for inbound types such as CPO, CSH, and PLN. |

Use the following arguments with CPO imports:

-L  Delete Unshipped Lines

-S Delete Unshipped Schedules

-V Close Partial Shipped Schedules

-I Include Today in Proration

For example: CPO0001 L S V I

Use the following arguments with PLN imports:

-I Include Today in Proration

For example: PLN0000 I

## Outbound Rules:

|  |  |
| --- | --- |
| POSTIT.gifstyle="width: | Outbound rule parameters are only applicable for outbound types such as ACK, ASN, INV, RCA, VPO, and WSA. |

The Outbound Rules allow VMDI Exchange to either append the outbound
data to existing output files, or create a new files each time.

Use the following arguments with INV, VPO, ACK, RCA, and ASN exports.

-O Overlays the files (this is the
default if no argument is specified)

or

-A Appends the files

For example: ASN0001 -O

The following example illustrates a command line that executes VMDIXCHG
connected to database VMFG as user MIKE and password OCEAN, and executes
the exchanges for CPO0000, PLN0000, INV9999, and ASN3333. VMDIXCHG
overrides the EDI file directory for this run with C:\Infor\EDI\TEMP.
In addition, the INV output file is overlayed and the ASN output file
is appended onto it.

The CPO0000 import deletes unshipped lines and schedules and closes
any partial shipped schedules. The PLN0000 import in this example
Includes Today in the Proration.

VMDIXCHG D VMFG U MIKE P OCEAN F C:\Infor\EDI\TEMP CPO0000 L
S V PLN0000 I INV9999 O ASN3333 -A

Because the program is running without user intervention, you cannot
change the run date parameter. The run "as of date" for
each data type that you are exchanging is from the LAST\_RUN\_DATE column
of the VMDI\_LAYOUT table for each layout key.

VMDIXCHG.XML

The following example illustrates the log file created when you
run the program in batch mode:

8/21/15 11:07:13: \*\*\*\*\*\*\*\*\*\* Session Started \*\*\*\*\*\*\*\*\*\*

8/21/15 11:07:13: Begin program execution in command line mode.
ExtCommandLine=-DVMFG52 -USYSADM -PSYSADM PLN0000

8/21/15 11:34:20: Import of PLN0000 data to c:\Infor\bak\edi\pln0000.vdi
has begun

8/21/15 11:34:23: 60 PLN records imported

8/21/15 11:34:24: Session Ended