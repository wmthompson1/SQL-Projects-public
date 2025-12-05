Setting Vendors Services




# Setting Vendor Services Supplied

The Vendor Services Supplied dialog box displays the
services provided for the specified vendor.

1. Select Purchasing,
   Outside Service Maintenance or Eng/Mfg, Outside Service
   Maintenance.
2. If you are licensed
   to use multiple sites, click the Site ID drop-down arrow and select
   the site that received pricing information from a vendor.
3. Click the Service
   ID browse button and select the service whose vendor pricing
   you want to set up.
4. Select Vendors
   Services Supplied option from the Maintain menu.

The Vendor Services Supplied dialog box
appears populated with the current service and its preferred vendor.

5. If you want to change
   the vendor, click the Vendor ID browse
   button and select the vendor you want.
6. Specify the following
   information:

Vendor Service ID
If the Vendor has a different ID for the service than you use in
your database, specify the vendor service ID.

Service ID Click
the arrow and select the service the vendor supplies.

Contract ID
If you have a formal contract with the vendor to provide certain pricing,
enter a contract ID. If you purchase the service from the vendor,
you can use the contract ID in Purchase Order Entry to generate the
correct unit price. If you do not specify a contract ID, the system
does not create a formal pricing contract with the vendor.

Contract Line Number
If you have a formal contract with the vendor, specify the contract
line number that refers to the services pricing structure.

Vendor Contract
If the vendor has its own identification system for the contract,
specify the contract ID.

Vendor CLIN
Specify the vendor contract line item number that refers to the services
pricing structure.

7. The system inserts the
   default currency ID the vendor uses above the Quote Date field.
   Specify the following information about the quote:

Quote Date Specify
the date the vendor submitted the quote.

Purchase U/M
Specify the unit of measure used to purchase the service. When you
receive the service, the system converts the unit of measure from
the purchase unit of measure to the stocking unit of measure.

Base Charge
If your vendor charges you a one-time base charge for this service,
enter the charge in the Base Charge field. If your vendor charges
you a set up fee, you may want to use the Base Charge to cover this
fee.

Minimum Charge
If your vendor charges you a minimum fee, enter it in the Minimum
Charge field. If you are only sending a few parts out for this service
and the Base Charge plus the service charge comes to less than the
minimum charge, VISUAL uses the minimum charge for its calculations.

Effective Date
Specify the date that the vendors pricing becomes effective. If
you are creating a contract, the date is also the effective date for
the contract line item.

Expiration Date
Specify the expiration date for the vendor pricing. If you are creating
a contract, the date is also the date that the contract line item
expires.

8. In the Quantity and
   Price table, specify the quantity breaks, prices, and leadtimes
   the vendor provided. The way you enter prices depend upon your
   Purchase Quote Type setting in Application Global Maintenance.
   If you have specified Qty Break tables, then the default price
   applies to quantities from 1 to the quantity you specify in the
   first quantity break. If you have specified Up To Quantity, then
   the default price applies to quantities greater than the largest
   up-to quantity you specify.

You must specify a default price. Optionally,
you can specify a default leadtime.

For other quantities, specify this information:

Quantity Specify
the quantity break or up-to quantity.

Price Specify
the price for each up-to or break quantity.

Leadtime Optionally,
specify how many days it takes for the vendor to deliver the quantity.
This field is informational only.

9. Click the Save
   button.

If you specified a Contract ID, the system
generates a contract with the vendor.

10. When you have finished
    entering quotes for this vendor, click the Close
    button.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Outside_Service_Maintenance.htm) User-defined Help

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Deleting_Vendor_Services.htm)
Deleting Vendor Services