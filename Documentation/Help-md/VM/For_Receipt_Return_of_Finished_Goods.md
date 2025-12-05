For Receipt Return of Finished Goods




# For Receipt Return of Finished Goods

This covers traceability for return of received finished
goods back into work in process. This applies when the Receiving option
is checked in the When to Apply section for the parts traceability
profile.

All lot numbers for the Part ID that has an unissued quantity remaining
appear. The others have been completely issued to other work orders,
or shipped to customers. Only these lot numbers appear; to return
a quantity to work in process, it must be in inventory. If it has
already been issued to meet another requirement or fill an order,
it would have to be returned first using Issue/Return of Shipping
Entry return.

It is unlikely that you would create a new lot number at this point,
as it would have been created upon the initial receipt or before that
point.

The system automatically fills in Quantity fields so as to distribute
the total adjustment across the lot numbers in the table. If you wish
to modify receipt return quantities, change the Quantity fields as
needed.

You can keep track of how much of the total receipt return Quantity
you have accounted for by watching the Numbered Quantity field at
the upper right. This field is the total of all entries in the Quantity
column. You usually want this to equal Total Quantity.

You are allowed to have Numbered Quantity be greater than or less
than Total Quantity. When you click the Close
button, VISUAL warns you and gives you the option to cancel or accept
the override. If you choose to override, VISUAL automatically changes
the receipt return Quantity for the transaction to the Numbered Quantity.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Part_Trace_Maintenance.htm) User-defined Help