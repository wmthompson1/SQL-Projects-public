Receiving Interbranch Transfers



 
  
 
 
 
 
 
 
 
 

# Receiving Interbranch Transfers

After you have entered and shipped an IBT, you can receive the transfer,
either partially or entirely, as you would a purchase order.

1. If it is not already
   open, select Interbranch Transfer Receipt Entry
   from the Tools menu.

The Interbranch Transfer Receiving Entry
window appears.

2. If you are licensed
   to use multiple sites, click the Site ID arrow and select the site is managing
   this transaction.  If you are licensed to use a single site,
   this field is unavailable.
3. Click the IBT ID button to
   select the IBT you want to receive from a list of all the IBTs
   currently in your database.

|  |  |
| --- | --- |
| POSTIT.gif | When using Inter Branch Transfer Receipt Entry to receive transfers to consignment warehouses, VISUAL selects the Consignment Transfer check box, identifying the type of transfer, and populates the name of the customer or vendor you assigned to the consignment warehouse. |

4. Click the Shipper ID button
   and select the shipper.
5. Click the Receiver ID
   button and select the Id for the receiver.

For interbranch transfer receipt lines from
which you have not yet received quantities, you should not attempt
to select an existing Receiver ID. If you do select an existing Receiver
ID, the IBT with that Receiver ID appears in the window.

You do not have to enter a unique Shipper
ID. Let VISUAL, using your auto-numbering preferences, assign this
IBT shipment a new Receiver ID. See later in this section for more
information on setting auto-numbering preferences for Receipt lines.

6. If necessary, click
   the calendar button and change the Actual Receive Date.

VISUAL fills the Desired Receive Date field
with the Desired Ship date you entered in Interbranch Transfer Entry.
You cannot edit this date. This date is for planning purposes only;
it is an "ideal" against which you can develop optimal scheduling
scenarios.

The shipper or carrier of this IBT appears
in the Ship Via list. You can not edit this field.

7. On the Warehouse tab
   these read-only fields are displayed:

From Warehouse ID

To Warehouse ID

From
Whse Site ID

To
Whse Site ID

8. In the Location ID field,
   click the arrow and select the location to use for the line.
9. Specify the quantity
   to receive. If you are receiving a standard part, specify the
   quantity to receive In the Quantity Received field. If you enter
   a quantity greater than the remaining quantity (Ordered Received)
   for the line, a dialog box is displayed asking you to confirm
   the over-receipt. You can also click the Receive All button to
   receive the entire order.

If you are receiving a piece tracked part,
specify the number of pieces to ship in the # pieces to ship field.
You must specify a quantity equal or less than the number of shipped
pieces. You also must specify a number of pieces manually. You cannot
use the Receive All button. After you specify the number of pieces,
the quantity of the shipment is calculated and inserted in the Ship
Quantity field.

For both standard and piece tracked parts,
you can receive less than the quantity shipped. If you choose not
to receive the entire order, you are presented with two options upon
savingto leave the order open or close the order.

10. If you are receiving
    a partial quantity, click the Save button
    or the Receive All button. A dialog
    box appears informing you that the line will have a balance after
    receipt.

Select what you want to do with the remaining
Order Quantity and click the Ok button.

* Leave order
  open (partial receipt, backorder balance) - This leaves the IBT
  open awaiting the remainder of the shipment. The IBT does not
  close.
* Close order
  (partial receipt, no backorder) - This is useful when the original
  IBT quantity has been changed, or is not received for some reason.
  For example, consider a case where the From warehouse ships you
  a partial shipment on an IBT order. The back ordered quantity
  may not be available in a time to suit your needs, and you may
  request that quantity from another warehouse. This option allows
  you to arrange with the To Warehouse to cancel the remainder of
  the shipment, and close the order short.

VISUAL receives the IBT lines.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Interbranch_Transfer_Receipt_Entry.htm) User-defined Help