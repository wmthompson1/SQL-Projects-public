Material Movement




# Material Movement

The following four scenarios are possible with VISUAL
BTS material movement:

* Any Warehouse/Location to
  Any Warehouse/Location
* Primary Warehouse/Location
  to Any Warehouse/Location
* Any Warehouse/Location to Auto-Issue Warehouse/Location
* Any Warehouse/Location to
  Inspection Warehouse/Location

## Any Warehouse/Location to Any Warehouse/Location

This transaction will move material from any warehouse/location
to any other warehouse/location. It is the core of the following transactions,
which provides all the basic functionality of the BTS-BI module.

## Primary Warehouse/Location to Any Warehouse/Location

This transaction will move material from the Primary warehouse/location
defined for the part to any other warehouse/location. It provides
a shorthand method to move material with less scans required, as it
will assume the From warehouse/location. It will prompt for a warehouse/location
if there isnt a primary warehouse/location defined.

## Any Warehouse/Location to Auto-Issue Warehouse/Location

This transaction will move material from any warehouse/location
to the Auto-Issue warehouse/location defined for that part. It provides
a shorthand method, which will require less scanning for the transaction.
It will prompt for a warehouse/location if there isnt one defined
as the Auto-issue Warehouse/Location in the part master.

## Any Warehouse/Location to Inspection Warehouse/Location

This transaction will move material from any warehouse/location
to the Inspection warehouse/location defined for that part. It provides
a shorthand method, which will require less scanning for the transaction.
It will prompt for a warehouse/location if there isnt one defined
as the Inspection Warehouse/Location in the part master.

![btn_mini.gif](btn_mini.gif "btn_mini.gif") User
Defined Information