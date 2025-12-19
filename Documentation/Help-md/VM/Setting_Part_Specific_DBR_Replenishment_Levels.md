Setting Part Specific DBR Replenishment Levels




# Setting Part Specific DBR Replenishment Levels

In the Part Maintenance window of VISUAL, you can
set part specific replenishment levels for your parts that use your
capacity-constrained resources.

If you are licensed to use multiple sites, you can
set this information up at the tenant level or the site level. If
you set up the information at the site level, the site-level information
overrides the tenant-level information.

To set part replenishment levels:

1. In the VISUAL Part Maintenance
   window, click the Part ID button and
   select the appropriate part from your parts list.
2. Click the DBR
   tab.

The DBR tab appears.

3. Enter the following
   information relevant to the part you selected.

Minimum Lead-time
- Enter the minimum lead-time in hours (24 hours per calendar day)
you want to use when you are purchasing this part in an expedited
mode.

Lead-time Buffer
- Enter the number of hours (24 hours per calendar day) you want to
use for the lead-time buffer when you are purchasing this part.

Replenishment Level
- Enter the stock quantity below which you do not want your stock
levels to fall. When your stock level falls below the replenishment
level, VE automatically generates a work order for fabricated stocked
parts.

If you have a demand (customer order) for
this part, VE creates a separate work order for the make to stock
parts.

Emergency Stock %
- For stocked materials, whether you purchase them or make them, when
your on hand quantity reaches the Emergency Stock % of the replenishment
level, it is time to expedite the acquisition of more of this material.

In TOC terms, when this happens, the part
is in the Red Zone of its inventory buffer.

Minimum Batch Size
- Enter the minimum size you want to use for the manufacture of this
part.

4. Click the Save
   button on the toolbar or select Save from the File menu.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_DBR_Maintenance.md)