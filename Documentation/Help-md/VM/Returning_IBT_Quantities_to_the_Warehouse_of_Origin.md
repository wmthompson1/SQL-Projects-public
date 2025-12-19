Returning IBT Quantities to the Warehouse of Origin




# Returning IBT Quantities to the Warehouse of Origin

You must enable Shipment Tracking in Application Global Maintenance
before you can return Interbranch Transfers. For more information,
refer to [Setting
Shipment Tracking Information](Setting_Shipment_Tracking_Information.md).

After you have generated, shipped, and received an interbranch transfer,
you can, from the warehouse where the IBT quantity now is, return
either part or all of the IBT received quantity to the Warehouse of
Origin.

1. From the main Inventory
   menu, select Interbranch Transfer Entry.
2. If you are licensed
   to use multiple sites, click the Site ID arrow and select the
   site in which you created the IBT. This is the site that shipped
   the parts. If you are licensed to use a single site, this field
   is unavailable.
3. Click the IBT
   ID button and select the IBT that you want to return. The
   IBT must have a status of Closed and be completely shipped and
   received.
4. Click the Return
   All button on the toolbar.

The system verifies that the Transit Location
ID exists for the warehouse returning the shipment, then generates
a new IBT. The system does the following for the new IBT:

* assigns an IBT
  ID based on the current Auto-Numbering profile
* inserts the
  ID of the warehouse making the return into the From Whse ID
* inserts the
  ID of the warehouse that originally made the shipment into the
  To Whse ID

On the IBT record for the original shipment,
the system inserts the date you returned the shipment in the Returned
field on the Other tab.

5. When you click the Return
   All button, the system inserts the full shipment quantity in the
   Quantity field. If you would like to return only part of the shipment,
   enter the amount you would like to return in the Quantity field.
6. Click Save.
7. To complete the return,
   process the new IBT just as you would any other IBT by using Interbranch
   Transfer Shipping Entry to ship the return quantities back to
   the original warehouse and Interbranch Transfer Receipt Entry
   to receive the shipment back into the original warehouse. For
   more information on Interbranch Transfer Shipping Entry, refer
   to [Shipping Interbranch Transfers](VMIBTSHPfrmShipping.md).
   For more information on Interbranch Transfer Receipt Entry, refer
   to [Receiving Interbranch Transfers](VMIBTRCVfrmReceiving.md).

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Interbranch_Transfer_Entry.md) User-defined Help