Setting Order Management Global Values




# Setting Order Management Global Values

Use the Order Mgt tab to specify default information for your customer
order management. In the Order Mgt tab, you can:

* Enable WIP/VAS. WIP/VAS
  (work in process/value-added service) is typically used in conjunction
  with VISUAL DCMS.
* Specify allocation behavior
* Specify the default shipping
  weight unit of measure
* Specify the default back
  order fill rate
* Specify order management
  codes

To specify this information:

1. Click the Order
   Mgt tab.
2. Select the WIP/VAS
   Enabled check box to enable WIP/VAS functions.

Parts that make up an order may require
extra services before they are shipped to a customer or transferred
to another warehouse. For example, parts in an order may require price
tag printing and application. These activities are work in process
(WIP) activities.

In certain cases, employees in the distribution
center may need to provide additional services before a product is
shipped. These activities are value-added services (VAS).

Note: You cannot
use WIP/VAS if you do not have an Order Management enabled serial
number.

3. Specify allocation settings.
   Depending on your selections, certain options become available
   or unavailable. Select from these options:

Allocations Require Warehouse/Location
To allow users to allocate supply and assign demand without specifying
a warehouse or a location, clear this check box. To require supply
allocations and demand assignments to have a warehouse ID and location
ID before they can be linked to transactions, select this check box.
When you select this check box:

1. * You must supply a Warehouse
     ID for purchase and customer orders before you save the order.
   * You can enter a new
     work order and add material requirements and operations, but
     you cannot allocate work order quantities to demand or allocate
     supply to material requirements.

This setting does not apply to interbranch
transfers (IBTs).

When you select the Allocations Require
Warehouse/Location check box, the Auto Allocate check box and the
Requirement Allocation Level options become available.

Requirement Allocation
Level These options become active when you select the Allocations
Require Warehouse/Location check box. Use the requirement allocation
level to determine if materials must be allocated to work orders before
the work order can be firmed or released. Click one of these options:

Full Click this
option to require all materials to be allocated to the work order
before the work order can be firmed or released.

Partial Click this
option to optionally allow required materials to be allocated to a
work order before the work order can be firmed or released. When you
click this option, a work order can be released without materials
allocated.

None Click this
option if you do not require materials to be allocated to a work order
before it can be released.

Auto Allocate
To automatically allocate supply to demand, select this check box.
You cannot select the Auto Allocate option unless you have selected
the Allocations Require Warehouse/Location option.

Customer Order Allocation
When you select the Auto Allocate option, the Customer Order Allocation
Level section becomes active. Use the customer order allocation level
to determine if materials must be allocated to customer orders before
the orders can be placed. Click one of these options:

Full Click this
option to require all materials to be allocated to customer orders
before the orders can be placed.

Partial Click this
option to optionally allow required materials to be allocated to customer
orders before the orders can be placed. When you click this option,
a customer order can be placed without materials allocated.

None Click this
option if you do not require materials to be allocated to a customer
order before it can be placed.

4. In the Default Shipping
   Weight UM field, click the browse button and specify the unit
   of measure to use for weight shipment in the Order Management
   Window.
5. In the Default Back
   Order Fill Rate field, specify the default fill rate to use for
   customer back orders.

The back order fill rate is a number between
0 and 100 that indicates the minimum percentage of available stock
that must be allocated to the customer if a back order balance remains
on a customer order. For example, an order fill rate of 100 for a
C/O line for 1,000 back-ordered parts, produces a minimum fill rate
quantity of 1,000; an order fill rate of 80 for a C/O line of 1,000
produces a minimum fill rate quantity of 800.

6. Click Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Enabling_Warehouse_Location_Requirements_for_Allocations.htm) Enabling Warehouse/Location Requirement
for Allocations

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Selecting_a_Default_Shipping_Weight_U_M.htm) Selecting a Default Shipping Weight
U/M

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Selecting_a_Default_Oldest_Open_Invoice_Setting.htm) Selecting a Default Oldest Open Invoice
Setting

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Selecting_a_Customer_Order_Allocation_Level.htm) Selecting a Customer Order Allocation
Level

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Selecting_a_Requirement_Allocation_Level.htm) Selecting a Requirement Allocation Level

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Entering_Customer_Priority_Codes.htm) Entering Customer Priority Codes

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Entering_Customer_Order_Types.htm) Entering Customer Order Types

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Entering_WIP_VAS_Information.htm) Entering WIP/VAS Information

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Entering_Customer_Types.htm)
Entering Customer Types

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Adding_Harmonized_Tariff_Schedule_(HTS)_Codes.htm) Entering HTS Codes

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Specifying_HTS_Duty_Percents_by_Country_of_Origin.htm) Entering HTS Duty Percents by Country
of Origin

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Entering_Part_Alias_Types.htm)
Entering Part Alias Types

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Order_Management_Window.htm) User-defined Help