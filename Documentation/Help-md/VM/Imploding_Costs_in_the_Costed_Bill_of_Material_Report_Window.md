Imploding Costs in the Costed Bill of Material Report Window




# Imploding Costs in the Costed Bill of Material Report Window

Use the Implode Costs function to calculate the standard
unit costs for a fabricated part. The costs are calculated based by
adding the material requirement, operation, and outside service costs
for the part's engineering master. The costs are saved on the part
record.

If you use fabricated parts as material requirements, use the Costing
Between Levels section of Application Global Maintenance to control
how costs are rolled up when there are multiple levels of fabricated
parts. If you select Fold to Material Cost, then the material, labor,
burden, and service costs for the required part are added together,
and that value contributes only to the material cost for the parent
part. If you select Keep Separate Costs, each of the four cost categories
individually contributes to those categories for the parent part.

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
| POSTIT.gif | Carefully consider any changes to standard costs when using a standard cost system. Most standard cost accounting systems operate under a principle where standards for existing parts are set and frozen for a given period, often an entire fiscal year. Implode Costs has the capability of changing the standards for ALL parts in a site. |

You can also access this feature in Part Maintenance.

1. Select Eng/Mfg,
   Costed Bill of Material Report.
2. If you are licensed
   to use multiple sites, click the Site ID
   arrow and select the site. Select one site. If you are licensed
   to use a single site, this field is unavailable.
3. Select Edit,
   Implode Costs.
4. Select the parts to
   implode. Click one of these options:

Selected Parts
When you click this option, the Selected Parts browse button becomes
active. Click this button to select fabricated parts from a table.
You can select a single part or multiple parts. If you are licensed
to use multiple sites, only the parts found in the site you selected
in the Part Maintenance window are displayed.

All top-level parts
- Click this option to implode costs for all top-level parts.

5. To save the results
   of the implosion at each part level, select the Permanently
   Save All Levels check box.
6. To implode costs through
   multi-levels from the selected part down, select the Multi
   Level check box.
7. Click Ok.

   |  |  |
   | --- | --- |
   | POSTIT.gif | If you do not select Permanently Save All Levels, the implosion results appear only in the Costing section of the current screen. Permanently Save All Levels is automatically turned on and cannot be changed when you choose All Top Level Parts. |

[About
the Costed Bill of Material Report Window](VMCSTBOMfrmPrintCostedBOMReport.htm)