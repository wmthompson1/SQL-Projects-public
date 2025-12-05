About Costing Options




# About Costing Options

You can select one of these costing methods:

Standard Costing Standard Costing values
every inventory transaction at the cost standards you set in Part
Maintenance at the time of the transaction. Differences between the
part standard value and the actual cost are recorded in variance accounts
in the general ledger.

Actual Costing Actual Costing uses the
source of the raw material cost to define the value of all inventory
in the system. It uses the hourly labor rate of the employee that
creates the labor ticket and the invoice value of any services received.
Actual costing uses your First-In-First-Out (FIFO) rules to assign
value when the inventory is consumed.

Average Costing Average costing also
uses the source of the raw material cost, but calculates costs based
on the average material cost in your inventory. Average Costing calculates
the current running average of inventory for each part and assigns
that value when inventory is consumed.

The options on the Costing tab become available or unavailable based
on the costing method you choose.

In addition to specifying a costing method for finished goods, you
also specify a costing method for work in process (WIP).

## Considerations before choosing a costing method

Certain VISUAL functionality is only available if you use a particular
costing method. If you intend to use the functions described in this
section, select a costing method that is compatible with the functions.

### Landed costs

If you intend to use landed costs, you must use either the Average
or Actual costing method. You cannot use the Standard costing method.
When you enable landed costs, you can link multiple Accounts Payable
Invoices to a single purchase receipt line.

You can activate the landed costs feature in Financials Application
Global Maintenance.

### Consignment

If you use Actual or Average Costing methods and you want to store
consigned items from your customers or vendors, you must use By Part
Location as your FIFO Method / Inventory Grouping. If you use Actual
or Average Costing methods with FIFO By Part, then the From Vendor
and From Vendor location types are removed from Warehouse Maintenance
and Consignment Receiving cannot be used.

If you use Actual or Average Costing methods and only use consignment
to store your inventory at vendors or customers, you can use either
FIFO by Part or FIFO by Part Location.

You can use Standard Costing methods for your consigned inventory
without restriction.