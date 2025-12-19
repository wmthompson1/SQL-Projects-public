Prepare Manufacturing Journals




# Prepare Manufacturing Journals

Manufacturing Journals are prepared by the Costing
Utility application. Each journal is the result of an analysis of
inventory transactions, and if applicable, labor tickets. These procedures
create summary journal transactions called distributions, which are
then ready for posting to the General Ledger. Each journal is a subsidiary
journal similar in nature to the Accounts Payable or Accounts Receivable
journals. The journals must be posted using the Post Manufacturing
Journals function.

If you are licensed to use multiple sites, prepare manufacturing
journals on a site-by-site basis.

The Costing Utility may create several distributions for each order.
If an order is open for more than one period, it typically has multiple
distributions. If you run the Costing Utilities more than once during
the period and post the results, multiple distributions are created.
The Costing Utilities remove any unposted transactions for the period
being processed and replace them with up to date transactions. This
simplifies the resulting distributions allowing a summary to occur
across all available transactions. If you run the Costing Utilities
and do not post the results, the unposted transactions are picked
up in a subsequent batch the next time you run the Costing Utilities.
However, you do not lose the distributions created by the previous
Costing Utility run. They are added to the current distribution.

Any difference between what you are posting on the Work In Process
(WIP) journal and Indirect Labor journal and the labor expense that
results from your payroll transactions can usually be accounted for
as one of these possible situations:

You are not entering all transactions in VISUAL. Sometimes indirect
labor is not entered as a labor ticket in VISUAL.

Your payroll systems employee rate information is different from
the employee rate used by VISUAL.

Your office or salaried employee expense is mixed with the direct/indirect
labor posting being made from your payroll system.

Labor tickets are costed immediately when created. Therefore, there
is no delay in obtaining this information. Also, burden is calculated
at labor ticket creation.

Material burden is applied only when a material is issued to a work
order. It is not intended to capture inventory storage costs, nor
does it affect the value of inventory as it waits for use. The act
of issuing the material to a work order causes the work order to be
burdened for the material. This cost appears in the Burden column
of a work order. Each part received from the work order contains a
share of the burden applied as a result of this process. This material
burden can be in addition to the burden applied from the shop resource.

When a material issue to a work order drives the on-hand quantity
for a part into negative numbers, this occurs in an Actual cost database:

Material Cost Only the quantity that
was actually on hand is costed to the work order. The additional quantity
issued that drove the on-hand quantity into negative numbers is issued
at the standard costs defined in Part Maintenance. If you are licensed
to use multiple sites, these costs are defined on a site-by-site basis.

Issue Burden Issue Burdens are handled
as:

Unit Burden Because
this figure is based on the number of pieces issued, the unit burden
for the total quantity issued is costed.

Percent Burden
This figure is based on a percentage of the material cost.

There are six Manufacturing Sub-Ledger Journals.

[Purchase Receipts Journal (PUR)](Purchase_Journals.md)
Order Based

[Work Order Journal (WIP)](Work_In_Process_WIP_Journals.md)
Order Based

[Finished Goods Receipt Journal
(FG)](Finished_Goods_Journals.md) Order Based

[Shipments Journal (SLS)](Shipments_Journals.md) Order
Based

[Inventory Adjustment Journal (ADJ)](Adjustment_Journals.md)
Transaction Based

[Indirect Labor Journal (IND)](Indirect_Labor_Journals.md)
Transaction Based

## Preparing Manufacturing Journals

Select the check boxes for the appropriate journals.

When the Costing Utilities window opens, none of the check boxes
for the journals are marked.

This function only prepares the journals.

## Posting to the General Ledger

Select Ledger from the File
menu, then Post Manufacturing Journals from the pop out menu.

The Post Manufacturing Journals dialog box appears.

If you prepare the journals but dont post them, the next time you
prepare journals, the previous journals are deleted and their distributions
are included in the new journals.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Costing_Utilities.md) User-defined Help