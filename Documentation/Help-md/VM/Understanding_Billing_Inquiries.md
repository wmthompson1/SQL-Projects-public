Understanding Billing Inquiries




# Understanding Billing Inquiries

VISUAL uses the Billable setting you select in WBS
Maintenance when calculating Provisional Billing Rate Inquiries.

The Provisional Rate Billing Inquiry dialog box has three sections:

General Information The section at the
top of the dialog box contains general information about the project.

Billable Section The Billable section
contains figures connected to the WBS Codes you have indicated as
being billable.

Non-billable Section The Non-billable
section contains figures connected to the WBS Codes you have indicated
as being non-billable.

|  |  |
| --- | --- |
| POSTIT.gif | To access nested rate analysis information, double-click a category. A secondary dialog box appears with individual lines for each account within the selected category. |

## Understanding Billable Costs

|  |  |
| --- | --- |
| POSTIT.gif | Negative values appear in parentheses. |

For each billable cost element the following information appears:

WBS If you chose to sort the table by
WBS code, the WBS column appears with costs broken out by WBS code.

CLIN - If you chose to sort the table
by CLIN code, the CLIN column contains the contract line item number
associated with the costs.

Cap / Ceiling Cost Element The cost
element that generated the amount.

Prior Hours A summarization of hours
occurring before start date.

Prior Amounts A summarization of amounts
occurring before start date.

Period Hours A summarization of hours
falling between the start and end dates of the date period you entered.

Period Amount A summarization of amounts
falling between the start and end dates of the date period you entered.

Ceiling Percentage The percentage you
specified as a ceiling for the project appears.

Ceiling Hours The number of hours you
specified as a ceiling for the project appears. Set up ceilings in
the [Billing
Ceilings](Step_4_Entering_Project_Billing_Caps_and_Ceilings.md) dialog box in Project Maintenance.

Ceiling Amounts The amount you specified
as a ceiling for the project appears. Set up ceilings in the [Billing
Ceilings](Step_4_Entering_Project_Billing_Caps_and_Ceilings.md) dialog box in Project Maintenance.

Over/Under Hours VISUAL calculates the
over or under hours using the following:

(Prior Amounts + Period amounts) Cap/Ceiling Amounts

Over/Under Amounts VISUAL calculates
the over or under amounts using the following:

(Cap/Ceiling Amount Prior Amount) = Over/Under Amount

If the Over/Under Amount is less than or equal to the Period amount,
the figure appears as a positive amount. If the Over/Under Amount
is greater than the period amount, the figure appears as a negative
value in parentheses.

Exceeded If any figure exceeds its Ceiling
at its lowest possible level a Y appears in the Exceed column.

For example, for a cost category of "Travel" with a ceiling
of $20,000 and actuals of $25,000, VISUAL marks the category with
a Y at the lowest level of reporting for that cost category.

VISUAL also posts any Y marked category to the highest level of
reporting for whatever Cost Element to which "Travel" belongs.

Billing Hours The potential number of
hours you can bill for this category.

Billing Amounts The potential amount
you can bill for this category.

## Understanding Non-billable Costs

For each non-billable cost element the following information appears
in the table:

Prior Hours A summarization of hours
occurring before start date.

Prior Amounts A summarization of amounts
occurring before start date.

Period Hours A summarization of hours
falling between the start and end dates of the date period you entered.

Period Amount A summarization of amounts
falling between the start and end dates of the date period you entered.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Provisional_Rate_Billing_Inquiry.md) User-defined Help