Backflush Settings and Behavior




# Backflush Settings and Behavior

This table shows the labor tickets that are generated
when you ship a customer order linked to a work order or receive the
material into inventory. Note that the Autogen Labor During Receipt
check box must be selected. To backflush legs, the last operation
on the leg must also use an auto-reporting resource

| Site Maintenance settings | Data backflushed to last operation in work order | Data backflushed to preceding auto-reporting resources in same sub ID | Data backflushed to legs |
| Backflush Subordinate Legs check box cleared  Generate Labor Tickets During Backflush check box cleared | Auto-reporting resources: Quantity  Standard resources: Quantity (0-value labor ticket) | Qty | n/a |
| Backflush Subordinate Legs check box selected  Generate Labor Tickets During Backflush check box cleared | Auto-reporting resources: Quantity  Standard resources: Quantity (0-value labor ticket) | Qty | Qty |
| Backflush Subordinate Legs check box cleared  Generate Labor Tickets During Backflush check box selected | Auto-reporting resources: Quantity, Hrs, Cost, Setup  Standard resources: Quantity (0-value labor ticket) | Qty, Hrs, Cost | n/a |
| Backflush Subordinate Legs check box selected  Generate Labor Tickets During Backflush check box selected | Auto-reporting resources: Quantity, Hrs, Cost, Setup  Standard resources: Quantity (0-value labor ticket) | Qty, Hrs, Cost | Qty, Hrs, Cost |

This table shows the labor tickets that are generated when you enter
a labor ticket for an operation. To generate backflush transactions
from a labor ticket, the last operation on the work order cannot use
an auto-reporting resource. To backflush legs, the last operation
on the leg must also use an auto-reporting resource:

| Settings | Preceding Ops Same Sub ID | Legs |
| Backflush Subordinate Legs check box cleared  Generate Labor Tickets During Backflush check box cleared | Qty | n/a |
| Backflush Subordinate Legs check box selected  Generate Labor Tickets During Backflush check box cleared | Qty, Hrs, Cost | n/a |
| Backflush Subordinate Legs check box cleared  Generate Labor Tickets During Backflush check box selected | Qty | Qty |
| Backflush Subordinate Legs check box selected  Generate Labor Tickets During Backflush check box selected | Qty, Hrs, Cost | Qty, Hrs, Cost |

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Backflushing_Labor_Tickets.md)
Working with Backflushing