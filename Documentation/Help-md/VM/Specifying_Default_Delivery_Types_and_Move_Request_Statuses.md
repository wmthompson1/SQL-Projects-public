Specifying Default Delivery Types and Move Request Statuses




# Specifying Default Delivery Types and Move Request Statuses

Use Site Maintenance to specify default values to use on new move
requests.

1. Select Admin,
   Site Maintenance.
2. Click the Defaults
   tab.
3. Specify this information:

Default Matl WIP Delivery
Type Specify the default delivery type to use on move requests
that are created in Inventory Transaction Entry.

Select Drop Only if the material will be
used in a work order or not stored in a WIP inventory location. When
a Drop Only move request is completed, three WIP inventory transactions
are created: an adjust out of the pickup location, an adjust in to
the delivery location, and an adjust out of the delivery location.

Select WIP Inventory if the material will
be stored in WIP inventory. When a Drop Only move request is completed,
two WIP inventory transactions are created: an adjust out of the pickup
location and an adjust in to the delivery location.

If you do not want to set a default value,
leave this field blank.

Default Labor WIP Delivery
Type Specify the default delivery type to use on move requests
that are created when jobs are stopped in Shop Floor.

Select Drop Only if the material will be
used in a work order or not stored in a WIP inventory location. When
a Drop Only move request is completed, three WIP inventory transactions
are created: an adjust out of the pickup location, an adjust in to
the delivery location, and an adjust out of the delivery location.

Select WIP Inventory if the material will
be stored in WIP inventory. When a Drop Only move request is completed,
two WIP inventory transactions are created: an adjust out of the pickup
location and an adjust in to the delivery location.

If you do not want to set a default value,
leave this field blank.

You can currently create move requests related
to labor transactions in Shop Floor only. You cannot create move requests
for labor transactions in Labor Ticket Entry.

Default Matl Move Request
Status Specify the default status of move requests that are
created in Inventory Transaction Entry. Select one of these options,
or leave the field blank if you do not want to set a default value:

Pending The parts
in the move request are waiting to be loaded or picked. If you choose
not to use the Loading status for any move requests, you can also
use the pending status to indicate that the order is being loaded.

Loading The parts
in the move request are being loaded or picked.

Ready for Pickup
The parts in the move request are ready to be delivered by shop
floor personnel.

Default Labor Move Request
Status Specify the default status of move requests that are
created when jobs are stopped in Shop Floor. Select one of these options,
or leave the field blank if you do not want to set a default value:

Pending The parts
in the move request are waiting to be loaded or picked. If you choose
not to use the Loading status for any move requests, you can also
use the pending status to indicate that the order is being loaded.

Loading The parts
in the move request are being loaded or picked.

Ready for Pickup
The parts in the move request are ready to be delivered by shop
floor personnel.

You can currently create move requests related
to labor transactions in Shop Floor only. You cannot create move requests
for labor transactions in Labor Ticket Entry.

4. Click Save.