Enabling Warehouse/Location Requirements for Allocations




# Enabling Warehouse/Location Requirements for Allocations

|  |  |
| --- | --- |
| POSTIT.gif | Before using allocations, decide if you want to enforce warehouse sameness. You have two choices: |

To allow allocations to be established regardless of Warehouse ID

Or-

To only allow allocations between the supply source and the demand
source if they have the same Warehouse ID

Infor VISUAL supports allocations anywhere quantities, either incoming
(supply) or outgoing (demand) can be specified and earmarked for a
specific purpose.

An allocation consists of two records, that, when linked, quantitatively
satisfy a source of demand.

For example, you can establish an allocation between an incoming
purchase order and an outgoing customer order. Even before that purchase
order arrives and is accepted into inventory, you can allocate it
to a customer order.

Read the following example to see how allocations can work for you.

A customer calls to place an order. Your customer sales
representative discusses the customer's requirements and enters an
order for the following assorted parts:

* 100 1/4Plates
* 500 Diodes
* 300 Assembly sets

Your customer service representative, entering the order using Customer
Order Entry, informs the customer that the 100 1/4plates and the 500
diodes are in stock, but the 300 assembly sets are not.

Checking the available inventory in warehouse MAIN, the warehouse
from which your company does most of its shipping, the customer service
rep sees a quantity of 100 assembly sets.

At this point, the rep informs the customer of the insufficient
stock and asks if they can accept a partial delivery, with the remainder
of the assemble sets to arrive two days later, when a purchase order
containing 10,000 assembly sets is due to arrive at Warehouse MAIN.

The customer, not in any great rush for the entire quantity, agrees
to accept a shipment of 100 1/4Plates, 500 diodes, and 100 assemble
sets, with the remaining 200 assembly sets to follow in a later shipment.

The customer service rep thanks the customer for their order, completes
the order's details, and gives a delivery date for the order.

Off the phone with the customer, the rep must now create an allocation
from the inbound purchase order to the customer order.

Using the Edit menu option, Assign Supply to
Customer Order Line, the rep chooses a type of supply, in this
case PO for purchase order, locates the incoming line (well call
this PO 40003-25), enters an allocate quantity (the quantity from
the purchase order you want to earmark for the customer order) and
saves the link.

|  |  |
| --- | --- |
| POSTIT.gif | What happens at this point depends on your Global Allocation setting, which is set in Accounting Entity Maintenance, from the Order Management tab. |

Status: Warehouse IDs required for Allocations.
This setting is useful if you want to enforce logistically realistic
allocations. That is, this setting forces both the incoming and outgoing
to have a warehouse in common. If a purchase order is due to arrive
at warehouse MAIN, the customer order to which it is linked must be
shipped from Warehouse MAIN. If you allow allocations irrespective
of Warehouse IDs (the check box cleared, as seen below) you could
theoretically link an outgoing customer order leaving from a warehouse
in the US to a purchase order arriving at a warehouse in another country.

VISUAL enforces this requirement by forcing you to supply a Warehouse
ID before it will even save an order.

Status: Warehouse IDs not required for
Allocations. As long as the two orders you want to link contain the
same Part ID, you can create a link regardless of Warehouse ID.

A few days pass. The first part of the order is shipped without
incident and the customer is pleased. The day after the first part
of the order ships, the purchase order for the assemble sets arrives.
While receiving it, a member of the Shipping/Receiving team notices
an allocation exists between a quantity from PO 40003-25 and a customer
order. He sets those aside and ships them immediately.

Calling upstairs to the customer service rep, the shipping/receiving
employee lets the customer service rep know that he has seen the allocation
record and taken the appropriate action to ship it, thereby fulfilling
the promise of supply.

Several days later, the Customer Service rep places a followup call
to see if everything arrived on time and in good condition.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Order_Management_Window.md) User-defined Help