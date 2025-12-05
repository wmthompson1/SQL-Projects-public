Understanding Planned Supply




# Understanding Planned Supply

VISUAL allows you the advantage of universally planning
for project materials that have Discrete order policies. VISUAL tracks
the Project relationships and allows greater flexibility in making
bulk purchases for parts and materials common to several projects.

If you set up an order for a material for a project and the following
applies:

* the material card specifies
  a universal warehouse
* you universally plan the
  material
* the materials order policy
  is Discrete

In the Material Planning Window, the following information automatically
appears:

Demand Side:

Demand Warehouse The warehouse that
is causing the demand for the materialwhere the material is going.

Required WBS The WBS specified as the
demandthe specific WBS to where VISUAL will attribute the costs.

Supply Side:

Supply Warehouse The warehouse on the
purchase order or other supply sourcefrom where the material is coming.

Due WBS The WBS specified on the purchase
order, or other supply sourcethe specific WBS from where the material
is coming.

## Working with Material Planning

In the Firm / Release dialog box in the Material Planning window,
VISUAL populates but allows you to change the following:

* Warehouse ID
* Order Qty
* Rls Date
* Want Date
* WBS Code
* Proj Ref Seq #
* Proj Ref Sub ID

This allows you to take advantage of bulk purchasing while maintaining
the WBS and Warehouse links to your projects.

## Working with Inventory Transaction Entry

Adjust/In

When performing inventory adjustments against project warehouses,
enter the following information at the bottom of the Inventory Transaction
window.

WBS Code Click the browse button and
select the WBS code to which you want to charge the adjustment.

The Sub ID and Seq No for the WBS code you selected appears.

Proj Ref Seq No If you want to override
the Proj Ref Seq No, click the browse button and select the Seq No
you want to use.

Sub ID The new Sub ID for the Seq No
you selected appears.

Department ID Enter the department to
which you want to charge the adjustment.

|  |  |
| --- | --- |
| POSTIT.gif | You cannot save project related inventory transactions without a valid WBS, Proj Ref Seq No, Proj Ref Sub ID, and Dept ID combination. |

## Inventory Transfers

When performing inventory transfers to project warehouses, enter
the following information at the bottom of the Inventory Transfer
window.

WBS Code Enter the WBS code to which
you want to charge the transfer. The Seq No and Sub IDs for the WBS
you select appear.

Proj Ref Seq No If you want to override
the Proj Ref Seq No, click the browse button and select the Seq No
you want to use.

Proj Ref Sub ID The Sub ID for the Seq
No you select appears.

Department ID Enter the department to
which you want to charge the a.

|  |  |
| --- | --- |
| POSTIT.gif | You cannot save project related inventory transactions without a valid WBS, Proj Ref Seq No, Proj Ref Sub ID, and Dept ID combination. |

For inventory transfers, VISUAL uses the default department for
the "to WBS Code" set in WBS Maintenance and the cost category
associated with the product code for the part. If VISUAL finds no
cost category, it uses the departments default cost category set.

|  |  |
| --- | --- |
| POSTIT.gif | During an adjust out or transfer of inventory from a project warehouse where the part in question may happen to exist on two different WBS's, the WBS and task that is charged with relieving inventory is the WBS/task associated with the FIFO layer relieved. |

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_General_Project_Topics.htm) User-defined Help

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Enforcing_Referential_Integrity.htm) Enforcing Referential Integrity