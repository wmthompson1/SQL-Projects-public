Exporting Labor Tickets to VISUAL Payroll




# Exporting Labor Tickets to VISUAL Payroll

Before you attempt to export labor tickets to VISUAL
Payroll, you need to make sure that the codes in VISUAL and the codes
in Payroll are the same for the export.

Within Labor Ticket Entry each labor ticket has an Earnings code.
You can set up these codes in These codes in Employee Maintenance.
These are the codes VISUAL Payroll uses to process Payroll.

You need to set up each of these codes in Payroll. To do this, you
must add these codes to the earnings and deduction codes in Company
Maintenance. See the VISUAL Payroll documentation for more information.

When the codes are the same in both areas, you can prepare the file
for the export process.

1. Select VMEXPLAB.EXE
   from the directory where your VISUAL
   executables are installed.

The Import/Export dialog box appears.

2. Click the SQL/PAY
   button to select the export attendance transactions to Payroll
   option.

The Export Attendance Transactions dialog
box appears.

3. Enter the company ID
   in the Company ID field.
4. Enter or select the
   date range for the export.

Make sure the date range covers all tickets
you are importing.

5. Select the appropriate
   Period type.

You can choose Weekly, Bi-weekly, Semi-monthly,
or Monthly.

6. Select the appropriate
   Pay Rate radio button.

Determine if the pay rate should come from
VISUAL Employee Maintenance or from VISUAL Payroll.

7. Select an Export Type.
   You can choose from:

Export in detail
- If you export in detail, each labor ticket is included in the export
file.

Export in summary
- If you export in summary, the labor tickets summarize for each code
and employee. This is the preferred method for keeping Payroll more
manageable. You can always review the detail within VISUAL Labor Ticket
Entry if there is a discrepancy.

8. Select the appropriate
   rounding criteria, if necessary.
9. If you want VISUAL Import/Export
   to calculate, check the Determine Overtime check box.

Click the Setup
button to set up overtime. Set [Setting
Overtime](Setting_Overtime.htm).

10. Click Ok.

A dialog box appears, prompting you for
a file name.

11. Save the file to the
    root Payroll directory.

At this point you are ready for the import
function within Payroll. See the Payroll documentation for more information.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Labor_Ticket_Entry.htm) User-defined Help