Setting Customer Shipping Address E-Commerce Preferences




# Setting Customer Shipping Address E-Commerce Preferences

Now that you have specified E-Commerce defaults at
the general customer level, do the same for the customer's shipping
addresses.

1. From the VISUAL main
   menu, select Customer Maintenance from
   the Sales menu.

The Customer Maintenance window appears.

2. Click the Customer
   ID button to select the appropriate customer.
3. From the Maintain menu,
   select Shipping Addresses.

The Shipping Address (Customer) dialog appears.

4. From the line item table
   above containing all Shipto IDs for this customer, select the
   Shipto ID for which you want to specify E-Commerce information.
5. Click the
   E-Commerce tab.
6. Enter information into
   the following fields. The database name of each field as it appears
   in the CUST\_ADDRESS table follows in parentheses after the window
   field name. These fields are all optional.

|  |  |
| --- | --- |
| POSTIT.gifstyle="width: | The Automotive/EDI terminology you use may be unique to your company. As such, the following fields may not represent the terminology you use in connection with EDI. |

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

Generate ASN (GENERATE\_ASN)
- For this shipping address, select one of the following:

Default Customer
- VISUAL generates ASNs based on the setting on the E-Commerce tab
of the Customer Maintenance window.

Yes - VISUAL generates
ASNs for this shipping address regardless of the setting on the E-Commerce
tab of the Customer Maintenance window.

No - VISUAL does
NOT generate ASNs for this shipping address regardless of the setting
on the E-Commerce tab of the Customer Maintenance window.

ASN documents provide the receiver with
advance data on incoming shipments. The ASN (856) standard format
displays the contents of a shipment of goods and any additional shipment
information, and is usually transmitted when the shipment is ready
to be transported.

|  |  |
| --- | --- |
| POSTIT.gifstyle="width: | To use consolidation features in the Shipping Entry window, the Generate ASN check box must be selected. |

Hold Transfer of ASNs
(HOLD\_TRANSFER\_ASN) - For this shipping address, select one of the
following:

Default Customer
- VISUAL holds the generation of ASNs based on the setting on the
E-Commerce tab of the Customer Maintenance window.

Yes - VISUAL holds
the generation ASNs for this shipping address regardless of the setting
on the E-Commerce tab of the Customer Maintenance window.

No - VISUAL generates
ASNs for this shipping address regardless of the setting on the E-Commerce
tab of the Customer Maintenance window.

Accept 830 - For
this shipping address, select one of the following:

Default Customer
- VISUAL assumes this address accepts production schedules (Customer
Forecast) based of the setting on the E-Commerce tab of the Customer
Maintenance window.

Yes - This shipping
address accepts production schedules (Customer Forecast) regardless
of the setting on the E-Commerce tab of the Customer Maintenance window.

No - This shipping
address does NOT accept production schedules (Customer Forecast) regardless
of the setting on the E-Commerce tab of the Customer Maintenance window.

The 830 Planning Schedule is used for both
short and long term planning of production, materials, and resources.
You would normally send an 830 once a week with updated forecast quantities
and dates, and releases typically cover a time horizon anywhere from
8 to 52 weeks. Using the 830, a customer can define the firm, planning,
fabrication, and raw material quantities. No specific shipping information
is communicated in this document.

Accept 862 - For
this shipping address, select one of the following:

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

Default Customer
- VISUAL assumes this address accepts Customer Orders based of the
setting on the E-Commerce tab of the Customer Maintenance window.

Yes - This shipping
address accepts Customer Orders regardless of the setting on the E-Commerce
tab of the Customer Maintenance window.

No - This shipping
address does NOT accept Customer Orders regardless of the setting
on the E-Commerce tab of the Customer Maintenance window.

Inter Consignee
- VISUAL allows up to 20 alphanumeric characters in this field.

Pool Code - VISUAL
allows up to 20 alphanumeric characters in this field.

Generate WSA (945)
- Generate ASN(GENERATE\_WSA) - For this
shipping address, select one of the following:

Default Customer
- VISUAL generates ASNs based on the setting on the E-Commerce tab
of the Customer Maintenance window.

Yes - VISUAL generates
ASNs regardless of the setting on the E-Commerce tab of the Customer
Maintenance window.

No - VISUAL does
NOT generate ASNs regardless of the setting on the E-Commerce tab
of the Customer Maintenance window.

Hold Transfer of WSAs
(HOLD\_TRANSFER\_WSA) - For this shipping address, select one
of the following:

Default Customer
- VISUAL holds the generation of WSAs based on the setting on the
E-Commerce tab of the Customer Maintenance window.

Yes - VISUAL holds
the generation of WSAs regardless of the setting on the E-Commerce
tab of the Customer Maintenance window.

No - VISUAL generates
WSAs regardless of the setting on the E-Commerce tab of the Customer
Maintenance window.

Customs Documentation:

Do Not Print -
Select the Do Not Print option button if
you don't want VISUAL to print customs documentation for this customer
shipping address.

Default Customer
- Select the Default Customer option button
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

7. Click Save
   to save these E-commerce settings for this customer shipping address.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Customer_Maintenance.htm) User-defined Help