Assigning Purchase Order Line Quantities to Customer Order Demand




# Assigning Purchase Order Line Quantities to Customer Order Demand

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
   select CO.
4. Double-click <Demand
   Base ID> to search for qualifying customer order lines.

The Customer Orders dialog box appears.

The dialog box that appears contains all
the customer order currently in your database. Besides this list being
perhaps too long to scroll through, selection is arbitrary at this
point because you may select a customer order line that has a different
Part ID or Warehouse ID than the current purchase order line, and
these two IDs must be the same in both in order to establish a demand
link.

To avoid selecting customer orders at random,
double-click <Seq #/Line #> to view
only those customer order lines in your database with the required
Part ID and Warehouse ID.

5. Highlight the customer
   order to which you want to allocate purchase order quantities.
   Double-click the line item or click the Ok
   button.
6. The customer order line
   appears in the Assign to Demand dialog box line item table.
7. Double-click <Seq#/Line#>
   to view the line items for the customer order.

The Customer Order Lines for Customer Order
ID dialog box appears.

Select the C/O lines
with unallocated demand only box if you want customer order
line items to which that you have not already allocated purchase order
quantities searched for.

Select the C/O lines
for the same part only box if you want only customer order
lines for the same Part ID as the current purchase order searched
for.

Enter dates in the Starting
Date and Ending Date fields for the search. Select how you
want the search results sorted.

8. Click Apply
   to execute the search.

Depending on how you configured the search,
all qualifying customer order lines appear in the line item table.

9. Select the line to which
   you want to allocate purchase order quantities and click the Ok button.

The customer order line information appears
in the Assign to Demand dialog box.

10. In the Allocate
    Quantity column, enter what portion of the purchase orders
    Available Quantity you want to assign
    to this customer order line. This quantity cannot exceed the Available Quantity of the current purchase
    order or the Demand Unallocated Quantity
    of the customer order line.
11. Click Save
    to commit the allocation from the purchase order line to the customer
    order line.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Viewing_Customer_Order_Line_Demand_Allocation_Information_for_a_Purchase_Order_Line_Item.htm) Viewing Customer Order Line Demand Allocation
Information for a Purchase Order Line Item

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Purchase_Order_Entry.htm) User-defined Help