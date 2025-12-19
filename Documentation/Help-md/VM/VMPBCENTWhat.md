What is Progress Billing Entry?




# What is Progress Billing Entry?

Progress billing is the procedure of billing a customer
incrementally for goods and/or services before the actual goods or
services are available for you to deliver. For example, a customer
may have contracted your company for a project that takes months to
complete. The customer has agreed to pay a prearranged amount at certain
times over the life of the project, or at the completion of predetermined
operations of the work order.

Progress costing is the procedure of expensing costs incrementally
for goods and/or services as a result of revenue recognition taking
place during progress billing.

The action VISUAL takes at each event is subject to the agreement
made between your company and the customer and is affected by accepted
accounting practices. Progress Billing and Progress Costing allow
you to implement almost any billing and costing scheme.

If you are licensed to use multiple sites, set up progress billing
on a site-by-site basis.

## Billing Events

A billing event is a pre-planned step that results in the creation
of an invoice for presentation to the customer, and a posting to the
G/L based on revenue recognition parameters that you have set up on
that event.

Billing is organized as a user-defined series of events. You can
define events for each customer order line item. Each line item may
have virtually any number of events.

There are two mechanisms that trigger events: event dates and milestone
IDs. An event date is a date that you specify. A milestone is associated
with an operation in a work order.

During analysis of the event table, the user-defined event date
is compared to the run date of the program. If the event date is less
than or equal to the run date of the program, the event is triggered.
If the date does not trigger the event, each operation of the related
work order having the same Milestone ID is examined. If all operations
in the set are closed (or cancelled) the event triggers. Only events
that have not yet been triggered are analyzed. Therefore,
if you set the triggered flag manually, the event is never considered
for triggering.

You can specify revenue recognition as either a flat amount or a
percentage of the customer order line, not both. You can also define
the account to be credited.

You can define the amount to bill as either a flat amount or a percentage,
not both. Billing amount and revenue recognition are independent of
each other.

Costing is a function of milestone completion and is associated
with revenue recognition. VISUAL performs costing from the milestone
and work order point of view and recognizes revenue from the event
and billing point of view. It is important to note that VISUAL carries
out costing (i.e., cost of goods sold based on Revenue Recognition)
as milestones complete; however, billing cannot be triggered from
a milestone in this circumstance. VISUAL warns you when this connection
is missing.

## How Does Billing Occur?

VISUAL carries out billing via one or more A/R invoices prepared
specifically from event information. Note that the shipping of a line
item automatically disables billing as a function of events. Pre-shipment
invoices are only created by events if the line item ship quantity
is zero.

VISUAL marks all billing invoices with the order ID having the events
that triggered the prepayment invoices. This is the same for prepayments
invoices; the invoice generator program needs no change to handle
shipment-generated invoices.

## Recognizing Revenue

You can set the intervals at which your company recognizes revenue
during the life of the customer order. Revenue recognition is usually
tied to the recognition of costs (the ability to expense costs to
cost of goods sold). You cannot recognize the cost of selling something
unless you also recognize the price you paid for it. The difference
is the gross profit margin of the particular sale. While your company
is manufacturing an item, it is an asset whose value is continuously
increasing. When you ship the item, it loses its status as an asset
and becomes both revenue and the cost of delivering the item.

Long-term projects often occur across accounting period boundaries;
therefore, your company is not making any money on this project while
it is in process. Progress Billing allows you to obtain payment for
goods while they are being created, typically by satisfying the customers
set milestones in process. When the project is completed to a specified
point, the customer agrees to pay your company for the work done to
that point. You can establish several milestones.

When you receive payment from the customer, you must either accept
the payment as a deposit without any revenue recognition or accept
it as real revenue. Accepting the payment as real revenue usually
occurs only when the customers payment is nonrefundable.

## Costing

The Costing Utilities are responsible for calculating the value
of all active work orders and the posting of that value as of a given
point in time. Two types of postings occur for work orders: a work
in process posting and a finished goods receipt posting.

Progress Billing and costing affects work in process postings based
on revenue recognition.

For example, consider an operation that is associated with Milestone
A. When the operation is complete (i.e., the status is closed and/or
the quantity reported is at or above the end quantity of the operation),
VISUAL recognizes that the cost of that operation must be expensed
according to Milestone As setup. Assume that only sequence 10 is
in that milestone, and that all other operations are either in another
milestone or are not associated with a milestone at all.

The posting for the finished goods receipt side of the work order
includes a debit to the milestones expense account, and a credit
to the work in process account for the work order.

Ultimately, VISUAL posts all work orders to finished goods inventory.
The cost of goods sold is a function of the shipment. Costs flow from
work in process, to finished goods inventory, to cost of goods sold.
This flow is caused by inputs to work in process such as issues and
labor, then by receipts to finished goods inventory (which may be
the result of a shipment), and then by shipments to the customer.
Each step must take place to provide the necessary audit of the process
via the manufacturing journals. This means that costs expensed from
milestones are temporary in nature. When the order is finally closed
and fully received, the value is debited to finished goods inventory
and credited from either work in process inventory or milestone expense
accounts.

In almost all cases, this action is merely a re-categorization of
the costs from the milestones expense account to the cost of goods
sold expense account, both part of the profit/loss statement. Only
if the shipment and receipt are separated (because no line item reference
was installed to the work order) can the re-categorization go from
the milestones expense account to the finished goods account, thereby
crossing the boundary from the profit/loss statement back to the balance
sheet.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Starting_Progress_Billing_Entry.md) Starting Progress Billing Entry

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Progress_Billing_Entry.md) User-defined Help