DBR Scheduling




# What is DBR Scheduling?

The DBR Scheduler is designed to help you produce only the materials
needed during a short time frame.

## Details of the Scheduling Process

This process is used to schedule work orders and generate planned
orders:

The preferences you specified in the DBR schedule dialog are read.

The scheduler prevents other users from trying to generate a schedule
at the same time you are generating a schedule.

The DBR settings are loaded. DBR settings include the buffers set
up for the free work order and the CCR, if applicable.

Existing demand and supply links, including any links created by
the Concurrent Scheduler, are deleted, with these exceptions:

* Links that have inventory
  demand and a work order or co-product as supply are not deleted
  if the work order is firmed or released. These are assumed to
  be for safety stock replenishment
* Links that have a work order
  requirement as demand and a P/O or P/O delivery schedule as supply
  and have a received quantity against the link are not deleted.
  It is assumed that these are in inspection or have been issued.
* If nested MTO orders are
  being created and nested MTO links are not being deleted, then
  links that have a work order requirement as demand and have a
  work order or co-product as supply are only deleted if:
* The
  supply work order is cancelled, closed or unreleased, or
* The demand
  work order, that contains the requirement, is cancelled, closed
  or unreleased, or
* The demand
  requirement is cancelled, closed or unreleased

If the current schedule is the site's production schedule then delete
any planned orders belonging to the site.

Work orders belonging to the site are loaded. This information is
loaded: schedule independent information from main work orders, co-products,
sub-assemblies, operations, requirements and requirement demand/supply
links.

If a CCR has been defined, the CCR's resource information is loaded,
including the resource's calendar and capacity information.

The sites stocked parts are loaded into memory, including quantity
information, buffer/lead-time information, the primary warehouse,
min/max/multiple order information and other part setting information.
If the site is being planned by warehouse, then the part information
comes from the part warehouse for independently planned warehouses.

Any audit records from a previous scheduling run are deleted.

The sites "schedule" work orders are loaded, including
schedule dependent information from main work orders, sub-assemblies,
operations and requirements.

The selected schedule is loaded.

The current scheduling information for the schedule is loaded, unless
you are creating a DBR Planning Schedule. If you are creating a DBR
Planning Schedule, then the previous schedule is left as-is. If the
schedule is loaded, then:

* The schedule is determined
  based on the date specified in the Schedule As Of Date field.
* The existing schedule is
  deleted from the database.

The DBR Planning Schedule process is performed:

* Supply is loaded:
* Supply from
  MTO work orders and co-products are loaded.
* Supply from
  MTS work orders and co-products are loaded.
* Supply from
  purchase orders and those IBTs from a consigned warehouse are
  loaded. Supply is loaded in the order of the supply date.
* If the supply
  is for a stocked part, then the purchase order replenish quantity
  is updated. The new quantity is added to the stocked parts 1/3
  horizon quantity.
* Demand from customer orders,
  work order requirements (if nested-MTO is selected) and those
  IBTs supplying a consigned warehouse are loaded.
* Demand is
  loaded in the order of the customer order, work order, or IBT
  required date.
* Any demand
  beyond the scheduling horizon is ignored.
* If the demand
  has any supply links, then they are loaded and linked to the demand.
* If the demand
  is for a stocked part and the demand is required within 1/3 of
  the part's demand horizon, then the quantity is added to the stocked
  part's 1/3 horizon quantity.
* Netting is performed to
  assign supply to demand. If the plan by independent warehouse
  option is selected then the netting is done for each independent
  warehouse separately and for the aggregate of universal warehouses.
  If the option is not selected, then the netting is done for all
  warehouses as an aggregate.
* Excess supply is processed.
  Only non-replenishment work orders are considered for excess supply.
  MTO orders are deleted or unreleased if they are not supplying
  any demand, with these exceptions:
* If the Allow
  Excess Supply check box has been selected on the work order header,
  the work order is not changed. Any excess supply is allowed.
* If the work
  order has transactional history or is printed, the work order
  is changed to unreleased if your preference settings allow the
  unrelease of work orders. If your preference settings do not allow
  the unrelease of work orders that have history, are released,
  or are printed, then the work orders are not modified.
* If
  the work order is released and the unrelease of released orders
  is not allowed, then the work order is not modified.
* "Min/max/multiples
  of" order constraints are applied to the work order supply
  quantity. If this results in the surplus quantity not being able
  to be reduced, then the work order is not modified.
* If the work
  order has no transactional history, is not printed, or is not
  released, then:
* If no quantity is required
  by demand, then either delete or unreleased the work order, according
  to the "delete work order" preference.
* Otherwise, reduce the work
  order desired quantity to the quantity required by demand.

If only the DBR Planning Schedule (DPS) pass is being performed,
then processing is done. If you cleared the DBR Planning Schedule
Only check box, then the scheduling of the work orders begins. Work
orders are scheduled using this processing:

Each firmed and released work order remaining after the DPS process
is scheduled. If the previous schedule is being preserved, then only
new work orders are scheduled.

If the work order is a nested Make-to-Order (MTO), then the work
order is not scheduled at this point.  These are scheduled later
after the level zero (non-nested) MTO orders are scheduled and their
requirement required dates are known and can be used to determine
the nested (lower level) MTO work order want dates.

* Each work order is scheduled
  in the backward direction using infinite capacity. This determines
  when work would start on work orders if you had infinite capacity
  on your resources.
* If you have a CCR, the capacity
  constraints on each CCR are determined and resolved. Each CCR
  is processed from the CCR that has load that ends the latest in
  time to the CCR that has load that ends the earliest.
* After backward scheduling
  and the capacity constraints on the CCRs are determined and resolved,
  any operation scheduled to start before the Schedule As Of Date
  are adjusted to start on or after the Schedule as of Date. Each
  CCR is process from the CCR that has load that starts the earliest
  to the CCR that has load that starts the latest.
* If you preserved the previous
  schedule, the new schedule is merged with the previous schedule.

After all non-nested MTO work order are scheduled, nested MTO work
orders are created and scheduled.

After nested MTO work orders are scheduled, Make-to-Stock (MTS)
work orders are scheduled.

If there is a defined CCR, then these steps are performed.

The schedules feasibility is checked using the default CCR buffer.

The DBR Planning schedule is checked for validity.

Material releases are scheduled and the material release schedule
is checked for feasibility.

Nested MTO work order want dates are checked and updated.

If you selected the Run Save Setups option, setups are saved if
problem work orders exist.

The final schedule is saved.