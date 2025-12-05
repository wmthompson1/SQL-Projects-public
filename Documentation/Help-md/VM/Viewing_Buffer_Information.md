Viewing Buffer Information




# Viewing Buffer Information

To view buffer information:

1. Select Scheduling,
   DBR Maintenance.
2. If you are licensed
   to use multiple sites, click the Site ID button and select the
   site to view. If you are licensed to use a single site, this field
   is unavailable.
3. The table at the top
   displays the free work order buffer and the resources for which
   you have set up buffer information. To view your active CCRs only,
   select the Show active CCRs only check box. To view active and
   inactive CCRs, clear the check box.
4. Specify the information
   to view in the table at the bottom. Specify these settings:

Show Buffers For 
Specify the documents and parts to display in the table. Select one
or more of these check boxes: Work Orders, Eng. Masters, Stocked Parts,
and Purchase orders.

Show Time Buffers of
Type  Specify the buffers to display in the table. Select
one or more of these check boxes: Shipping, CCR, Assembly, Rods, Replenishment,
User Def.

5. Click Refresh.
   The buffers you selected are displayed in the table. For each
   buffer, this information is displayed:

Work Order ID 
The ID of the document or part is displayed. The types of documents
displayed are work order, engineering masters, and purchase orders.
For engineering masters, the letter M is displayed before the engineering
master ID. For purchase orders, the letter P is displayed before the
purchase order ID. A part ID is displayed if the line is for a stocked
part buffer.

Seq No 
For work orders and engineering masters, the sequence number of the
operation is displayed. For purchase orders, the line number is displayed.

Piece No 
For work orders and engineering masters, the piece number of the material
is displayed.

CCR ID 
If the buffer shown in the line is related to the CCR, the ID of the
CCR is displayed. Otherwise, the category of the buffer shown in the
line is displayed. These buffer categories are used:

PURC\_ORDER This
is displayed if the line shows the leadtime buffer for a purchase
order.

STOCKED\_PART
This is displayed if the line shows the replenishment level for a
stocked part.

USER\_DEFINED
This is displayed if the line shows a user-defined buffer.

Free W/O This
is displayed if the line shows the free work order shipping buffer.

Type The type
of buffer shown in the line is displayed. These types are used:

Shipping This is
displayed if the line shows the shipping buffer for the CCR or Free
W/O.

CCR  This is
displayed if the line shows the CCR buffer.

Assembly This is
displayed if the line shows the assembly buffer.

Rod This is displayed
if the line shows the rod buffer.

Replenish This
is displayed if the line shows a replenishment work order.

Assy+Ship 
This is displayed if the line shows an assembly buffer added to the
shipment buffer.

Stocked Part This
is displayed if the line shows the replenishment buffer for a stocked
part.

Repl. P/O 
This is displayed if the line shows a purchase order placed to replenish
a stocked part.

P/O This is displayed
if the line shows a purchase order.

State  The
state of the buffer is displayed. A buffer can be either active or
closed. If the buffers displayed are for an engineering master, then
Engineering Master is inserted in this column.

Factor See Adjusting
Buffer Sizes.

Service Time 
If an outside service precedes this operation, the amount of time
required for the service is displayed. The service time is calculated
by adding the service buffer specified for the resource in Shop Resource
Maintenance to the amount of time for the set up and run specified
for the service.

Size  The
size of the buffer is displayed. For time buffers, the amount of buffer
time in hours is displayed. For the replenishment buffer, the replenishment
level for the part as specified in Part Maintenance is displayed.

W/O DBR Type 
For work orders, the type of work order is displayed. These types
are used:

S The work order
is a made-to-stock work order.

O The work order
is a made-to-order work order.

R The work order
is a replenishment work order.

W/O DBR Priority 
For work order, the priority of the work order is displayed. These
types are used:

Emergency (E) 
If your stock level falls below the emergency stock percentage level,
DBR assigns a priority of Emergency.

On-time (O) 
This work order must be made on time. This work order should not be
rescheduled on a later date to satisfy material availability.

Normal (N) This
work order can be scheduled and manufactured normally.

Part ID The
part ID related to the order is displayed.

Warehouse ID 
The warehouse ID related to the part is displayed. If you plan by
independently planned warehouses and you are viewing replenishment
buffers, the warehouse-specific replenishment buffer for the part
is displayed. If you are planning by independently planned warehouses
and no warehouse ID is displayed, then the replenishment level displayed
is for your universally planned warehouses.

Warehouse IDs are also displayed for work
orders. This is the warehouse where the finished goods will be stored.