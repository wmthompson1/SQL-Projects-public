Shipments and Line Statuses




# Shipments and Line Statuses

If a line has a status of Released, then the line is eligible for
shipment regardless of the header status.

If a line has a status of Inherit, then the line is eligible for
shipment only if these conditions are met:

* The order header has a status
  of Released
* The order line has remaining
  quantities to be shipped