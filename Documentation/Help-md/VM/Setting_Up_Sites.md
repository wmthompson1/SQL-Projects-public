Setting Up Sites




# Setting Up Sites

Before you begin using Infor VISUAL DBR and Infor VISUAL Easy Lean
features, set up default settings.

Use Site Maintenance to specify DBR settings for each site. You
can grant permission to the scheduler to delete work orders if demand
no longer exists, allocate supply to later demand, and choose to plan
independently planned warehouses separately. You can also set the
percentage to use to analyze which of your resources are constrained.

If you are licensed to use multiple sites, specify these settings
for each of your sites.

To specify DBR site settings:

1. Select Admin,
   Site Maintenance.
2. Specify this information:

Entity ID Specify
the ID of the parent entity for the site.

Site ID Specify
the ID of the site.

3. Click the Scheduling
   tab. In addition to the standard scheduling information, specify
   this information for DBR:

Allow DBR to Delete Work
Orders  After you run the DBR scheduler, existing work
orders may have no demand associated with them. Use this check box
to determine what to do with these work orders. To delete the work
orders, select this check box. To change the status of the work orders
to Unreleased, clear this check box. You can then manually delete
the unreleased work orders.

Allocate Supply to Later
Demand  If work orders have unallocated supply, use this
check box to determine how to use the unallocated supply. To use unallocated
supply for future demand only, select this check box. Any unallocated
supply is used to supply demand with a due date later than the work
order due date. If you select this check box, you cannot use unallocated
supply to meet demand with a due date earlier than the work order
due date.

To use unallocated supply for demand with
due dates earlier than the supply work order dates, clear this check
box. If you clear this check box, the work order due date and quantity
is adjusted to meet the earlier demand. Work orders are adjusted only
if they have not been printed and they have not been started. For
demand with due dates later than the existing work order due dates,
new work orders are created to meet the demand.

Plan by Warehouse 
Select this check box to plan independently planned warehouses separately
from your universally planned warehouses. When you select this check
box, production schedules and material requirements for each independently
planned warehouse are determined individually. Designate warehouses
as independently planned in Warehouse Maintenance. If you select this
option, use Part Maintenance to set up planning parameters for parts
in each independently planned warehouse.

Clear this check box to plan all warehouses
in aggregate, regardless if a warehouse is designated as independently
planned.

Identify Resource with
% Planned Load as CCR  Specify the percentage of load
to use to identify a resource as a capacity constrained resource.
This value is used when you identify CCRs in Buffer Management. Resources
with planned loads equal to or exceeding the percentage you specify
are identified as CCRs.

4. Click the Save
   button.