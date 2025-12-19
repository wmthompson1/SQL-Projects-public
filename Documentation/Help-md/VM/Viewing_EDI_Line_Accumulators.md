Viewing EDI Line Accumulators




# Viewing EDI Line Accumulators

Use EDI Line Accumulators to track shipments, view in transit quantities,
adjust total ship quantities to ensure accurate historical data values,
and adjust delivery schedule lines.

1. Select the line for
   which you want to view line accumulators.
2. Click the Accums
   button or select Order Accumulators from the EDI menu.

The Line Accumulators dialog box appears.

The Release number of the order appears
in the Release Number field at the top.

The only editable field in the dialog box
is the Shipment Adjust field.

The following fields display information
the customer receives via EDI:

CUM Date - The
date for which the accumulated quantity applies. Typically, the date
of the last shipment receipt. VMDI Exchange imports this data.

CUM Quantity -
The total accumulated quantity of this part the customer has received
as of the CUM date. VMDI Exchange imports this data.

Discrepancy -
The difference between the customers CUM quantity and the VISUAL
Accumulated Shipments quantity.

In Transit Quantity
- The quantity shipped between the customers CUM Date and VISUALs
last Ship Date.

Last Ship Date
- The date on which VISUAL last shipped quantities to this customer.

Accumulated Shipments
- The total quantity shipped to this customer by the last Shipped
Date. VISUAL calculates this value.

Shipment Adjust
- This value reconciles, for historical data keeping purposes, the
total Accumulated Shipments quantity to a customer. Enter a value
here if you need to add or subtract from the Accumulated Shipments
that VISUAL has calculated.

Total Shipments
- The total shipments you have made to the customer. The accumulated
shipments plus of minus the adjustment quantity. See above.

The following fields appear in the Customer
Authorization section:

Fab (Build) -
The quantity the customer has authorized you to build. In the Current
field, the amount the customer currently has authorized you to build
appears. In the High Qty field, the highest authorized build quantity
to date appears. In the High Date field, the date on which the high
point was reached appears.

Raw (Buy) - The
quantity for which the customer has authorized you to buy raw materials.
In the Current field, the amount the customer currently has authorized
you to buy appears. In the High Qty field, the highest quantity authorized
by the customer to date appears. In the High Date field, the date
on which the high point was reached

3. Click the Save
   button to commit this information. Click the Cancel
   button to exit the dialog box and return to the Customer Order
   Entry window.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Viewing_EDI_Accumulators.md)
Viewing EDI Accumulators

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Editing_EDI_Accumulator_Fields.md) Editing EDI Accumulator Fields

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Customer_Order_Entry.md) User-defined Help