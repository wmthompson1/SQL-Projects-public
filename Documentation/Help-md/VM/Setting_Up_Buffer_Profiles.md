Setting Up Buffer Profiles




# Setting Up Buffer Profiles

Use Buffer Profiles to group parts with similar buffer characteristics
together. For example, you could create a buffer profile for purchased
parts with high demand variability and a medium amount of lead time.
Or, you could create a buffer profile for fabricated parts with low
demand variability and a high amount of lead time. The parts you assign
to the buffer profile share the characteristics of the profile. The
parts are not necessarily related to each other on a bill of a material,
nor or they necessarily in the same product or commodity family. The
parts you assign to a buffer profile share similar demand and supply
patterns.

After you set up buffer profiles and assign them to parts, you can
use the parameters you set up in the buffer profile in conjunction
with the actual demand and supply for the parts to establish new replenishment
levels for the parts.

Buffer profiles are primarily used with parts that are planned based
on average daily usage.

If you are licensed to use multiple sites, you can assign a buffer
profile to a part at the tenant level. When you assign a buffer profile
at the tenant level, the profile applies to the part in all entities
and sites. You can also assign a buffer profile at the site level.
If you plan by independently planned warehouses, you can assign a
buffer profile at the warehouse level.

To create a buffer profile:

1. Select Inventory,
   Part Maintenance.
2. Select Maintain,
   Buffer Profiles.
3. Specify this information:

Profile ID Specify
the ID to use to identify this buffer profile.

Description
Specify a description of the buffer profile.

Item Type Specify
the type of parts in this buffer profile. Select either Fabricated
or Purchased.

Variability Category 
Specify the variability in demand of parts in this profile. Select
one of these options: High, Medium, or Low.

Lead-time Category 
Specify the category for the amount of lead time parts in this profile
require. Select one of these options: Long, Medium, or Short.

After you specify the Item Type, Variability
Category, and Lead-time Category, the Profile Code and Profile Code
Description are inserted. The Profile Code is the first letter of
the selected Item Type, Variability Category, and Lead-time Category.

Use significant minimum
order quantity for green zone  Use this check box to
specify whether or not a parts minimum order quantity should replace
the parts calculated green zone if the calculated green zone is less
than the minimum order quantity. To replace the calculated green zone
with the minimum order quantity when the minimum order quantity exceeds
the calculated green zone, select this check box. The minimum order
quantity will be used as the green zone. To use the calculated green
zone even if it is less than the minimum order quantity for the part,
clear this check box.

Lead-time Green Impact
%  Specify the lead-time green impact percentage to use
for parts with this buffer profile. When you select a lead-time category,
a recommended percentage range is displayed next to the field. When
you generate replenishment levels and buffers using demand-driven
stocked part analysis, the lead-time green impact percentage is multiplied
by the yellow zone to determine the size of the green zone.

Lead-time Red Impact
%  Specify the lead-time red impact percentage to use
for parts with this buffer profile. When you select a lead-time category,
a recommended percentage range is displayed next to the field. When
you generate replenishment levels and buffers using demand-driven
stocked part analysis, the lead-time red impact percentage is multiplied
by the yellow zone to determine the size of the red zone base.

Variability Red Safety
%  Specify the variability red safety percentage to use
for parts with this buffer profile. When you select a variability
category, a recommended percentage range is displayed next to the
field. When you generate replenishment levels and buffers using demand-driven
stocked part analysis, the variability red safety percentage is multiplied
by the red zone base to determine the size of the red zone safety.

On Hand Alert Red % 
Specify the on hand alert red percentage to use for parts with this
profile. When you generate replenishment levels and buffers using
demand-driven stocked part analysis, the on hand alert red percentage
is multiplied by the top of red to create the alert sub-zone.

4. Click Ok.