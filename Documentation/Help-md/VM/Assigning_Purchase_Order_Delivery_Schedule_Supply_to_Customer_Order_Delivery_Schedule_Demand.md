Assigning Purchase Order Delivery Schedule Supply to Customer Order Delivery Schedule Demand




# Assigning Purchase Order Delivery Schedule Supply to Customer Order Delivery Schedule Demand

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
   to begin adding purchase order delivery schedule line information.
3. From the Type list box,
   select CD
4. Double-click <Demand
   Base ID> to search for qualifying customer order delivery
   schedule lines to which you can allocate purchase order delivery
   schedule line supply.

The Customer Order Delivery Schedule Demand
dialog box appears.

5. Using the search options
   in the top portion of the dialog box, select what C/O delivery
   schedule lines, if any, you want displayed in the line item table
   and click Apply.

According to how you configured the search
all qualifying C/O delivery schedules appear.

6. Select the appropriate
   line and click the Ok button.

The necessary information is loaded in the
Assign to Demand line item table.

7. In the Allocate Quantity
   column, enter the quantity of the P/O delivery schedule line that
   you want to allocate to the C/O delivery schedule line.

   |  |  |
   | --- | --- |
   | POSTIT.gif | The quantity that you enter in the Assign Quantity column cannot be greater than the Demand Unallocated Quantity of the customer order delivery schedule line or the Available Quantity of the P/O delivery schedule line. |

8. Click Ok to commit the
   allocation of supply from the P/O delivery schedule line to the
   C/O delivery schedule line.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Purchase_Order_Entry.md) User-defined Help