Implode Costs from Engineering Master back to the Part




# Implode Costs from Engineering Master back to the Part

After you have reset the material costs on an Engineering
Master, you can Implode Costs to automatically calculate the standard
unit costs for the fabricated part that used the reset material. Complete
this function by referencing the engineering master for the part,
and the sum costs for all required materials, labor, and outside services.

The Costing Between Levels section of Application Global Maintenance
controls how costs are "rolled up" when there are multiple
levels of fabricated parts. This only applies when an engineering
master has another fabricated part as a material requirement. If you
select Fold to Material Cost, then the material, labor, burden, and
service costs for the required part are added together, and that value
contributes only to the material cost for the parent part. If you
select Keep Separate Costs, each of the four cost categories individually
contribute to those categories for the parent part.

The Multi Level option controls how Implode Costs follow chains
of fabricated parts. If selected, VISUAL performs the implode costs
recursively for each fabricated part required in the engineering master,
until only purchased parts are found. During this process, the estimated
unit costs in the material requirements for these fabricated parts
are also updated. If not selected, then the costs associated with
the material requirements are used directly, as is. The Permanently
Save option controls if the recursive implosion is permanently saved
in each part master at each part level.

If you are licensed to use multiple sites, Implode Costs can only
be used at the site level.

If you select Current Part Only, VISUAL implodes costs only for
the part in the Part Maintenance window. If you select All top-level
parts, VISUAL implodes costs for all the top level parts.

## Refresh after Implosion

Infor VISUAL objects work together in network relationships. Work
orders require parts, parts have preferred vendors, purchase orders
reference vendors, receivers reference purchase orders, etc., At times
you may be editing multiple, related objects at the same time. For
example, you may be using Customer Order entry to modify an order
when you realize that you need to change some of the customers master
information. You then use Customer Maintenance to make the changes.
When this type of situation occurs, the Refresh function must be used
to read any new or changed information from the database. The Refresh
function is always found under the File menu.

The Refresh command can also be used to revert back to the original
state of an object that you have been editing. For example, if you
call up a Part ID, make some edits, and then change your mind and
want to start again, just select Refresh from the File menu. VISUAL
will ask you if you want to save the current changes; you can then
answer No to revert back to the original part definition.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Part_Maintenance.md) User-defined Help