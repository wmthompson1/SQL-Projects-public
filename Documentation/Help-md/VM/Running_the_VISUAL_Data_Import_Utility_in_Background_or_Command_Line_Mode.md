Running the VISUAL Data Import Utility in Background or Command Line Mode




# Running the VISUAL Data Import Utility in Background or Command Line Mode

You can run VDIU interactively or from a command line.
When you run VDIU from a command line, you can call it from another
program. If you include the proper command line options, VDIU runs
minimized and closes automatically upon completion.

## Command Line options:

-D - VISUAL Database name.

-U - VISUAL Database user name.

-P - VISUAL Database user password.

ENG\_ID <filename> - This option,
followed by the fully qualified tab-delimited filename, tells VDIU
to create an Engineering/Quote Masters and/or Work Orders in VISUAL.
This also creates parts for PART records.

CREATE\_PART <filename> - This option,
followed by the fully qualified tab-delimited filename, tells VDIU
to create PART Masters in VISUAL. The input file should contain only
PART lines; VDIU ignores all other line types.

SITE\_ID <site ID> Use this option
to specify the site where you are creating the record.

LOG\_PATH <filepath> Use this option
to specify the location of the log file. Specify the path only; do
not include the file name.

For example:

Run c:\Infor\visual\vmdlsync.exe D VMFG U USERNAME P PASSWORD
ENG\_ID c:\Infor\temp\file.txt SITE\_ID MMC LOG\_PATH c:\Infor\logs

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_VISUAL_Data_Import_Utility.md) User-defined Help