What is Return Material Authorization?




# What is Return Material Authorization?

A Return Material Authorization (RMA) is a document
that controls the return of some part or parts previously sold and
shipped to a customer.

A standard RMA procedure is similar to this:

1. The customer calls customer
   support. The support representative and the customer agree to
   a return of the material for repair, replacement, or credit.
2. The support representative
   assigns an RMA number for the return and gives it to the customer
   for reference. The support representative tells the customer to
   clearly mark the package with the RMA number.
3. When the manufacturer
   receives the package, the RMA number is queried and verified as
   a valid return authorization. The materials are received and routed
   to the proper person.
4. If necessary, the returned
   materials are evaluated. You can create a work order to track
   the cost of the evaluation and prepare a quote for anticipated
   repair costs.
5. If the customer is returning
   the material replacement or repair, the manufacturer must ship
   materials back to the customer. Repair implies that the manufacturer
   must dispatch a work order. In both cases a shipment will occur.
6. If the customer is returning
   the material for credit, receipt of the material causes the system
   to create a credit memo for the customer. No shipment will occur
   in this case.

An RMA is a fairly simple document containing an ID, status, and
some other identification of who is returning the material and for
what purpose. Costing issues get complicated when repairs and replacements
are at issue, especially when you take in to consideration that the
original customer order may not exist in the system or the parts being
repaired are originally from another source.

## RMA Types

Four types of RMAs are supported:

Evaluation Use the evaluation RMA to
assess the issue with the returned item. As part of the evaluation
process, you can create a quote for anticipated repair costs. If your
customer proceeds with the repair, you can use the quote to build
the repair work order. You can also use the quote as the source of
pricing on the customer order for the repair.

You can build a work order for the evaluation process. Use the work
order to track the costs associated with evaluating the item. During
the evaluation process, any costs associated with the evaluation work
order are recorded against your Work in Process accounts. When you
change the evaluation RMA to another type of RMA or close the evaluation
RMA, the work order is cancelled and the costs are recorded against
your Cost of Goods Sold accounts.

At the end of the evaluation process, you can change the evaluation
RMA to any other type of RMA. If no further processing is required,
you can close the evaluation RMA.

Credit Use the credit RMA to refund
the cost of the material to the customer. After your company receives
the materials, the price of the original material is credited to the
customers account. The price is based on the original customer order,
if available.

Replace Use the replacement RMA to replace
the defective material. Shipment of the replacement material can occur
immediately, or may be delayed until the original material is returned.

Repair Use the repair RMA to repair
the material sent to the customer. Depending on the way you schedule
the repairs, this may involve a work order. If the repair RMA was
originally an evaluation RMA, you can use the quote you built during
the evaluation process as the basis for the repair work order. The
new work order tracks the value being added to the part, not the original
cost of the material. Because your company does not assume ownership
of the parts, there is no accounting entry required and the parts
are NOT brought into inventory or issued to the repair work order.

## RMA Statuses

These statuses are used for RMAs:

Open This status indicates that the
RMA is active.

Received This status indicates that
the customer has returned the materials. This status is selected by
the system when you specify the RMA ID on the Customer Order Shipment
Return dialog box. See [Receiving
Returned Materials](Receiving_Returned_Materials.htm).

Closed This status indicates that the
RMA process is complete.

Canceled/Void This status indicates
that the RMA process will not be completed. Use this status if a customer
never returns the materials specified on the RMA record.

On Hold This status indicates that the
RMA process is temporarily on hold. The RMA is not ready to be closed
or canceled, but processing has stopped.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Return_Material_Authorization.htm) User-defined Help