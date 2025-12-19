Specifying Information on the ECN Tab




# Specifying Information on the ECN Tab

If you use Engineering Change Notices (ECNs) to control changes
in your manufacturing processes, use the ECN tab to specify settings
for ECN control.

1. Click the ECN
   tab.
2. Specify these settings:

Modify ECNs with an on-hold
status To allow users to modify ECNs with an on-hold status,
select this check box. Clear this check box to prevent users from
modifying ECNs with an on-hold status.

Passwords required for
secured fields To require users to enter a password when
they enter data or change the status of secured fields, select this
check box. This functionality provides you with electronic signature
capability. To allow users to modify secured fields without entering
a password, clear this check box.

Generate all tasks simultaneously
To generate tasks for members of all of your ECN teams at the same
time when you change the ECNs status from Undefined, select this
check box. Clear this check box if you want to generate tasks for
only the first non-completed team. For example, Implementation team
members will not receive tasks until Authorization team members have
all signed off on their tasks.

Lock new engineering
change notifications To automatically lock all new ECNs,
select this check box.

Allow application of
ECN to unreported ops/reqs to in-process work orders To apply
ECNs to work order that are already in process, select this check
box. ECNs will be applied provided that labor has not already been
reported or material issued to the operations and requirements affected
by the ECN. For example: you have an engineering master with operations
A, B, and C. You enter an ECN that affects operation B.

In one work order based on the engineering
master, a labor ticket has already been entered against operation
B. In this case, the ECN would not be applied to the work order. In
another work order based on the engineering master, labor had been
reported to operation A but not to operation B. In this case, the
ECN would be applied.

If the ECN update has any impact on a requirement
or operation that has actual labor or material issues, the work order
will not be updated. For example, if an ECN changes a quantity per
on a leg header card, the work order will not be updated If labor
or materials have been applied under the leg.

If you select this check box, ECNs will
not be applied to split work orders or work orders with active demand
supply links.

Clear the check box if you do not want the
system to apply ECNs to any in-process work order.

One active ECN per part
Select this check box to allow only one active ECN per part master.
Clear this check box to allow multiple ECNs to be applied to a single
part master.

One active ECN per document
Select this check box to allow only one active ECN per document.
Clear this check box to allow multiple ECNs to be applied to a document.

One active ECN per work
order Select this check box to allow only one active ECN
per work order. Clear this check box to allow multiple ECNs to be
applied to a work order.

One active ECN per engineering
master Select this check box to allow only one active ECN
per engineering master. Clear this check box to allow multiple ECNs
to be applied to an engineering master.

One Active ECN per project
Select this check box to allow only one active ECN per project.
Clear this check box to allow multiple ECNs to be applied to a project.

3. Click Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Application_Global_Maintenance.md) User Defined Help