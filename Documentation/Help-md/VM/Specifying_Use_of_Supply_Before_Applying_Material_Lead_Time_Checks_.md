Specifying Use of Supply Before Applying Material Lead Time Checks




# Specifying Use of Supply Before Applying Material Lead Time Checks

To consider material supply beyond work orders required dates,
select this check box. When you select this check box, the scheduler
ignores a work orders required date when locating material supply.
When sufficient supply is located, the work order is scheduled. If
sufficient supply cannot be located, then the materials lead time
is used to determine when the work order can be scheduled.

If you select this check box, then all parts in the site will use
all supply before applying lead time. You cannot override the setting
on the part record.

To consider material supply only up to the work orders required
date, clear this check box. When you clear this check box, the scheduler
does not look beyond the required date for supply when there is insufficient
supply at the required date. In this case, it applies the parts or
requirements lead time to determine if sufficient supply can be obtained
by the required date, or to determine when it can obtain sufficient
supply.

If you clear the check box in Site Maintenance, you can specify
on a part-by-part basis which setting to use. In Part Maintenance,
use the Supply Before Leadtime check box specify whether or not to
use the work orders required date when assessing supply.

The Concurrent Scheduler considers purchase orders, purchase order
delivery schedules, Coproducts, work orders, and, if netting planned
orders, planned orders, as supply.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Application_Global_Maintenance.md) User Defined Help