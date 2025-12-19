Updating Parts, Resource Costs, and Outside Resources from Cost Simulations




# Updating Parts, Resource Costs, and Outside Resources from Cost Simulations

After you are satisfied with the results of a cost
simulation, you can transfer your simulation costs to the appropriate
parts, resources, and outside services.

|  |  |
| --- | --- |
| POSTIT.gif | This process ONLY updates the Infor VISUAL costs and resources tables and NOT the associated Engineering Masters requirements. |

To update your parts and resources:

1. Select Inventory,
   Cost Simulation.

2. If you are licensed
   to use multiple sites, click the Site ID
   arrow and select the site to use for the simulation. If you are
   licensed to use a single site, this field is unavailable.
3. Click the Simulation
   ID browse button and select the simulation.
4. Select File,
   Update Parts and Resources.

If the parent entity of the site that you
specified in the Site ID field uses the average or actual costing
method, the costs from the simulation are applied. The status of the
cost simulation is set to Updated.

If the parent entity of the site uses the
standard costing method, then the Import General Journal Transactions
dialog is displayed. This dialog is used to create the general journal
transactions that are required if you update the cost of a part in
inventory. Specify this information:

Site ID - Select
the site where you ran the cost simulation.

Suspense Account ID
- Leave this field blank.

Post Invalid accounts to
suspense account check box - Clear this check box.

Click Ok. The General
Journal transactions are created. Information about the transactions
is displayed in a dialog.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Cost_Simulation.md) User-defined Help