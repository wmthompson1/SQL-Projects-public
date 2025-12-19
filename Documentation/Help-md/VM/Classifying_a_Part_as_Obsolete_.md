Classifying a Part as Obsolete




# Classifying a Part as Obsolete

Infor VISUAL allows you to store virtually limitless
quantities of parts in your database. Of the thousands of parts you
may have entered over the life of your business, there may be some
parts that you seldom, if ever, use. These parts you may have created
as custom parts for an individual special order or a batch of orders,
and they may have little relevance to your enterprise now. If you
want to preserve the integrity of the PART table in your database
for historical and reporting purposes, and greatly reduce the chance
of erroneous part entry, you can classify a part as obsolete to remove
it from the active parts list and restrict its use. Classifying a
part as obsolete is a serious and far-reaching step but something
to consider before taking a more drastic measure such as purging data
from your database. After VISUAL checks for existing inventory activity
for the part, it allows the status change but places tight restrictions
on any and all activities involving the part.

To change a parts status to obsolete, select the Config
Mgt tab, and then select the Obsolete
check box.

VISUAL asks you to confirm the change.

When you save the part master, VISUAL checks to see if any existing
inventory transactions exist. If it finds any, it disallows the status
change to obsolete.

## Existing Parts and Obsolescence

You may not change an active parts status to obsolete
if that part has any outstanding inventory transactions pending against
it.

When you try to save the status change, VISUAL issues a warning
message.

Until all pending supply, demand, and inventory transactions for
the part have been resolved, you cannot change its status to Obsolete.

## New Parts and Obsolescence

For any new part, you can select a status of Obsolete.
Because the master is new and no pending supply, demand, or inventory
transactions exist for it, VISUAL allows the status but first warns
you that after a part becomes obsolete, you are severely limited in
what you can do with the part.

Chances are, you wont want to set a new parts status as Obsolete.
New parts usually are entered for a reason, whether it be on the fly
when creating a bill of materials or through Part Maintenance, so
be sure you want to make a new part Obsolete.

## Obsolete Parts Throughout VISUAL

Wherever parts are present in VISUAL, obsolete parts
apply. If you try to specify an obsolete part, wherever you happen
to be in VISUAL, you receive the same warning message.

## Reactivating Obsolete Parts

To make a part available again, clear the Obsolete
check box. If the product code specified for the part is inactive,
you are warned that you cannot clear the Obsolete check box. Either
select a different product code for the part or reactivate the product
code.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Part_Maintenance.md) User-defined Help