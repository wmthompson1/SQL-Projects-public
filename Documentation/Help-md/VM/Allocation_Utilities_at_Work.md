Allocation Utilities at Work




# Allocation Utilities at Work

The following example illustrates how the Allocation
Utility allocates supply to a customer order for which there is insufficient
stock of on-hand inventory to satisfy demand. The customer order in
this case is for 1,000 parts with an ID of MMC\_FM0001\_HW, a fabricated
and purchased part. The Warehouse ID for this customer order is MMC-MAIN.

If you are licensed to use multiple sites, allocations are done
on a site-by-site basis.

Part information for this example:

* There is, at the time of
  order, a quantity of 383 in Warehouse MMC-MAIN.
* There is a purchase order
  for 300 of the same parts due in on 1/10/2001.
* There is an unreleased work
  order for 5,000 due to be released on 1/11/2001.
* No quantity of this part
  is on hold or unavailable in warehouse MMC-MAIN.

To begin allocating supply to this customer order:

1. With the Allocation
   utility window open, enter the Part ID in the Starting Part ID
   field.
2. In the Ending Part ID
   field, enter the same Part ID to constrain the scope of the Allocation
   Utilitys search.
3. In the Starting Warehouse
   ID field, enter the Warehouse ID of the customer order. In this
   case, MMC-MAIN.
4. In the Ending Warehouse
   ID field, enter the same Warehouse ID.
5. Because no quantity
   of this Part ID is on hold or unavailable, leave the Inventory
   Allocation check boxes cleared.
6. Select the Allocate
   Future Supply Orders check box. Because some of this customer
   orders supply may potentially come from a purchase order that
   you have not yet received into Warehouse MMC-MAIN, select this
   check box.
7. Because you fabricate
   this part as well as purchase it and know that there is at least
   one work order for this part with an unreleased or firmed status,
   select the next two check boxes.
8. From the File menu,
   select Start.

The Allocation Utility begins the allocation
session.

On the first pass, the Allocation Utility
allocates the 383 parts in inventory in MMC-MAIN to the customer order
according to the customers priority and the due date of the order.
Because this is the only order for this part, all 383 parts are allocated
to this order. The customers priority and fill rate mean nothing.

On the second pass, nothing occurs because
this is the only customer order for this part.

On the third pass, the Allocation utility
checks future supply for quantities to allocate to the customer order.
It looks for the earliest date - in the case of unreleased or firmed
work orders, the release date, or in the case of purchase orders,
the receive date.

Finding the purchase order with a release
date of 1/10/2004, it allocates the purchase order quantity of 300
to the customer order. Continuing to look, it finds the unreleased
work order with a release date of 1/11/2004 and an order quantity
of 5,000, and allocates the remainder to the customer order.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Allocation_Utilities.htm) User-defined Help