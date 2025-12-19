Assigning Sales Tax Groups by Part ID




# Assigning Sales Tax Groups by Part ID

Before you can assign sales tax groups by Part ID, you must first
create Sales Tax Groups. For more information on creating Sales Tax
Groups, refer to [Sales Tax Groups
Maintenance](VMTAXMNTfrmTaxGroup.md).

Use the Sales Tax Groups by Part ID dialog box to define the sales
tax group to use for various combinations of Part ID, Customer ID,
and Customer Address ID. For example, you can assign a sales tax group
for PART A when it is sold to CUSTOMER 1 and a different sales tax
group for PART A when it is sold to CUSTOMER 2. Furthermore, you can
assign sales tax groups for the part based on the customer shipping
address. For example, you can assign a sales tax group for PART A
when it is shipped to CUSTOMER 1's MAINE location, and a different
sales tax group for PART A when it is shipped to CUSTOMER 1's VIRGINIA
location.

To assign a Sales Tax Group to a combination of Part ID, Customer
ID, and Customer Ship To ID:

1. Select
   Inventory, Part Maintenance.
2. If you are licensed
   to use multiple sites, click the Site ID
   arrow and select the site. If you are licensed to use a single
   site, this field is unavailable.
3. In the Part ID field,
   click the browse button and select the Part ID.
4. Select Maintain,
   Sales Tax Group by Part ID. If you specified
   a default Sales Tax Group ID on the Accounting tab in Part Maintenance,
   the system inserts the value in the Default Sales Tax Group ID
   field.
5. Click Insert.
6. Specify this information:

Customer ID
Specify the ID of the customer who pays the tax on this part.

Shipto ID To
associate the sales tax group with a particular shipping address,
double-click the Shipto ID browse button to select the address to
use. The Addr # associated with the Shipto ID you selected is inserted.
If the sales tax group applies to all customer addresses, leave this
field blank.

Sales Tax Group ID
Double-click the browse button to select the Sales Tax Group to
assign to this part/customer or part/customer/shipto ID combination.
The name associated with the Sales Tax Group ID in the Sales Tax Group
Name field is inserted.

7. Click Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Part_Maintenance.md) User-defined Help