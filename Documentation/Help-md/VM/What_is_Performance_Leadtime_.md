What is Performance Leadtime?




# What is Performance Leadtime?

Use leadtime lifecycle to measure your performance
from quote to cash. You can specify the steps in the process and the
projected time each step should take. You can associate steps in your
process with these document types:

* Quote
* Sales Order
* Work Order
* Shipment
* RMA
* Invoice
* Payment

You do not need to include every document type in your processes.
For example, if you created a process for the sale of in-stock items,
you could omit work orders from your process. You create leadtime
processes at the site level.

After you design a leadtime process, assign the process to a part.
When you create a quote or sales order for the part, rows for each
step of the process are created in the PROCESS\_ACTIVITY table. As
you complete the steps, the PROCESS\_ACTIVITY table is updated with
the start date, end date, and actual duration of each step. You can
use built-in functionality, macros, or a combination to update the
PROCESS\_ACTIVITY table. The actual duration is compared to the standard
that you set up for the step.

You can use graphs and metrics that are built based on information
in the PROCESS\_ACTIVITY table to compare actual performance to the
process standards. You can use these graphs and metrics to identify
where your processes can be improved.

You can view leadtime information about a particular sale in the
Estimating Window, the Customer Order Entry window, and the Order
Management window.

You can evaluate the overall performance of leadtime processes in
the Dashboard.

See these topics:

* [Implementing
  Leadtime Processes](Implementing_Leadtime_Processes.htm)
* [Leadtime
  Process Template](Leadtime_Process_Template.htm)
* [Analzying
  Process Leadtime Information](Analzying_Process_Leadtime_Information.htm)

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Customer_Order_Entry.htm) User-defined Help