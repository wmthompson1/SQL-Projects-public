MRP and Master Scheduled Parts




# MRP and Master Scheduled Parts

In order to accurately determine how many units to
build for a period, most manufacturers use a series of calculations
to determine their net supply plan, or build plan for a period.

In basic terms, the supply plan is what must be supplied (fabricated
or purchased) in order to meet the demand (forecast).

In some cases, they determine the net supply plan by subtracting
their current inventory from the current projected demand (forecast).
By doing so, they are determining what they need to build or buy for
the period. This calculation needs exercise at all levels of manufacture,
starting at the finished goods level, and continuing all the way to
the component piece part level. MRP performs this calculation for
all materials with an order policy of master scheduled.

The supply plan is made up of three types of supply orders: Released
orders, Firmed orders, and Planned orders. Because you control released
and firmed orders, VISUAL does not reschedule them during an MRP run.
VISUAL generates planned orders during an MRP run when it finds supply
orders to be less than demand. Planned orders alert you that you should
increase the orders to meet demand.

For master scheduled parts, you can decide whether to apply minimum,
maximum, and multiple rules when you run MRP.