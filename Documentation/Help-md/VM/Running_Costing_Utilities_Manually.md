Running Costing Utilities Manually




# Running Costing Utilities Manually

Use the Costing Utilities window to run costing manually
at any time. You can also set up a service to run costing. See [Running Costing with the Costing Service](VMCSTSVCWhat.htm).

To run costing utilities manually:

1. Select Eng/Mfg,
   Costing Utilities.
2. Click the Setup
   button.
3. To assume that all materials
   and operations are closed if the work order is closed, select
   this check box.
4. To repeat the costing
   run until it cannot find updates to perform, select the Continue Running... check box. If you select
   this check box, click in the Cycles are performed text box and
   enter the number of costing runs to perform. Leave the field empty
   to continue processing until all transactions have been costed.
   If you specify a 0, this value is considered the same as the value
   of 1.
5. Click the OK
   button.
6. If you are licensed
   to use multiple sites, click the Site ID
   arrow and select the site for which you are running costing utilities.
   If you are licensed to use a single site, this field is unavailable.
7. Select inventory related
   costing options:

Receipt Transaction Costing
VISUAL updates your work order receipt costs with the most up-to-date
receipt transaction data. Actual cost transactions are updated for
Closed orders and partial receipts are updated based upon WIP costing
method.

Standard Costs are used to determine Finished
Goods Variances.

Inventory Transaction
Costing VISUAL updates your inventory costs with your most
up-to-date receipt transaction data. If you use the Standard costing
method, this option is not displayed.

To keep your costing values up to date,
run the Costing Utilities with these settings often. You do not have
to generate distributions until you are ready to post to your ledgers.

7. When you are ready to
   generate journals, select the appropriate check boxes for the
   journals to prepare.

This function only prepares the journals:
you must use the Post Manufacturing Journals program to post distributions
to your ledger. To prepare distributions only, select the journals
to create and clear the two check boxes in the top section of the
window.

8. Click the Run
   toolbar button.

As the Costing Utility runs, the current
part appears in the Costing Utility window.

To stop the costing process, click the Stop
toolbar button.

9. When the costing run
   has finished, an information dialog appears notifying you of the
   costing results. This information is also stored in the VMAPLUTL.log
   file.
10. Click the OK
    button on the dialog box.
11. Click the Exit
    toolbar button on the Costing Utility.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Costing_Utilities.htm) User-defined Help