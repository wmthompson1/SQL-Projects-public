Planned Maintenance Line Item Table




# Planned Maintenance Line Item Table

The line item table contains the following columns:

Cust ID - The ID of the customer for whom
you are performing the maintenance.

Model - The model, if any, of the Equipment
ID. You specify this during new equipment entry.

Type - The type, if any, of the Equipment
ID. You specify this during new equipment entry.

Eng ID - The equipment Maintenance Engineering
ID. You specify this during new equipment entry.

Profile ID - The Maintenance Profile ID
of the equipment. The profile instructs VISUAL when to schedule the
equipment for service. Profiles dictate to VISUAL the number of days
it should allow to lapse between service, as part of a daily, weekly,
monthly, or yearly schedule. Without profiles, VISUAL cannot schedule
maintenance for a piece of equipment.

Job Date - The date on which the maintenance
job is scheduled to occur. For a piece of equipment with a profile
for which you have set a daily frequency preference, using an occurrence
rate of every six days, with a coverage range of 3/3/2001 - 5/31/2001,
VISUAL schedules a series like this:

3/9/2001, 3/15/2001, 3/21/2001, 3/27/2001, 4/2/2001, 4/8/2001, 4/14/2001,
4/20/2001, 4/26/2001, 5/2/2001, 5/8/2001, 5/14/2001, 5/20/2001, 5/26/2001.

Engineer ID - The Engineer ID for the
equipment. You specify this during new equipment entry.

Job ID The work orders job ID.

WO? VISUAL places a Y or N in this column.
Until you choose to generate work orders, this value is N.

WO Type - The type of work order.

WO Base ID The Base ID of the work order.

WO Lot ID The Base ID of the work order.

WO Sub ID The Base ID of the work order.

Def Status The default status of the
work order. Set work order defaults by using the Edit menu option,
[Work
Order Defaults](Setting_a_Work_Order_Default_Status_Planned_Maintenance.md).

WO Create Date The date on which VISUAL
created the work order.

Equip ID - The ID of the piece of equipment.
You specify this during new equipment entry.

Internal - Either a Y or an N displays
in the column. If a maintenance job is internal, a Y appears; if it
is external, an N appears. You specify job location during new equipment
entry.

Cust Order The Customer Order ID if
the work order is attached to one.

Line No The line number in the customer
order to which the work order is attached.

Last Invoice The last Invoice ID created.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Planned_Maintenance.md) User-defined Help