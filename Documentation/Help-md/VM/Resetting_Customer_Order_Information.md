Resetting Customer Order Information




# Resetting Customer Order Information

The reset customer order information feature of the
Customer Maintenance window allows you to reset customer orders according
to three criteria. You can execute these changes for an individual
customer order or for all customers, for a customer or per customer
Shipto ID, according to order status, or by order date. Use this feature
to perform mass changes to a specific set of customer ordersor all
ordersin your database.

For those of you familiar with the Part Maintenance window, this
feature is similar to the [Reset
Part Information](Resetting_Part_Information_Master.md) function.

1. From the VISUAL main
   menu, select Customer Maintenance from
   the Sales menu.

The Customer Maintenance window appears.

2. From the Maintain menu,
   select Reset Order Information.

The Rest Order Info dialog box appears.

3. From the Reset section,
   select the appropriate reset options:

ASN Not Transmitted
- Select the ASN Not Transmitted check box if you want to reset untransmitted
ASN information in customer orders.

Unshipped Pack lists
- Select the Unshipped Pack Lists check box if you want to reset unshipped
pack lost information in customer orders.

Customer Orders
- Select the Customer Orders check box if you want to reset general
customer order information in customer orders.

4. From the From section,
   select which type of information you want to reset.

Customer Info
- Select the Customer Info option button if you want VISUAL to reset
general customer information.

Shipto Info -
Select the Shipto Info option button if you want VISUAL to reset customer
shipping address information in customer orders.

5. Choose which customers
   you want to include in the reset.

Current Customer Only
- Select the Current Customer Only option button to change information
for the customer currently in the Customer Maintenance window. If
you are using this feature without a customer in the window, this
option button is disabled.

All Customers
- Select the All Customers option button to change information for
all customers currently in the database for whom there are customer
orders.

6. Choose the order status
   by which you want to reset information:

According to Customer
Order Status - Select the According to Customer Order Status
check box to activate the following 5 check boxes.

Firmed - Select
the Firmed option button to reset specified
information in Firmed orders for the customers.

Released - Select
the Released option button to reset specified
information in Released orders for the customers.

Closed -Select
the Closed option button to reset specified
information in Closed orders for the customers.

Cancelled - Select
the Cancelled option button to reset specified
information in Cancelled orders for the customers.

All - Select the
All option button to reset specified information in All orders for
the customers. Selecting All causes VISUAL to select the above 4 check
boxes and then disable them.

7. If appropriate, select
   date options:

According to Customer
Order Date - Select the According to Customer Order Date check
box to activate the following 2 date fields.

On or After -
In the On or After date field, enter the date on or after which you
want VISUAL to reset customer orders. This feature is useful if there
is a date in the customer order history on which one or several things
changed. For example, if a company changed freight terms and carriers
on January 1, 2005, use this date field to only reset orders placed
on or after 1/1/2005.

On or Before -
In the On or Before date field, enter the latest date you want VISUAL
to use when resetting customer orders. VISUAL resets customer orders
on or before this date.

8. Click the Select
   Columns button to choose which columns you want to reset.

The Select Columns dialog box appears.

By default, all columns are selected.

The dialog box contains the following fields:

Table - The VISUAL
database table name. Currently, CUSTOMER\_ORDER, ADV\_SHIP\_NOTICE, and
SHIPPER are the three tables to which you have access.

Column Name -
The name of the column in the VISUAL database table.

Attribute - Its
current attribute, or whether it is selected or unselected.

9. After determining what
   current attribute a column has by looking in the corresponding
   Attribute field, select the line and click the Select
   or Deselect button as appropriate.

Columns previously Selected (Attribute:
Selected) become Unselected; columns previously Unselected (Attribute:
Selected) become Selected.

10. To effect a group select
    or deselect, click the Select All and
    Deselect All buttons as appropriate,
    and then click the Select or Deselect button to uniformly change
    column attributes.

    |  |  |
    | --- | --- |
    | POSTIT.gif | VISUAL ignores deselected columns when resetting customer order information. |

11. After selecting columns,
    click the Ok button.

VISUAL closes the Select Columns dialog
box and returns you to the Reset Order Info dialog box.

12. Click the Ok
    button to begin the reset procedure.

After resetting according to your preferences,
VISUAL displays a dialog box indicating how many customer orders it
updated.

13. Click the Ok
    button to close the dialog box and return to the Customer Maintenance
    window.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Customer_Maintenance.md) User-defined Help