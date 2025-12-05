Setting Up a Default Department




# Setting Up a Default Department

The Default Department is the department ERP Express
(VISUAL) uses to track costs when you transfer inventory to and from
non-project warehouses.

VISUAL applies burden against initial transactions
only. These transactions include: Inventory Adjustments In, Labor
Transactions, Purchase Receipts, General Journal Entries and manual
AP invoices linked to production.

"Move" transactions including Transfers, WIP Issues, Inventory
Adjustments Out, Shipments, and Return transactions do not create
burden in VISUAL. These transactions move costs at a summary level
only. When the move transactions take place they create cost layers
that summarize each cost component (Material, Labor, Burden, and Service/Other
Direct Costs) on a General Ledger and Cost/Burden Category level.
Not all of these transactions create project summary records.

|  |  |
| --- | --- |
| POSTIT.gif | In project transfers, all burden costs are assigned to one burden category in the burden group. Costs are not recorded against each burden category in the group. |

For project transfers, ERP Express (VISUAL) uses the default department
specified in required WBS maintenance field. If you do not specify
cost categories for your default department, ERP Express (VISUAL)s
Costing Utilities may fail when you run WIP/FG Journal or Part Adjustment
transactions.

ERP Express (VISUAL) uses the Default Department ID in the following
places:

* Purchase Order Window
* Project Summary Window

You cannot change the default department ID after it has been used
in transactions.

To set up a default Department ID:

1. From the Direct Costs
   G/L Mapping and Burden Mapping Maintenance window, select Maintain, Departments....
2. Click in the row header
   for the Department ID you want to make default.

The row appears highlighted.

3. Click the Set
   Default Department button.

A check mark appears in the appropriate
Default check box.

You can only select one default department.

4. Click the Save
   button.

   |  |  |
   | --- | --- |
   | POSTIT.gif | To change your default Department ID, select the department you want and click the Save button. |

5. Click the Close
   button.

The Department Maintenance window closes.

## Setting Up Cost Categories for the Default Department

You cannot perform this phase of the Default Department set up until
you have completed setting up your Cost Categories.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Application_Global_Maintenance.htm) User-defined Help