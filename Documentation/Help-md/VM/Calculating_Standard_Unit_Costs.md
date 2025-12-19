Calculating Standard Unit Costs




# Calculating Standard Unit Costs

You can use Implode Costs to automatically calculate
the standard unit costs (those listed in the Costs section of Part
Maintenance) for a fabricated part. This is done by referencing the
engineering master for the part, and summing costs for all required
materials, labor, and outside services.

The Costing Between Levels section of Application Global Maintenance
controls how costs are "rolled up" when there are multiple
levels of fabricated parts. This is only relevant when an engineering
master has another fabricated part as a material requirement. If you
select Fold to Material Cost, then the material, labor, burden, and
service costs for the required part are added together, and that value
contributes only to the material cost for the parent part. If you
select Keep Separate Costs, each of the four cost categories individually
contributes to those categories for the parent part.

A top-level part is a fabricated part that is not used as a required
material of any other fabricated part. Often, these are the parts
that are sold as products.

The Multi Level option controls how Implode Costs follow chains
of fabricated parts. If selected, implode costs is performed recursively
for each fabricated part required in the engineering master, until
only purchased parts are found. During this process, the estimated
unit costs in the material requirements for these fabricated parts
are also updated. If not selected, then the costs associated with
the material requirements are used directly, as is. The Permanently
Save option controls if the recursive implosion is permanently saved
in each part master.

If you are licensed to use multiple sites, Implode Costs can only
be used at the site level.

|  |  |
| --- | --- |
| POSTIT.gif | Carefully consider any changes to standard costs when using a standard cost system. Most standard cost accounting systems operate under a principle where standards for existing parts are set and frozen for a given period, often an entire fiscal year. Implode Costs has the capability of changing the standards for ALL parts in the system. |

To automatically calculate standard costs:

1. Select
   Inventory, Part Maintenance.
2. If you are licensed
   to use multiple sites, click the Site ID
   arrow and select the site. If you are licensed to use a single
   site, this field is unavailable.
3. To calculate standard
   costs for a particular part, specify the part in the Part ID field.
   If you are calculating costs for all parts in the site, you can
   leave the Part ID field blank.
4. Select Maintain,
   Implode Costs.
5. Select the parts to
   implode. Click one of these options:

Current Part only
- Click this option to implode costs only for the part in the Part
Maintenance window.

Selected Parts
When you click this option, the Selected Parts browse button becomes
active. Click this button to select fabricated parts from a table.
You can select a single part or multiple parts. If you are licensed
to use multiple sites, only the parts found in the site you selected
in the Part Maintenance window are displayed.

All top-level parts
- Click this option to implode costs for all top-level parts.

6. To save the results
   of the implosion at each part level, select the Permanently
   Save All Levels check box.
7. To implode costs through
   multi-levels from the selected part down, select the Multi
   Level check box.
8. Click Ok.

   |  |  |
   | --- | --- |
   | POSTIT.gif | If you do not select Permanently Save All Levels, the implosion results appear only in the Costing section of the current screen. Permanently Save All Levels is automatically turned on and cannot be changed when you choose All Top Level Parts. |

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Implode_Costs_from_Engineering_Master_back_to_the_Part.md) Implode Costs from Engineering Master
back to the Part

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Part_Maintenance.md) User-defined Help