Creating Evaluation RMAs




# Creating Evaluation RMAs

Evaluation RMAs must be created against the original
customer order only. You cannot create a new customer order as part
of the evaluation process. You can create a quote for eventual repairs.
You can also create a work order to track the costs of evaluation.

To create an evaluation RMA:

1. In the Site ID field,
   specify the site from which you shipped the customer order. This
   field is  available only if you are licensed to use multiple
   sites. If you are licensed to use a single site, this field is
   unavailable.
2. Perform one of these
   steps:
3. If you know
   the ID of the packlist that contains the parts the customer is
   returning, specify the ID in the Packlist ID field. When you select
   the Packlist ID, the customer ID and the original customer order
   ID are inserted. Information about the original order and shipment
   is inserted in the table.
4. If you do
   not specify a Packlist ID, specify the ID of the original customer
   order that contains the parts to be returned. When you select
   an order, the customer ID is inserted in the Customer ID field.

3. On the General tab,
   specify:

Type Specify
Evaluation.

Status Specify
Open.

Reason Select
the reason given for the return of the materials to assist in the
evaluation process. Create reason codes in Application Global Maintenance.

Under Warranty
If the part is under warranty, select this check box. If the part
is no longer under warranty, clear this check box.

Use Quote Pricing
When you save the RMA record, you can create a quote for potential
repairs. If you convert this evaluation RMA to a repair RMA, you can
use this quote for pricing the repair. Select this check box if you
intend to use the quote you create when you save the evaluation RMA
as the basis for the pricing of the repair. When you select this check
box, the Price Repair Orders dialog is unavailable.

Clear this check box if you do not intend
to use the quote as the basis for the pricing of the repair, or if
you are not going to create a quote when you save the record. If you
clear this check box, you can determine the cost of repair using the
Price Repair Orders dialog.

4. On the Contact tab,
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

5. Specify the number of
   units the customer is returning. If the customer is returning
   a standard part, specify the return quantity in the Rtn Qty Authorized
   column. If the customer is returning a piece-tracked part, specify
   the return quantity in Rtn Pcs Authorized column. Information
   from the original customer order and packlist are also displayed.
   Note that the Part ID is omitted to prevent inventory transactions
   during the evaluation.
6. Click the Save
   toolbar button. The RMA ID is inserted in the header.
7. Select whether or not
   to create a quote when prompted.

Click Yes to create
a quote. Use the quote to estimate the cost of potential repairs,
whether or not the part is under warranty. If the customer incurs
any portion of the repair cost, you can submit the quote for the customer's
approval. The quote ID is inserted on the RMA header. Build the quote
prices in the Estimating Window.

Click No if you
do not want to create a quote. If you click No, you can use the Price
Repair Orders dialog box to determine the cost of the evaluation and
the repair.

8. Select whether or not
   to create a work order.

Click Yes to create
a work order. Use the work order to record the costs of evaluating
the returned parts. The Job ID is inserted in the line.

Click No if you
do not want to create a work order to measure the costs of evaluation.