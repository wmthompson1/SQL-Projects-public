Assigning Purchase Order Delivery Schedule Supply to Customer Order Demand




# Assigning Purchase Order Delivery Schedule Supply to Customer Order Demand

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

1. With the appropriate
   delivery schedule line item highlighted, click the Demand
   button.

The Assign to Demand dialog box appears.

2. Click Insert
   to begin adding P/O delivery schedule line information.
3. From the Type list box,
   select CO.
4. Double-click <Demand
   Base ID> to view a list of all the customer orders currently
   in your database.

The Customer Orders dialog box appears.

5. Select the appropriate
   customer order and click Ok.
6. Double-click <Seq
   #/Line #> to view a list of customers orders to which
   you can assign P/O delivery schedule line supply.

The Customer Order Lines dialog box appears.

7. Using the search and
   sort options in the top portion of the dialog box, select what
   C/O lines you want displayed in the line item table and click
   Apply.

According to how you configured the search
and sort options all qualifying customer order lines appear.

8. Select the appropriate
   line and click the Ok button.

The necessary information is loaded in the
Assign to Demand dialog box line item table.

9. In the Allocate Quantity
   column, enter the quantity of the P/O delivery schedule line that
   you want to allocate to the customer order line.

|  |  |
| --- | --- |
| POSTIT.gif | The quantity that you enter in the Assign Quantity column cannot be greater than the Demand Unallocated Quantity of the customer order line or the Available Quantity of the P/O delivery schedule line. |

10. Click Ok
    to commit the allocation of supply from the P/O delivery schedule
    line to the customer order line.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Purchase_Order_Entry.htm) User-defined Help