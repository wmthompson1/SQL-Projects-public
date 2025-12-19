Ending a Physical Inventory Count




# Ending a Physical Inventory Count

When a physical inventory count is completed and entered,
you need to signal the end of the count, and make adjustments if necessary.

1. If you are licensed
   to use multiple sites, click the Site ID arrow and select the
   site where you conducted the count. If you are licensed to use
   a single site, this field is unavailable.
2. In the table, select
   the physical inventory count.
3. Select End
   Physical Count from the File menu.

The End Physical Count dialog box appears.

If you used any blank tags, it is possible
that more than one count was entered for a single Part ID/Location
ID combination. If this has occurred, you are warned when this dialog
box first opens. When you proceed, you can examine the Duplicates
field as explained below to see how many duplicates exist. You can
use Review All Counts to void unwanted tags, and adjust others.

The dialog box shows the Count ID, Description
and Count Date of the current count. The dialog box also displays
the following read-only information about the count:

Starting Tag Number/Ending
Tag Number - The starting and ending tag numbers originally
assigned.

Counted Tags -
The number of active tags that have had a quantity entered through
Enter Counts or Review All Counts.

Uncounted Tags
- The number of active tags that have not had a Quantity entered.

Voided Tags -
The number of tags with status Void.

Total Tags - Total
number of created tags. Equal to Counted Tags + Uncounted Tags + Voided
Tags.

Duplicates - If
you used blank tags, the potential exists to have more than one count
entered for the same Part ID and location. This field shows how many
of these duplicates exist. If this field is not zero, a warning message
is shown when you start up this window. See above.

Recounted Tags
- The total number of tags that have had Quantity entered through
Enter Recounts, or re-entered in Review All Counts.

4. Select the appropriate
   ending actions.

You have the decisions to make when ending
the physical count:

Updating Part Balances
- In the normal physical inventory count, you probably want to allow
VISUAL to take the results of the counts and adjust part balances
accordingly. This executes Inventory Transaction Entry Adjust/In and
Adjust/Out transactions as necessary.

If you do not choose to do this, you have
to make any adjustments one by one. You may prefer to do this. For
example, you may need lower level control over the adjustment account
used. Choosing not to update is also useful when learning how Physical
Inventory Count works; you can start a count, enter some quantities,
and end it. If you do not keep the history (see below), the net effect
on the system will be zero.

Select whether to update by choosing the
appropriate radio button in the Ending Action section.

Keeping History
- You have the option of permanently retaining the counted tags, or
deleting them when the count is ended. The default is to discard them
-check the Keep History box if you want to keep the tags. You can
print tags and tag lists, review all counts, and run comparison reports
on these tags, but you cannot use Enter Counts or Enter Recounts,
and you cannot restart the count.

Zero part locations without
tags - This removes inventory for which you did not print tags.
It also removes inventory for which you did not specify a count quantity
on a tag.

Unlock Inventory for
all tags - Select this option if you want to unlock locked
locations and part inventory. You may have locked them when you initialized
the physical count in order to prevent transactions from occurring
against the parts currently under evaluation by physical inventory.

Zero Uncounted Tags (Write-off)
- When this check box is selected, the inventory is removed for every
part on an uncounted tag.

5. Click Ok
   to end the count, or Cancel to cancel
   the operation and return to the Physical Inventory Entry window.

If you selected Update Part Balances, the
adjustments are done now; this may take some time, depending on the
number of tags that need adjustments, and the speed of your system.
If you did not elect to retain the tags, they are deleted.

You are warned to have all users signed-off
the database. This is because many part records may be changing. Because
concurrent inventory transactions may not be possible, it is easiest
to perform this procedure at a low-use time.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Physical_Inventory_Count.md) User-defined Help