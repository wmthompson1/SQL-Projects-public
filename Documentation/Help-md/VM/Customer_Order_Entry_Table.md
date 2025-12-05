Customer Order Entry Table




# Customer Order Entry Table

Depending on your table preferences the following
columns may be available:

[Ln#](javascript:void(0);)

[Quantity](javascript:void(0);)

[Job ID](javascript:void(0);)

[Lot ID](javascript:void(0);)

[Split ID](javascript:void(0);)

[New
W/O](javascript:void(0);)

[Part ID](javascript:void(0);)

[Cfgd](javascript:void(0);)

[Service Charge ID](javascript:void(0);)

[Misc Ref/Description](javascript:void(0);)

[U/M](javascript:void(0);)

[Unit Price](javascript:void(0);)

[Wholesale
Unit Cost](javascript:TextPopup(this))

This is the wholesale unit price from Part Maintenance.

[Disc%](javascript:void(0);)

[Extension](javascript:TextPopup(this))

The result of the Unit Price multiplied by the Quantity (minus
and dicount percent) appears in this field.

[Ship Date](javascript:void(0);)

[Promise Date](javascript:void(0);)

[Freight](javascript:void(0);)

[Comm%](javascript:void(0);)

[VAT Code](javascript:void(0);)

[VAT%](javascript:void(0);)

[VAT Amount](javascript:void(0);)

[Product Code](javascript:void(0);)

[Commodity Code](javascript:void(0);)

[Revenue
Account ID](javascript:TextPopup(this))

Specify any G/L Revenue Account ID associated with the line
item.

[Revenue
Account Description](javascript:TextPopup(this))

Description of the Revenue Account ID.

[Cust
Part ID](javascript:void(0);)

[Drawing
ID](javascript:TextPopup(this))

Identification for any drawing associated with the quoted line
item. These fields do not default from any drawing/rev defined
in Part Maintenance. However, if they are defined before editing
a quote master, they will be passed into the quote master as the
default Drawing ID and Rev associated with the master.

[Rev](javascript:TextPopup(this))

Revision level of the drawing given in the Drawing # field.

[Ln Closed
Short](javascript:TextPopup(this))

If the reference line can be shipped without fulfilling the
total requested order quantity, you can close the line short.
You can check the box to close the line short. If this box is
not checked, the line is not closed until the requested order
is reached.

[Specs](javascript:void(0);)

Piece Tracked

[Del Sched](javascript:TextPopup(this))

This check box is automatically is selected when the reference
line has a corresponding delivery schedule.

[Ship To
ID](javascript:TextPopup(this))

Specify or click on the header to select a different ship to
name and address.

[ATP](javascript:TextPopup(this))

Available to promise denotes the quantity available to ship.

[WIP/VAS
Unit Price](javascript:void(0);)

[Link Part
ID](javascript:TextPopup(this))

For allocation purposes. The ID of the part for which the customer
is placing the order. This is the same as the Part ID field.

[Link Warehouse
ID](javascript:TextPopup(this))

The ID of the warehouse from which you are assigning supply
to the order line.

[Allocate
Quantity](javascript:TextPopup(this))

The quantity to which you must allocate supply, either through
hard allocations or soft allocations against future receipts.

[Job Quantity
Unallocated](javascript:TextPopup(this))

The quantity of the part remaining in the warehouse from which
you are hard allocating supply to the order line.

[Total Quantity
Allocated](javascript:TextPopup(this))

The quantity that you have allocated to the C/O line. If VISUAL
finds sufficient supply in the customers primary warehouse, the
value that appears here after you save is equal to the quantity
of the C/O line, meaning that VISUAL has allocated full supply
to the line. However, it is possible to have a value in this field
that is less than the required quantity of a C/O line. In this
case, only soft allocations exist for the line; there is a portion
of the order quantity (desired quantity) for which you must still
allocate supply.

[Total Quantity
Fulfilled](javascript:TextPopup(this))

The quantity VISUAL has fulfilled from the supplying source.

[Accept
Early](javascript:TextPopup(this))

This box is selected by default if the customer accepts shipments
early. You can override this default setting clearing the box
for a specific line. Enter default Accept Early preferences for
this customer in Customer Maintenance.

[Days Early](javascript:TextPopup(this))

VISUAL fills in the number of days by which the customer accepts
shipments early. You can also override this field. Set a customers
default Days Early value in Customer Maintenance under the General
tab.