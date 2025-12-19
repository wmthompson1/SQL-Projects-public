Specifying Backflush Settings in Site Maintenance




# Specifying Backflush Settings in Site Maintenance

1. Select Admin,
   Site Maintenance.
2. In the Entity ID field,
   select the parent entity for the site for which you are setting
   up blackflush.
3. In the Site ID field,
   select the site.
4. Click the Defaults
   tab.
5. Specify these settings:

Autogen Labor During
Receipt Select this check box to backflush labor when you
receive a work order into inventory or when you ship a customer order
that is linked to a work order.

If you clear this check box, then backflushing
is triggered in labor entry only. If you clear this check box, then
the last operation in a work order must not use an auto-reporting
resource. You cannot manually report labor to an auto-reporting resource.

Default Employee
If you selected the Autogen Labor During Receipt check box, specify
the ID of the employee to use on labor tickets that are generated
when you ship a customer order that is linked to a work order.

Backflush Subordinate
Legs Select this option to backflush labor to subordinate
legs. In addition to selecting this check box, you must also specify
an auto-reporting resource on the last operation in the leg to initiate
the backflush of legs.

Generate Labor Tickets
During Backflush Select this check box to generate labor
tickets for operations that have been backflushed. The costs that
are specified on the Costs tab of the operation are used to determine
the labor costs.

Clear this check box if you do not want
to generate labor tickets for backflushed operations. If you clear
this check box, then backflushed operations do not have any labor
costs.

6. Click Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Backflushing_Labor_Tickets.md)
Working with Backflushing

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Labor_Ticket_Entry.md) User-defined Help