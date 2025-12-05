Invoice Form Options and Partial Shipments




# Invoice Form Options and Partial Shipments

If you selected the Retain excess balance for future
shipments option on the Shipment Trk tab in Site Maintenance, these
options could be deactivated in Invoice forms:

* Create A/R Invoices
* Combine All Packlists for
  an Order on One Invoice
* Combine All Packlists for
  a Customer on One Invoice

These options are deactivated if any of the customers for whom you
are printing invoices meets both of these conditions:

* The customer has an order
  that has been pre-invoiced
* There is an approved packlist
  for a partial shipment of the order

To reactivate these options, adjust the Starting and Ending Customer
ID fields to exclude the customer with the pre-invoiced and approved
partial shipment. You can also reactivate these options by generating
invoices for the customers with pre-invoiced and approved partial
shipments. To identify these orders, print the List of Pre-Invoiced
Orders with Approved Partial Shipments report. Then, use the Generate/Print
One Invoice option available on the File menu to generate an invoice
for each order in the List of Pre-Invoiced Orders with Approved Partial
Shipments report. After you generate each invoice, the Create A/R
Invoices, Combine All Packlists for an Order on One Invoice, and Combine
All Packlists for a Customer on One Invoice options are reactivated.

See [Specifying
Shipment Tracking Information](Setting_Shipment_Tracking_Information.htm).