Entering WIP Transactions



 
 
  
 
  

# Entering WIP Transactions

Note: If you
use VISUAL Global Financials, Infor highly recommends that you set
up auto-numbering for WIP transactions using a unique prefix. WIP
Maintenance stores records for costing in the same table that Global
Financials updates with Payable Transactions. Problems could occur
if a WIP Maintenance transaction has the same ID as a Global Financials
Payable transaction.

To enter WIP transactions:

1. Click the New
   toolbar button to create a new transaction.
2. Site ID - Click the
   Site
   ID arrow and select a site to use.
3. Enter a Transaction ID into the Transaction ID
   field or leave the field blank if you are using Auto Numbering.

Click the Transaction
ID button to select an existing transaction.

4. Click the Calendar
   button beside the Transaction
   Date field to select a date, or enter the date in the field provided.

This is the day the WIP transaction occurred.
The current system date is the default.

5. Click the Calendar
   button beside the Posting
   Date field to select a posting date, or enter the posting date
   in the field provided.

This is the date to post the transaction
to the General Ledger. During the posting process, VISUAL ensures
the date is within the period you are posting. If it is not, the transaction
is not posted in that period.

The current system date is the default.

6. Click the Suspense Account
   button to choose a suspense account for this WIP transaction.

A suspense account is a separate category
of account code opened to record expenditure and/or income which,
for the time being at least, cannot be properly allocated to a specific
budget related expenditure or income account code.

7. Click the Insert Row button or select Insert
   Row from the Edit menu to add a transaction line to the
   table.

VISUAL adds a row to the table and assigns
a line number.

Refer to the following column information
in the detail line table.

Quantity - Enter
the Quantity for the first item on the transaction.

Reference - Enter
any reference information regarding the transaction item. This is
for your use.

<G/L Account ID>
- Double-click the <G/L Account ID>
column header to choose a G/L Account ID for the posting account for
this transaction. This is the only required field; however, if you
go on to specify a work order or project, you must specify other values.
See the individual field descriptions for more information.

G/L Account Description
- The G/L Account Description displays automatically when you select
the G/L Account ID.

Amount - Enter
the amount of this line item.

Fixed Chg - Specify
any fixed charges in the Fixed Chg column, if applicable.

<Work Order Base ID>
- Double-click the <Work Order Base ID>
column header to select the work order to which you want to link this
WIP transaction.

Work Order Lot ID
- After choosing a Work Order Base ID, VISUAL displays the associated
Lot ID in this field.

Work Split ID
- After choosing a Work Order Base ID, VISUAL displays the associated
Split ID in this field, if applicable.

Costing Category
- From the Costing Category list, select a costing type, either S
(service) or M (material), for this WIP transaction.

<Project ID>
- To reference a project rather than a work order, double-click the
<Project ID> column header to choose
an existing project.

|  |  |
| --- | --- |
| POSTIT.gif | If you choose a project after already choosing a work order, VISUAL asks you if you want to override the work order and load the project information. |

The following default codes and IDs appear
for the project you reference:

* WBS Code
* Proj Ref Sub
  ID
* Proj Ref Seq
  No
* Dept ID

|  |  |
| --- | --- |
| POSTIT.gif | You cannot save project related transactions without a valid WBS, Proj Ref Seq No, Proj Ref Sub ID, and Dept ID combination. |

<WBS Code>
- Before you can browse WBS codes, you must first choose a project.
To specify a WBS code for the project, double-click the <WBS
Code> column header to browse a list of all associated WBS
codes.

Proj Ref Sub ID
- Enter any reference information regarding the project.

<Proj Ref Seq No>
- Before you can browse sequence numbers codes, you must first choose
a WBS code. To specify a project sequence number, double-click the
<Proj Ref Seq No> column header to
browse a list of all associated sequence numbers.

<Dept ID>
- Double-click the <Dept ID> column
header to link this transaction line to a specific department. This
is a required field if this line references a work order or project.

For more information on Enforcing Referential
Integrity, refer to [Enforcing
Referential Integrity](Enforcing_Referential_Integrity.htm).

<Cost Category ID>
- Double-click the <Cost Category ID>
column header to choose a cost category code for this line. Cost categories
apply to both materials and services. This is a required field if
this line references a work order or project.

<G/L Override Account
ID> - The override account you want to use for general ledger
purposes.

8. Click the Save
   button to save the transaction line and generate a Transaction
   ID.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_WIP_Maintenance.htm) User-defined Help

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Enforcing_Referential_Integrity.htm) Enforcing Referential Integrity