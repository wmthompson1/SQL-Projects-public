Backdating IBT Shipments




# Backdating Shipments

When you backdate an IBT shipment, your ability to complete the
transaction depends upon the [Prevent
Negative Backdating setting specified for the site in Site Maintenance](Specifying_Information_on_the_General_Tab_site.md).

If the check box is selected, then the quantity you had on hand
on each date from the date of the transaction to the current date
is used to determine inventory levels. If you did not have sufficient
quantity on any one of the days between the date of the transaction
and the current the date, then the transaction cannot be completed.
For example, say you enter an IBT shipment on January 5 for 10 units,
but you specify January 3 as the transaction date. If you only had
8 units in your warehouse location on January 4, then you are prevented
from completing the backdated transaction.

If the check box is cleared, then the quantity you have on hand
on the date you enter the transaction is used to determine inventory
levels. For example, say you enter an IBT shipment on January 5 for
10 units, but you specify January 3 as the transaction date. If you
have 10 units on hand in the warehouse location on January 5, then
you can complete the transaction, even if you did not have 10 units
on hand on January 3 or January 4. When you clear the Prevent Negative
Backdating check box, you can generate negative inventory balances
for past dates, even though you do not allow negative inventory balances
for current dates.