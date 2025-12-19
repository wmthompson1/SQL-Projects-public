Entering Customer Types




# Entering Customer Types

The Customer Types dialog becomes available when you
select the Allocations Require Warehouse/Location
check box.

Customers have different order requirements. Some
customers may have complex order fulfillment schedules to which they
must adhere; others may have specific allocation needs at one warehouse,
or various warehouses scattered across the country. Assign ranks to
customers according to the degree of their order fulfillment requirements.

1. Select Admin,
   Accounting Entity Maintenance.
2. In the Entity ID field,
   select the accounting entity for which you are setting up customer
   types.
3. Click the Order
   Mgt tab.
4. Ensure that the Allocations Require Warehouse/Location check
   box is selected.
5. Click Customer
   Types.
6. Click Insert
   to start adding line item information to the table.

Type - An alphanumeric
unique identifier of the customer type.

Description -
A description of the type.

Priority - VISUAL
uses this value to sort customers during the allocation process. The
lower the number you assign the customer, the higher the priority
for the customer. You can specify a different priority for each customer
in Customer Maintenance. Click [here](Entering_Customer_Priority_Codes.md)
for more on customer priority codes.

Allocation Fence
- The number of days within which an order from a customer of this
type the Allocation Utility considers. If an orders desired ship
date is outside the allocation fence, the Allocator ignores it during
the allocation process. For customers of this type, this allocation
fence value becomes the default setting. You can, however, override
this setting in Customer Maintenance during the entry of Customer
Order Management information. Click [here](Setting_a_Customer_s_Allocation_Fence.md)
for more on setting allocation fences for customers.

Reallocate - Before
creating new allocations, existing allocations may be removed. If
you select this check box, all customers of this type are Reallocation
enabled by default. You can, however, override this setting in Customer
Maintenance during the entry of Customer Order management information.
Click [here](Enabling_Customer_Reallocation.md) for more
on customer reallocation.

Auto Allocate
To automatically create allocations for this customer type, select
the Auto Allocate check box.

Allocation Level
Click the arrow and specify the allocation level to use. Select
one of these options:

None No allocation
is made.

Partial Allocation
This selection allows you to allocate supply to the work order requirement,
but makes allocation optional.

Full Allocation
This selection requires you to make sure that work order requirements
have allocated supply before you firm or release the requirement.

7. Click Save
   when you are finished entering customer type information.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Application_Global_Maintenance.md) User-defined Help