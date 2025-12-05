Resetting Costs From Standards




# Resetting Costs from Standards

As you add operations and materials to a master/work
order, VISUAL loads the standard costs for resources and materials
from the shop resource masters, service masters, and part masters.
Occasionally, you may override these values. Additionally, standards
change on some periodic basis.

The Reset Costs from Standards command allows you to refresh all
of the standard cost information from the original masters. If you
are licensed to use multiple sites, the site-specific standard costs
you defined are used to update the costs in the master.

To reset costs from standards:

1. Select Reset
   Costs from Standards from the Edit
   menu.

The Reset Cost dialog box appears.

This dialog box allows you to select which
combination of the three standards (operation, service, material)
you want to reset. The default is to reset all costs.

2. Click the appropriate
   check boxes for the standards you want to reset.
3. Click Ok
   to perform the update.

VISUAL updates all selected costs. Note
that VISUAL does not update non-inventory parts, as there is no corresponding
part master.

|  |  |
| --- | --- |
| POSTIT.gif | The maintenance applications have functions of their own that allow you to "push" the new values into multiple masters/work orders, rather than "pull" them from this side. Part Maintenance provides Reset Material Requirement Costs. Shop Resource Maintenance and Service Maintenance provide Reset Operation Costs. |

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Manufacturing_Window.htm) User-defined Help