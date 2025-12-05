Receiving Services by Dispatch ID




# Receiving Services by Dispatch ID

You can receive parts that have been sent to a vendor
for service by dispatch ID instead of by purchase order ID. If you
sent multiple dispatches for a particular purchase order line, use
the receipt by dispatch ID feature to specifically associate a purchase
receipt with a dispatch.

1. Select Purchasing,
   Purchase Receipt Entry.
2. If you are licensed
   to use multiple sites, click the Site ID
   arrow and select the site in which you sent the dispatch. If you
   are licensed to use a single site, this field is unavailable.
3. Click the Service
   Dispatch ID browse button and select the dispatch that
   you are receiving. After you select a service dispatch ID, this
   information about the dispatch is displayed in the table:

Reference The
ID and description of the vendor service.

Quantity Ordered
The total quantity ordered on the purchase order line.

Total Qty Dispatched
The total quantity of part dispatched to the vendor for the purchase
order line. This is the total of all dispatches made for the line.

Dispatch Qty Dispatched
The quantity of part dispatched in the service dispatch that you
specified in the Service Dispatch ID field.

Dispatch Qty Received
The quantity of part that has already been received for the service
dispatch that you specified in the Service Dispatch ID field.

Total Qty Recv
The total quantity of part that you have received from the vendor
for the purchase order line.

Dispatch Addr
The ID of the address to which you sent the parts for service.

Dispatch Line No
The dispatch line number associated with the service. This column
is not displayed by default. Select Options, Configure Line Item Table
to add the column.

4. In the Quantity Received
   field, specify the quantity that you received from the vendor.

We recommend that you do not use the Receive
All button when receiving by dispatch ID. If you click Receive All,
the total quantity remaining to be received on the purchase order
line is inserted in the Quantity Received field. This quantity is
likely more than the total in the dispatch.

5. Click Save.

If you received less than the total amount
that you ordered, a dialog is displayed. Click one of these options:

Leave order open (partial
receipt, backorder balance) This leaves the order open awaiting
the remainder of the shipment. The purchase order does not close.

Copy remaining unreceived
lines to separate backorder This copies the remaining quantities
to a new purchase order. The same Order ID is used, with the addition
of a suffix consisting of a dash and a digit. For example, if the
purchase order ID is 4001, the new Order IDs are 4001-1, 4001-2, etc.
These are referred to as back orders, and they are created so that
the original order can be closed. This is common when some line items
are completely received, and others are backordered by the vendor.

It is recognized that orders numbered in this
way are back orders, and they are retrieved. If possible, you should
avoid using a dash in your PO numbering scheme.

Close order (partial receipt,
no backorder) This is useful when the original order quantity
has been changed, or is not received for some reason. For example,
consider a case where a vendor ships you a partial shipment on an
order. The backordered quantity may not be available in a time to
suit your needs, and you may purchase from another vendor. This option
allows you to arrange with the vendor to cancel the remainder of the
shipment, and close the order short.

You can set up a preference to also close
the operation linked to the outside service when you close the order.
See [Closing
a Service Line Short](VMRCVENT_APLfrmReceiving.htm#Closing_a_Service_Line_Short).