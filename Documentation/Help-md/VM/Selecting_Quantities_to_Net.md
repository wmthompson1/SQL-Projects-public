Selecting Quantities to Net




# Selecting Quantities to Net

To determine the quantity to use as the starting inventory
quantity, use these options:

Net Using Nettable Qty Select View,
Net Using Nettable Qty to use the nettable quantity of the part as
the starting inventory value when netting is started. If you select
this option, then the starting inventory values that are displayed
in the Material Planning Window match the starting inventory values
used by MRP. Nettable quantity is the sum of the quantity for all
locations in the PART\_LOCATION table for the part, warehouse, and
Site ID selected in the Material Planning Window. Quantities in Unavailable
and Transit locations are not considered in the calculation. If you
select this option, then the Net Using  Available Qty option
is unavailable.

Clear the Net Using Nettable Qty setting to use the on-hand quantity
of the part as the starting inventory value. If you use the on-hand
quantity, then quantities in all warehouse location are considered
regardless of the locations status.

Net Using Available Qty Select View,
Net Using Availability Qty to deduct On Hold quantities from the On
Hand quantity as the starting inventory value.

Deduct Safety Stock Select View, Deduct
Safety Stock to deduct the Safety Stock for the part from the quantity
used as the starting inventory value. Specify the safety stock quantity
in Part Maintenance.