Preparing Manufacturing Journals Using the Service




# Preparing Manufacturing Journals Using the Service

You can use the Costing Service to run costing only in the current
period or the period immediately prior to the current period. In both
cases the period prior to the period in which you are running costing
must be closed.

For example, presume you use a monthly financial calendar. Today
is April 24th and the service is scheduled to run. This table shows
scenarios when the Costing Service can be used and when the costing
service cannot be used:

|  |  |
| --- | --- |
| **Scenario** | **Can I use the Costing Service?** |
| April is open and March is closed. | **Yes.** Costing is run for April. The default posting date used for journals is April 30. |
| April is open, March is open, and February is closed. | **Yes.** Costing is run for March. The default posting date used for journals is March 31. |
| April is open, March is open, February is closed, and January is open. | **Yes.** Costing is run for March only. The default posting date used for journals is March 31. |
| April is open, March is open, and February is open. | **No.** The Costing Service can only run costing in the current period or in the period immediately prior to the current period. |
| April is open, March is open, but manufacturing journals have already been prepared or posted in April. | **No.** You should run costing manually to ensure that costs are generated as you expect. |
| April is closed, March is open, and February is closed. | **Yes.** Costing is run for March, provided that no manufacturing journals have been prepared or posted in April. |

These rules and scenarios apply to journal preparation only. You
can run receipt transaction costing and inventory transaction costing
with the service at any time.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Costing_Utilities.md) User-defined Help