Manufacturing Journals




# Manufacturing Journals

VISUALs Costing Utility application creates Manufacturing
Journals. Each journal is the result of the systems analysis of inventory
transactions and, if applicable, labor tickets. These procedures create
summary journal transactions called distributions, which are then
ready for posting to the General Ledger. Each journal is a subsidiary
journal similar in nature to the accounts payable or accounts receivable
journals. The journals must be posted using the Post Manufacturing
Journals function in the Financials portion of the system.

The Costing Utility may create several distributions for each order.
If an order is open for more than one period, it typically has multiple
distributions. If you run the Costing Utilities more than once during
the period and post the results, VISUAL creates multiple distributions.
The Costing Utilities remove any unposted transactions for the period
being processed and replace them with up to date transactions. This
simplifies the resulting distributions allowing a summary to occur
across all available transactions. If you run the Costing Utilities
and do not post the results, the unposted transactions are deleted
the next time you run the Costing Utilities. However, you do not lose
the distributions created by the previous costing utility run. They
are added to the current distribution.

It is important to remember that manufacturing journals only handle
costs that flow directly as a result of entering inventory transactions
and labor tickets. Other cost items (such as freight, depreciation,
inventory storage costs, overhead, etc.) are not processed via a manufacturing
journal. Because the accounts affected by the manufacturing journals
are either expense accounts structured below the cost of sales accounts,
or asset accounts structured with other inventory accounts, the total
expense from manufacturing activity is derived directly from the chart
of accounts.

Do not confuse the values of labor and burden absorbed as expenses
to the process of manufacturing. These values are the part of your
actual labor and burden (overhead) that is being placed into the cost
of inventory as a result of value added during the manufacturing process.
Both of the accounts in question are contra-expense accounts.

Any difference between what you are posting on the Work In Process
(WIP) journal and indirect labor journal and the labor expense that
results from your payroll transactions can usually be accounted for
as one of the following:

* You are not entering all
  transactions in VISUAL. Sometimes indirect labor is not entered
  as a labor ticket in VISUAL.
* Your payroll system employee
  rate information is different from the employee rate used by VISUAL.
* Your office or salaried
  employee expense is mixed with the direct/indirect labor posting
  being made from your payroll system.

Labor tickets are costed immediately when created. Therefore, there
is no delay in obtaining this information. Also, burden is calculated
at labor ticket creation.

Material burden is applied only when a material is issued to a work
order. It is not intended to capture inventory storage costs nor does
it affect the value of inventory as it waits for use. The act of issuing
the material to a work order causes the work order to be burdened
for the material. This cost appears in the Burden column of a work
order. Each part received from the work order contains a share of
the burden applied as a result of this process. This material burden
can be in addition to the burden applied from the shop resource.

When a material issue to a work order drives the on-hand quantity
for a part into negative numbers, the following occurs in an Actual
cost database:

Material Cost: Only the quantity that
was actually on hand is costed to the work order. The additional quantity
issued that drove the on-hand quantity into negative numbers is issued
at zero cost.

Issue Burden: Issue Burdens are handled
as:

* Unit
  Burden: Because this figure is based on the number of pieces
  issued, the unit burden for the total quantity issued is costed.
* Percent
  Burden: Because this figure is based on the material cost,
  percent burden is only costed for the quantity that was actually
  on hand.

Only after more of this material is received or adjusted into stock
will any additional material and percent burden cost be distributed
to the work order for the quantity that was NOT on-hand at the time
of issue. This is done in the next run of the Costing Utilities. These
costs will be based on FIFO (first in, first out).

There are six journals associated with VISUAL. Each of these journals
are discussed in this section.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Purchase_Journals.htm)
Purchase Journals

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Work_In_Process_WIP_Journals.htm) Work In Process (WIP) Journals

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Finished_Goods_Journals.htm)
Finished Goods Journals

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Shipments_Journals.htm)
Shipments Journals

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Adjustment_Journals.htm)
Adjustment Journals

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Indirect_Labor_Journals.htm)
Indirect Labor Journals

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Example_Postings_for_Journals.htm) Example Postings for Journals

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Costing_Utilities.htm) User-defined Help