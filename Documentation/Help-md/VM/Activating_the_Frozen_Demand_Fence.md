Activating the Frozen Demand Fence




# Activating the Frozen Demand Fence

Basic MRP logic states that supply
must equal demand.

Whenever supply is less than demand, MRP creates a planned order.
A planned order is a message to you to increase supply orders to meet
demand order quantity and dates. You control the increase of supply
orders by changing the status of a planned order to firmed or released.
The basic difference between a firmed or released order and a planned
order is that firmed and released orders are not rescheduled during
an MRP run, while planned orders based on supplying needs are created
and scheduled .

You can generate planned orders in any timeframe within the Material
Planning Window. However, this also means that you can generate a
planned order in a timeframe that is too short to actually supply
the product.

For example, if you generate a planned order for product "X"
due for this week, and it takes 20 days to supply the product, then
it is unrealistic for you to firm or release the order with a due
date of this week. It is more realistic if you can schedule the order
to finish 20 days in the future.

As a solution, you have the option of establishing a global frozen
demand fence or a period within which planned orders will not be
created in Site Maintenance.

The frozen demand fence feature becomes active when you select the
Use Fence 1 as MRP Frozen period check box.
The frozen demand fence only applies to parts with an order policy
of "master schedule." Specify order policies for parts in
Part Maintenance.

The frozen demand fences is measured in calendar days.

The frozen demand fence does not allow you to create planned orders
within its timeframe; it only contains firmed and/or release orders.
MRP only generates planned orders outside the frozen demand fence.

There are three areas for which the user can enter parameters for
the frozen demand fence.

The three are:

Level 1 - Site Maintenance on the General tab

A value you enter in Site Maintenance applies to all Part IDs with
an Order Policy of Master Schedule.

Level 2 - Product Code

Overrides Level 1

A value you enter for a product code in Part Maintenance supersedes
the Site Maintenance setting. If a part has a product code with a
demand fence, the product code demand fence for the part is used during
MRP.

Level 3 - Part Maintenance - Planning Tab

Overrides Level 1 and 2

A value you enter for a part in Part Maintenance under the Planning
tab overrides the Site Maintenance setting and any demand fence Product
Code setting. If a part has a demand fence defined in its part master,
the part master demand fence is used over both product code demand
fence and Site Maintenance demand fence values.

The frozen demand fence timeframe within the material-planning window
is based on the last run date and time of MRP.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Application_Global_Maintenance.htm) User-defined Help