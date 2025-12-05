Adding Vendor Quotes




# Adding Vendor Quotes

If your vendor has quoted you pricing for the part, specify the
vendor part pricing information in the Vendor Parts Supplied dialog
box. You can access this dialog box by selecting Maintain, Vendor
Parts Supplied or by clicking Edit Quotes in the Vendors Supplying
Part dialog box.

You can also create a contract ID to apply to the pricing. You can
use this contract ID in Purchase Order Entry to set the correct unit
price.

If you are licensed to use multiple sites, you must create vendor
quotes on a site-by-site basis.

|  |  |
| --- | --- |
| TIP.gif | You can also specify vendor pricing in Vendor RFQ Entry. When you approve a vendor quote in Vendor RFQ Entry, you can automatically update the pricing specified for the vendor on the part record. When you approve the quote, select the Create Part Master Vendor-quotes check box. The pricing structure specified on the RFQ is copied to the part record. See [Approving Quotes](Approving_Quotes.htm). |

To add vendor quotes for the part:

1. Select
   Inventory, Part Maintenance.
2. If
   you are licensed to use multiple sites, click the Site
   ID arrow and select the Site ID for which you are adding
   vendors. If you are licensed to use a single site, this field
   is unavailable.
3. In the Part ID field,
   click the browse button and select the Part ID. You must select
   a purchased part to activate the Vendors Supplying This Part dialog
   box.
4. Perform one of these
   steps:

* Select Maintain, Vendors Supplying
  This Part. Select the vendor part ID and click Edit
  Quotes.
* Select Maintain, Vendor Parts
  Supplied. Select the vendor, and then select the line containing
  the vendor part ID.

5. Specify this information:

Contract ID
If you have a formal contract with the vendor to provide certain pricing,
specify a contract ID. If you purchase the part from the vendor, you
can use the contract ID in Purchase Order Entry to generate the correct
unit price. If you do not specify a contract ID, a formal pricing
contract with the vendor is not created.

Contract Line Number
If you have a formal contract with the vendor, specify the contract
line number that refers to the parts pricing structure.

Vendor Contract
If the vendor has its own identification system for the contract,
specify the contract ID.

Vendor CLIN
Specify the vendor contract line item number that refers to the parts
pricing structure.

6. Specify the prices and
   quantity breaks for the part in the price break table. This information
   is used when creating purchase orders. Specify this information:

Quote Date Click
the calendar button and select the date to use for this quote. This
date is used to manage timely updates of price quotations. The default
date is the current date, but you can change it to any date.

Purchase U/M
Click the browse button and select the unit of measure in which you
purchase this part. When you receive this part, it is converted from
the Purchasing U/M to the Stocking U/M.

Effective Date
Click the calendar button and specify the date that the vendor pricing
becomes effective. If you specified a contract ID, this is the date
that the pricing in the contract line number becomes effective.

Expiration Date
Click the calendar button and specify the date that the vendor pricing
expires. If you specified a contract ID, this is the date that the
pricing on the contract line item expires.

7. In the Quantity and
   Price table, specify the quantity breaks and prices the vendor
   provided. The way you enter prices depend upon your Purchase Quote
   Type setting in Application Global Maintenance. If you have specified
   Qty Break tables, then the default price applies to quantities
   from 1 to the quantity you specify in the first quantity break.
   If you have specified Up To Quantity, then the default price applies
   to quantities greater than the largest up-to quantity you specify.
8. Click Save.