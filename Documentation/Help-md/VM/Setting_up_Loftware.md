Setting-up Loftware




# Setting-up Loftware

|  |  |
| --- | --- |
| POSTIT.gif | You must use Loftware to design your labels. Without the necessary .lwl files (a Loftware proprietary format), you cannot complete the creation of labels to use within VISUAL. |

Use this feature to configure the VISUAL/Loftware relationship.

1. From the Maintain menu,
   select Loftware Setup.

The Loftware Setup dialog box appears.

2. Configure directory
   settings:

Loftware - Click
the Loftware button and navigate to the
directory containing your .lwl files, or Loftware labels. This directory
can be either local or on a network.

After selecting a directory, VISUAL displays
the full path. For example:

C:\Program Files\Loftware Labeling\LABELS

Spool - Click
the Spool button to navigate to and choose
a spooling directory. The spool directory is the directory you may
use as a batch, or watched directory. See your Loftware documentation
for more information on setting up watched directories.

3. Select printer options:

Loftware Printer Ini
- Click the Loftware Printer Ini button
to navigate to the directory containing your primary thermal label
printer. ini file.

For example, the following information might
appear in such an. ini file.

[Loftware Print Server]

ScanPath=C:\TestLib32\WatchdogNT\Drop

LabelsPath=\\Testbox\_9ad3le\c(test-95)\TestLib32\labels

LayoutPath=C:\TestLib32\Layouts

PrinterPath=c:\llmwin32

Printers Available
- If any label printers are available, VISUAL lists them in the Printers
Available field. If no printers appear, you might have to install
a suitable label printer. See your system documentation for more information
on adding and configuring printers.

4. Click the Save
   button to commit these settings.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Label_Printer_Setup_Utility.htm) User-defined Help