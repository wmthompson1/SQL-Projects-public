Entering Counts and Recounts




# Entering Counts and Recounts

When you enter a Tag # for a part that is traceable,
a Sub-Tag and Lot Number (or serial number, etc.) field appear. The
Sub-Tag field contains the sub-tag number; its label indicates the
total number of subtags. The lot number field shows the lot number
for this sub tag.

Consider, for example, three lots of a part in the location for
tag 27, numbered L001, L002, L003. Sub-tags 1, 2, and 3 have been
created for tag 27. When you enter 27 for the tag number, the Sub-Tag
and lot number field appear as follows:

|  |  |
| --- | --- |
| Sub-Tag (of 3) | 1 |
| Lot Number | L001 |

If you are entering a different sub-tag number, you can change the
sub-tag field to the number you cannot modify the lot number field;
it displays the lot number connected with the sub-tag. Enter quantities
in the normal way.

If a traceability profile is set up for a part, but no lots or serial
numbers exist, then no sub-tags are created for that part. Only a
normal tag is created. This could occur if you set up a profile for
the part during implementation, and adjusted in its quantity, but
never set up lots or used the part. This might also be the case if
you set a traceability profile for an existing part with on-hand quantities,
but didnt assign the existing balance to lots or serial numbers.

When this situation occurs, the lot number or serial number field
alone appears when the tag number is entered. If you want to complete
this count, you must use Part Trace Maintenance to preassign a number,
and then enter that number here. This assigns the total quantity to
the new lot, and create a sub-tag number.

You cannot use Enter Counts to assign a previously untraced quantity
to multiple lots. Instead, use Inventory Transaction Entry Adjust/In.

Sub-tags created in this way appear in Enter Recounts for the tag,
and in subsequent printings of tags and tag reports.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Part_Trace_Maintenance.htm) User-defined Help