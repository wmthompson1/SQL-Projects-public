Table Section Customer Shipments




# Table Section Customer Shipments

Depending on your table preferences the following
columns may be available:

* Supply Type
* [C/O
  Ln#](javascript:TextPopup(this))

  The Customer Order line number. The system numbers each
  line consecutively. If lines are deleted you can select the
  Renumber Lines option from the Edit menu.
* [Reference](javascript:TextPopup(this))

  Displays the contents of the Misc Ref/Descr column from
  the customer order. If the line is for an inventory part,
  Reference will be labeled Part, followed by the part description.
  If the line is linked to a work order, Reference will be labeled
  job, followed by the work order Base ID/Lot ID, and the Part
  ID, if there is one. If the line is a miscellaneous item,
  Reference will be labeled Misc.
* [Trc](javascript:TextPopup(this))

  This indicates whether the part is traceable.
* [Ship
  Date](javascript:TextPopup(this))

  Specify the date on which you want this line
  item shipped.
* Promise Date
* Qty Ordered
* Qty Shipped
* Quantity Allocated
* [Line
  Quantity Allocated](javascript:TextPopup(this))

  The quantity you have allocated to this customer order line
  from one of the six sources of supply. These include: CP (Coproducts),
  I (Inventory), PD (Purchase Order Delivery Schedule), PO (Purchase
  Order), WH (Interbranch Transfer), and WO (Work Order).
* [Cls](javascript:TextPopup(this))

  A check in this box indicates that the line
  item is closed. This field is set by the system when you choose
  to explicitly close line items that are being shipped short.
* [Ship
  Qty](javascript:TextPopup(this))

  The quantity of this item being shipped on this packlist.
  This field will initially be blank. Clicking into it will
  cause it to default to the remaining quantity to be shipped.
  The Ship All function will also automatically set it to this
  quantity. An entry is required.
* [Actual
  Freight](javascript:TextPopup(this))

  Specify the appropriate quantity in the Actual Freight column.
* [Location
  ID](javascript:TextPopup(this))

  Location within the selected warehouse where the part is
  stored. This is an automatic field, but can be changed. If
  the entry is changed, it must match one of the locations where
  the part is stored.
* [Warehouse
  ID](javascript:TextPopup(this))

  Specify the warehouse ID of the warehouse whose parts you
  want to count. When you Initialize Physical Count, only parts
  belonging to this warehouse are included in the count list.
* [Customer
  Part ID](javascript:TextPopup(this))

  The Part ID that the customer has assigned to this part.
* [Cartons](javascript:TextPopup(this))

  Specify the number of cartons on the pallet.
* [Shipping
  Weight](javascript:TextPopup(this))

  This is the shipping weight of one unit. It is intended
  to be used on an acknowledgment or pack list to give you some
  idea of the shipping weight.
* [Weight
  U/M](javascript:TextPopup(this))

  Specify or select the weight unit of measure for the part.
* [NMFC
  ID](javascript:TextPopup(this))

  Specify the National Motor Freight Code for the shipment,
  or double-click on the column header and select a code from
  the National Motor Freight Classes dialog.
* Package Type
* [Trans
  ID](javascript:TextPopup(this))

  A unique identifier assigned to each inventory transaction.
  An entry is required and is provided by the system. For new
  transactions this is always system provided. You may enter
  a Transaction ID manually in order to review a transaction.
* [Unit
  Price](javascript:TextPopup(this))

  Unit price for this item. For inventory parts, this unit
  price will default from the unit price defined in Vendors
  Supplying this Part for the specified quantity. If no vendor-specific
  price is defined, this price must be entered manually based
  on the vendor's quote or estimate. Unit prices for services
  and non-inventory parts must also be entered manually.
* [Shipping
  U/M](javascript:TextPopup(this))

  Specify the Unit of measure for the shipment.
* [Disc
  %](javascript:TextPopup(this))

  Any trade discount given on the line item, expressed as
  a percent. A numeric entry is required, this field will default
  to zero for new lines.
* [Comm%](javascript:TextPopup(this))

  Specify the commission percent.
* [VAT
  Code](javascript:TextPopup(this))

  The VAT Code automatically appears with default setup in
  Part Maintenance. You can select a VAT Code by double clicking
  on the VAT Code button.
* [G/L
  Rev Acct ID](javascript:TextPopup(this))

  The G/L Revenue Account for the shipment.
* [Ship
  Dimensions](javascript:TextPopup(this))

  Specify the shipping dimensions for the part.
* [Country
  of Origin](javascript:TextPopup(this))

  The country of origin of this customer order. Enter Countries
  of Origin in Application Global Maintenance using the HTS
  Codes Maintenance dialog box.
* [Material
  Code](javascript:TextPopup(this))

  The material code of the part on the order line. Enter material
  codes for parts in Part Maintenance from the Order Management
  tab.
* [ShipTo
  ID](javascript:TextPopup(this))

  The ID associated with the customers ShipTo address. If
  you did not specify a ShipTo ID in Customer Order Entry, you
  can do so now. See Chapter 15 for more information on entering
  ShipTo IDs for a customer; See Chapter 18 for more information
  on setting a Customers default ShipTo ID.
* [HTS
  Code](javascript:TextPopup(this))

  If an international order, a tariff by duty percent placed
  on the customer order. Enter HTS Codes in Application Global
  Maintenance under the Order Management tab. See Chapter 5
  for more information. Set default HTS Codes for parts in Part
  Maintenance from the Order Management tab. See Chapter 8 for
  more information.
* [Has
  Delivery Schedule](javascript:TextPopup(this))

  VISUAL selects this check box if the customer order line
  is a customer order delivery schedule line.