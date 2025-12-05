Viewing Information in the Dashboard




# Viewing Information in the Dashboard

Use the DBR Dashboard tool to set up the basic information to view
in the dashboard. The information you select in the dashboard applies
to the tools you open.

Specify this information:

Site ID Specify the site ID to view.

Max # Buffers Specify the maximum number
of buffers to include in the tools.

Show Zones  Specify the buffer zones
to view in the tools.

Apply to All  Select this check
box to apply your buffer zone settings to all currently open tools.
Clear this check box if you do not want to apply your buffer zone
settings to currently open tools.

These tools are available:

Buffer Management  The Buffer Management
Tool is identical to the Buffer Management window. For procedures,
see [Managing
Buffers](Managing_Buffers.htm#XREF_24036_Managing_Buffers).

When you use the Buffer Management Tool, you can set the Site ID
using the Dashboard Toolbar or using the Site ID field in the Buffer
Management Tool. It is recommended that you set the Site ID using
the Dashboard Toolbar. The site for all other buffer tools is set
using the Dashboard Toolbar, so setting the site directly in the Buffer
Management Tool can result in a mismatch of data between the Buffer
Management Tool and the other tools.

Shipping Buffer Status  Use this
tool to view the status of the shipping buffers attached to your work
orders.

CCR Buffer Status Use this tool to view
the buffer status of your CCRs.

Assembly Buffer Status Use this tool
to view the status of your assembly buffers.

Replenishment Work Orders Buffer Status 
Use this tool to view the status of your replenishment work orders.

Purchase Order Buffer Status Use this
tool to view the status of your purchase order buffers.

Stocked Material Buffer Status Use this
tool to view the status of your stocked material buffers.

Resource Operations Buffer Status Graph 
Use this tool to view the buffer status of non-CCR operations.

Planned Load Graph  Use this tool
to view the load for resources you are tracking. When you select this
tool, specify this information:

Resource ID 
To view planned load information for a particular resource, select
the resource. Only the resources whose load you are monitoring are
displayed. To view planned load information for all resources whose
load you are monitoring, select \*All\*.

Load Horizon 
Specify the number of days from todays date to look for demand. The
value you specify here determines the end date of the demand horizon.

Create a Horizon Every 
To specify a subset of the load horizon, specify the subset in this
field. For example, if you specified 30 in the Load Horizon field,
but wanted to view demand information for every two days, specify
2 in this field.

Show Intermediate Horizons 
To display a line for every horizon subset as defined in the Create
a Horizon Every field, select this check box. To display a single
line for the horizon duration specified in the Load Horizon field,
clear this check box.

Apply Calendar Exceptions 
To take into account any calendar exceptions, select this check box.
To ignore calendar exceptions and use the standard shop schedule in
the load analysis, clear this check box.

Throughput See [Using
the Throughput Tool](Using_the_Throughput_Tool.htm).

Buffer Intrusions Percentage See [Using the
Buffer Intrusions Tool](Viewing_Percent_Buffer_Intrusions_Information.htm).