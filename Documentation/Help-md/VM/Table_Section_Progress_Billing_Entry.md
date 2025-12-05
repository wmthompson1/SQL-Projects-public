Table Section Progress Billing Entry




# Table Section Progress Billing Entry

Depending on your table preferences the following
columns may be available:

* [Ln
  #](javascript:TextPopup(this))

  The system numbers each line consecutively. If lines are
  deleted you can select the Renumber Lines option from the
  Edit menu.
* [Part ID](javascript:void(0);)
* [Description](javascript:TextPopup(this))

  Specify the full description of the item or service.
* [Customer
  Part ID](javascript:TextPopup(this))

  The Part ID that the customer has assigned to this part.
* [Order
  Qty](javascript:TextPopup(this))

  Quantity used by MRP when the order policy calls for a fixed
  order quantity or EOQ to replenish a pending out of stock
  condition. This number does not restrict other types of orders
  and is only used by MRP. An entry is not required.
* [Unit
  Price](javascript:TextPopup(this))

  Unit price for this item. For inventory parts, this unit
  price will default from the unit price defined in Vendors
  Supplying this Part for the specified quantity. If no vendor-specific
  price is defined, this price must be entered manually based
  on the vendor's quote or estimate. Unit prices for services
  and non-inventory parts must also be entered manually.
* [Disc
  %](javascript:TextPopup(this))

  Any trade discount given on the line item, expressed as
  a percent. A numeric entry is required, this field will default
  to zero for new lines.
* [Extension](javascript:TextPopup(this))

  The result of the Unit Price multiplied by the Quantity
  (minus and dicount percent) appears in this field.
* [U/M](javascript:TextPopup(this))

  The selling unit of measure for this item.
* Product Code
* [Commodity
  Code](javascript:TextPopup(this))

  A user defined commodity code. It can be used to define
  the class of material, especially in the case of purchased
  parts. If this information exists in the part table, it will
  appear here. This field will be carried forward to Customer
  Order Entry if an order is placed. An entry is not required.
* [Workorder
  ID](javascript:TextPopup(this))

  Base ID - Primary
  identifier for the work order.

  Lot ID - When work orders are
  subdivided into multiple lots, Lot ID specifies the specific
  lot. The default Lot ID for single-lot work orders is 1.

  Split ID - Split ID is included
  for future support of lot splitting. If not used for a manual
  split, Split ID will be 0.

  Sub ID - Sub ID specifies the
  leg of the work order being reported against. By convention,
  Sub ID 0 indicates the main leg.
* [Specs](javascript:void(0);)
* [Invoice
  Specs](javascript:TextPopup(this))

  A check mark appears in a check box in this column if specifications
  exist for this line item.
* [Billing
  Specs](javascript:TextPopup(this))

  A check mark appears in a check box in this
  column if specifications exist for this line item.