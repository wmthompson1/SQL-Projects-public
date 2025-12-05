Assigning Purchase Order Line Quantities to Customer Order Delivery Schedule Line Demand




# Assigning Purchase Order Line Quantities to Customer Order Delivery Schedule Line Demand

NOTE: If you use FIFO by Location as your inventory
grouping method, then these conditions apply to purchase orders linked
to customer orders:

* After you receive a purchase
  order linked to customer order, the linked quantity can only be
  used to fulfill the customer order. The linked purchase order
  quantity cannot be used for another purpose unless the link is
  broken or the customer shipment is complete.
* Linked customer orders should
  be shipped from the same warehouse location where the linked purchased
  quantities were received. If you ship a linked customer order
  from a different warehouse location, the link to the purchase
  order is broken.

1. Highlight the purchase
   order line from which you want to assign order quantities to demand
   and select Assign to Demand from the
   Edit menu.

The Assign to Demand dialog box appears.

The following read-only information appears
in the dialog box header section.

Order ID/Line #
- The Order ID of the current purchase order; the number of the purchase
order line as it appears in the purchase order.

Order Qty - The
quantity of the specified part in the purchase order line. Also, the
quantity available to you to assign to demand.

Received Qty -
The quantity of the purchase order line item that you have received.
Unless you are reopening this purchase order after receiving partial
quantities at an earlier time, this value should be zero.

Allocated Qty
- The portion of the Order Quantity/Available Quantity that you have
allocated to demand.

Fulfilled Qty
- The quantity that has been fulfilled from the supplying source.

Available Qty
- The quantity of the purchase order that you have yet to allocate
to demand sources. Before you begin to establish demand links, this
value is equal to the Order Quantity of the purchase order line.

Part ID - The
ID of the part in the current purchase order line.

Warehouse ID -
The ID of the warehouse for the current purchase order line. Any demand
link you establish must also have this Warehouse ID. If you attempt
to establish a link to a potential demand link does not have this
same Warehouse ID, you cannot continue.

Desired Receive Date
- The date by which you want to receive the current purchase order
line.

Promised Date
- The date by which the vendor promised delivery of the current purchase
order line.

Purchase U/M -
If the part is a purchased part, the unit of measure you set in Part
Maintenance.

2. Click Insert
   to begin adding line item demand information.
3. From the Type list box,
   select CD.
4. Double-click <Demand
   Base ID>, <Seq #/Line #>,
   or Piece # to search for qualifying
   lines of customer order delivery schedule demand. The same dialog
   box appears if you click any of the three.

The Customer Order Delivery Schedule Demand
dialog box appears.

Select the C/O Delivery
Schedules with unallocated demand only box if you want customer
order delivery schedule supply to which you have not already fully
allocated demand searched for.

Enter dates in the Starting
Date and Ending Date fields for the
search. Using the sort options, select how you want the results of
its search sorted.

5. Click Apply
   to execute the search.

Depending on how you configured your search,
all qualifying customer order delivery schedule line items appear
in the line item table.

6. Select the customer
   order delivery schedule line to which you want to allocate purchase
   order line supply and click the Ok button.

The line item information appears in the
Assign to Demand dialog box.

7. In the Allocate
   Quantity Column, enter the number of parts that you want
   to allocate from the purchase order Available Quantity to the
   customer order delivery schedule line.

This value cannot be greater that the Available Quantity of the purchase order line
or the Demand Unallocated Quantity of the
customer order delivery schedule line.

8. Click the Save
   button to commit the allocation of the current purchase order
   quantity to the customer order delivery schedule line.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Purchase_Order_Entry.htm) User-defined Help