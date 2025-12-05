Choosing E-Commerce Settings for Shipping Addresses During the Order Process




# Choosing E-Commerce Settings for Shipping Addresses During the Order Process

You can create and maintain Shipto addresses using
both Customer Maintenance and Customer Order Entry. Use Customer Maintenance
to establish customer defaults for each customer and each customer
shipping address; use Customer Order Entry at the time of order creation
to modify, if necessary, any of the default information from Customer
Maintenance.

1. From the VISUAL main
   menu, select Customer Order Entry from
   the Sales menu.

The Customer Maintenance window appears.

2. If this is a new order,
   follow normal [order entry
   procedures](VMORDENTfrmCustomerOrder.htm).

If this is an exiting order, click the Our Order ID button select the appropriate customer
order.

3. From the Edit menu,
   select Shipping Address.

The Shipping Address (Customer) dialog box
appears.

4. From the line item table
   above containing all Shipto IDs for this customer, select the
   Shipto ID for which you want to specify E-Commerce information.
5. Click the E-Commerce
   tab.
6. Enter information into
   the following fields. The database name of each field as it appears
   in the CUST\_ADDRESS table follows in parentheses after the window
   field name. These fields are all optional.

   |  |  |
   | --- | --- |
   | POSTIT.gif | The Automotive/EDI terminology you use may be unique to your company. The following fields exist as static data fields with no connection to other parts of the system. If appropriate, use them as additional User Defined fields to store information concerning customers and shipping addresses. |

Pool Point ID
- The Pool Point ID for the shipping address. VISUAL allows up to
20 alphanumeric characters in this field.

Supplier ID -
VISUAL allows up to 20 alphanumeric characters in this field.

Dock Code - VISUAL
allows up to 20 alphanumeric characters in this field.

Duty Brokerage
- VISUAL allows up to 20 alphanumeric characters in this field.

Material Issuer
- VISUAL allows up to 20 alphanumeric characters in this field.

Transmethod Code
- VISUAL allows up to 20 alphanumeric characters in this field.

Equipment Descr
- VISUAL allows up to 20 alphanumeric characters in this field.

Lading Code -
VISUAL allows up to 20 alphanumeric characters in this field.

Model Year - VISUAL
allows up to 20 alphanumeric characters in this field.

Handling Code
- VISUAL allows up to 20 alphanumeric characters in this field.

Trading Partner ID
- VISUAL allows up to 20 alphanumeric characters in this field.

Transit Time -
VISUAL allows up to 20 alphanumeric characters in this field.

Mixed Code - VISUAL
allows up to 20 alphanumeric characters in this field.

Allowable Charge No
- VISUAL allows up to 20 alphanumeric characters in this field.

Non-returnable Code
- VISUAL allows up to 20 alphanumeric characters in this field.

Generate ASN -
The default setting for this field is "Default Customer"-the
default from the customer form (CUSTOMER table), which you entered
using Customer Maintenance. If you want to change this setting for
this Shipto address, select either Yes or No as appropriate.

With this selected, you can create a customer
order, print a pack list before shipment, ship it, and then choose
to generate an invoice and ASN with the same ID as the pack list.

Hold Transfer of ASNs
- The default setting for this field is "Default Customer"-the
default from the customer form (CUSTOMER table), which you entered
using Customer Maintenance. If you want to change this setting for
this Shipto address, select either Yes or No as appropriate.

Suppress Print of A/R
Invoice at Gen - The default setting for this field is "Default
Customer"-the default from the customer form (CUSTOMER table),
which you entered using Customer Maintenance. If you want to change
this setting for this Shipto address, select either Yes or No as appropriate.

Select this check box to stop VISUAL from
printing an invoice for a shipment after you ship it.

Accept 830 - Select
the Accept 830 check box if the customer accepts production schedules
(Planning Schedule with Release Capability).

The 830 Planning Schedule is used for both
short and long term planning of production, materials, and resources.
You would normally send an 830 once a week with updated forecast quantities
and dates, and releases typically cover a time horizon anywhere from
8 to 52 weeks. Using the 830, a customer can define the firm, planning,
fabrication, and raw material quantities. No specific shipping information
is communicated in this document.

Accept 862 - Select
the Accept 862 check box if the customer accepts shipping schedules
(Planning Schedule with Release Capability).

The 862 Shipping Schedule, commonly referred
to as an 862, is used for coordinating the delivery of  materials
to the customer. This document is used to further break down the quantities
from the planning schedule into discrete shipping requirements. Because
these requirements are for shipping, they will always be "firm";
therefore, you cannot specify them as "planned." The quantities
are usually specified by a date when they must be shipped. If you
are making multiple shipments in a given day for the same part, the
customer should provide you with both a date and time. The time horizon
on a shipping schedule is from the present through the future 10-20
days. Because this is tied into the requirements from the planning
schedule, the shipping requirements should match the planning requirements
for the same time horizon. The information in the 862 can also be
used when generating barcode-shipping labels.

Consolidate Ship Line
- (CONSOL\_SHIP\_LINE) - The default setting
for this field is "Default Customer," or the default from
the customer master. To change this setting for this shipping address,
select Yes or No
as appropriate. Yes prompts VISUAL to consolidate all order lines
with the same Part ID onto one pack-list.

Inter Consignee
- VISUAL allows up to 20 alphanumeric characters in this field.

Pool Code - VISUAL
allows up to 20 alphanumeric characters in this field.

Customs Documentation:

Do Not Print -
Select the Do Not Print option button if
you don't want VISUAL to print customs documentation for this customer
shipping address.

Default Customer -
Select the Default Customer option button
to use the default preference from the customer record.

Print by Pack list
- Select the Print by Packlist option button
if you want VISUAL to print customs documents for this customer address
by pack-list. Only consolidated pack lists (see the Shipping Entry
section) are eligible for printing as customs documents.

Print by Bill of Lading
- Select the Print by Bill of Lading option
button if you want VISUAL to print customs documents for this customer
address by bill of lading.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Customer_Order_Entry.htm) User-defined Help