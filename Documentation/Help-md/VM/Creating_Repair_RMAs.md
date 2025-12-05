Creating Repair RMAs




# Creating Repair RMAs

To create a Repair RMA:

1. In the Site ID field,
   specify the site from which you shipped the customer order. This
   field is available only if you are licensed to use multiple sites.
   If you are licensed to use a single site, this field is unavailable.
2. Perform one of these
   steps:

* If you know
  the ID of the packlist that contains the parts the customer is
  returning, specify the ID in the Packlist ID field. When you select
  the Packlist ID, the Customer ID and the original customer order
  ID are inserted. Information about the original order and shipment
  is inserted in the table.
* If you do
  not specify a Packlist ID, specify the ID of the original customer
  order that contains the parts to be returned. When you select
  an order, the Customer ID is inserted in the Customer ID field.

3. On the General tab,
   specify this information:

Type Specify
Repair.

Status Specify
Open.

Reason Select
the reason given for the return of the materials to assist in the
evaluation process. Create reason codes in Application Global Maintenance.

Return to Original Order
To subtract the returned quantity from the shipped quantity on the
original customer order line, select this option. To create a new
customer order to receive the returned material, clear this option.
See Costing Repair RMAs.

Ship from Original Order
To reship the material from the original order, select this check
box. If you select this check box, the Return to Original Order check
box is selected automatically. To create a new customer order to ship
the replacements, clear this check box.

4. If you cleared the Ship
   from Original Order check box, specify this information:

New Customer Order ID
- To ship repaired parts from an existing customer order, click the
browse button and select the order. To ship from a new order, leave
this field blank.

New Customer ID
- Click the browse button and select the customer who will receive
the repaired parts. To ship the repaired parts to the same customer
who placed the original order, leave this field blank.

5. On the Contact tab,
   you have the option to specify contact information by:

* Selecting
  the contact from the existing customer contacts, and then click
  the Use Selected Contact toolbar button.
  If the contact you want to use is not yet in the database, click
  the Add New Contact toolbar button.
  If you do not want to assign a contact to the RMA, click the Use No Contact toolbar button.
* Specifying
  the contact information directly in the Contact tab fields. This
  method does not store the contact information in your Contacts
  table.

6. Specify the number of
   units the customer is returning. If the customer is returning
   a standard part, specify the return quantity in the Rtn Qty Authorized
   column. If the customer is returning a piece-tracked part, specify
   the return quantity in Rtn Pcs Authorized column. Information
   from the original customer order and packlist are also displayed.
7. Click the Save
   button. The RMA ID is inserted in the header.
8. This message is displayed:
   Create work order(s) for the repairs? To create a work order
   for the repair work, click Yes. See
   [Creating the Repair
   Work Order](Creating_the_Repair_Work_Order.htm). If you do not want to create a work order, click
   No.