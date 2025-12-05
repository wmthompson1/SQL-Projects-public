Enforcing Referential Integrity




# Enforcing Referential Integrity

VISUAL enforces referential integrity using four major
methods:

## Completion of Required Fields

Because VISUAL uses the following fields for Costing
and Burdening, they are "Required" fields.

* Project ID
* WBS Code
* Sub ID Ref
* Seq No Ref
* Department ID

In the following list of programs, if the user leaves
any of these fields blank, VISUAL populates the blank fields using
the default information from the project.

VFAPIENT - Accounts Payable Invoice Entry

VFGLAWIN -General Ledger Accounts Window

VFGLTENT - General Ledger Journal Entry

VMIBTRCV - Inter Branch Transfer Receipt
Entry

VMINVENT - Inventory Transaction Entry

VMLABENT - Labor Ticket Entry

VMMFGWIN - Manufacturing
Window

VMORDENT - Order Entry

VMORDWIN - Order Management Window

VMPHYINV - Physical Inventory Count

VMPLNWIN - Material Planning Window

VMPRJJRN - Project Journal Entry

VMPRJMNT - Project Maintenance

VMPURENT - Purchase Entry

VMREQENT - Requisition Entry

VMREVREC - Project Revenue Recognition

VMWBSMNT - WBS Maintenance

VMWIPMNT - Work In Process Maintenance

## Disallowing the User to Save Records

In the above programs, VISUAL does not allow you to
save a record unless an appropriate G/L Burden Map exists. This ensures
that there is always a logical data path VISUAL can use to track the
entry.

## Disallowing the User to Save Project Masters Without at Least One WBS Code Set Up for the Project

VISUAL does not allow you to save a project without
first having set up at least one WBS code and specified it within
that project. This ensures that projects always have at least one
WBS code that VISUAL can use to track costs.

## Disallowing the Released and Firmed Statuses for Project Masters Where the User Has Not Set Up the Appropriate Project Warehouse

VISUAL does not allow you to save a Project Master without the appropriate
Warehouse ID. Project warehouses must have the same name as the projectif
the project warehouse does not exist when you save the project master,
VISUAL prompts you to create one.

For more information on creating project warehouses, refer to [Entering Project Information](VMPRJMNTfrmProject.htm).

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Application_Global_Maintenance.htm) User-defined Help

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Creating_New_Projects.htm)
Creating New Projects

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMPRJMNTfrmProject.htm)
Entering Project Information