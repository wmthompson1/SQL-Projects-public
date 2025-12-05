Creating a Customer Order from a Quote




# Creating a Customer Order from a Quote

Much of the detail in the quote preparation process
is provided to allow rapid generation of a customer order from a quotation
that has been won. You can use the Generate Order from Quote command
from the Edit menu to create the customer
order and generate any work orders, if necessary. By using a quote,
you only need to specify a minimal amount of information about how
you want the order created.

If you are licensed to use multiple sites, you can generate an order
from a quote on a site-by-site basis only. You cannot use a quote
created in one site to generate an order in a second site.

1. If you are licensed
   to use multiple sites, click the Site ID
   arrow and select the site in which the quote was created. If you
   are licensed to use a single site, this field is unavailable.
2. Select Generate Order
   from Quote from the Edit menu.

The Generate Order from Quote dialog box
appears.

3. Enter the Quote ID for
   the quote for which you want to create an order.

If the quote has expired, VISUAL notifies
you of the expiration date.

4. If you are not using
   Auto Numbering, enter the New Order ID.

If you are using Auto Numbering in Customer
Order Entry, you can leave the New Order ID field blank and advance
to the next field.

Even if you are using Auto Numbering, you
may want to give the order a special number. For example, you may
wish to incorporate the Quote ID into the Order ID.

5. If you want to create
   a work order at the same time, check the Create Work Orders also
   check box.
6. If you want to create
   work orders from quote masters in the quotation, it is preferable
   to select this option. You cannot copy quote masters to work orders
   using the New W/O option in the customer order, so if you do not
   choose to do this now, you will have to do it manually using the
   Manufacturing Window.
7. You can choose to have
   work order Base IDs assigned using the normal auto-numbering scheme
   for work orders, or by using the Customer Order ID. Although VISUAL
   links the work orders to the customer order, you may prefer to
   use the same ID for both to avoid confusion when searching for
   a work order.

When work orders created for multiple line
items are numbered using the Customer Order ID, each successive line
item is given a new lot number. This allows the same Base ID to be
used for all line items on the resulting order. For example, if there
are two line items for customer order 2029, they will receive a Base
ID/Lot ID of 2029/1 and 2029/2.

You can also explicitly number work orders
by filling in the Job ID and Lot ID for the selected quote line quantities.

8. If you select multiple
   lines from the quotation, one work order will be created for each
   line chosen.
9. If you know the Customer
   PO number, enter it in the Customer PO Ref field.
10. Enter the desired ship
    date for the generated order.
11. Enter the date by which
    you promised the order to the customer in the Original Promise
    Date field.
12. Select the header status
    for the new customer order. You can select Firm, Released, or
    Hold. Lines in the new order have a status of Inherit.
13. Make any required modifications
    to the line items.

## For each line item you can modify the following data:

Quantity/Unit Price/Discount Percent
- Be careful about modifying these items, especially unit price and
discount percent, as they have been quoted to the customer. Often,
you need to adjust the quantity to an exact quantity ordered.

Job ID/Lot ID - You can assign your own
Base ID and Lot ID for the a new order to meet the line item. This
overrides the numbering specified above.

Release Date/Want Date/Status - You can
set a release date, want date, and initial status for the work order.

Service Charge ID - The identifier of
any service charge your company may charge for this order.

1. Select the line items
   to order.

You can use the Select
All and Deselect All buttons as appropriate.

You do not have to select a continuous range
of lines. To select individual lines, hold down the Ctrl key and click
the row headers for the lines you want to select. Clicking on a line
while holding the Ctrl key does not affect any other selected lines,
and alternately selects and deselects the line.

For example, if you want to select lines
1, 3, and 5, hold down the Ctrl key and click those lines. Lines 2
and 4 remain unselected. If you change your mind about line 3, hold
down the Ctrl key and click line 3. It becomes deselected without
affecting lines 1 and 5.

2. Click Ok.

The customer order/work order creation process
may take a few minutes, depending upon the size of the quotation.
During that time, a message appears, advising you as to what is taking
place during the creation.

When the process is complete, you return
to the Customer Order Entry window, where the new order appears.

Creating an order from a quote automatically
sets the quote status to Won, and sets the Won/Lost date.

If you requested that VISUAL generate a
work orders, you can view it by using the Customer Inquiry or Manufacturing
Window.

Use the Manufacturing Window to edit, release,
or schedule the work order.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Customer_Order_Entry.htm) User-defined Help