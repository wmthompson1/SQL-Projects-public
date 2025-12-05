What is the Shipping/Delivery Report?




# What is the Shipping/Delivery Report?

The Shipping/Delivery report provides information
on all firmed and released customer order lines.

A line is Released if one of these conditions is met:

* The customer order line
  has a status of Released
* The customer order header
  has a status of Released and the customer order line has a status
  of Inherit.

A line is Firmed if one of these conditions is met:

* The customer order line
  has a status of Firmed
* The customer order header
  has a status of Firmed and the customer order line has a status
  of Inherit.

For each order, the following information is provided:

* Order ID
* Customer ID
* Customer Name
* Contact Name and Phone
* Order Date
* Buyer
* Ship VIA
* Desired Receipt Date

For each line item, the following is shown:

* Line Number
* Part ID, Service ID, Description
* Quantity Ordered
* Quantity Due
* Unit of Measure

## Options

### Starting/Ending Due Date Range

You can specify the range of the Desired Ship Date (i.e., the due
date) of orders to print. If the order line item has a desired ship
date, it will be used, otherwise, the ship date for the whole order
will be used.

### Sequencing

The Shipping/Delivery Report is always sequenced by Due date, Order
ID, Customer ID, Customer Name, Part ID and Work Order ID.

### Subsequencing

The Shipping/Delivery Report is always sub-sequenced by Due date,
Order ID, Customer ID, Customer Name, Part ID and Work Order ID.

## QRP Files

|  |  |
| --- | --- |
| By Due Date | VMSDSRP1.QRP |
| By Order ID | VMSDSRP2.QRP |
| By Customer ID | VMSDSRP3.QRP |
| By Customer Name | VMSDSRP4.QRP |
| By Part ID | VMSDSRP5.QRP |
| By Work Order ID | VMSDSRP6.QRP |

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Shipping_Delivery_Report.htm) User-defined Help

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMSDSRPTfrmPrintShippingDeliveryReport.htm) Printing Shipping/Delivery Reports