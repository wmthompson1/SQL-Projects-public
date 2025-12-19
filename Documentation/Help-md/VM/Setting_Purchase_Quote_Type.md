Setting Purchase Quote Type




# Setting Purchase Quote Type

The Part Maintenance application allows you to specify
vendor price quotes for a part by different quantity levels. To do
this, a series of quantity levels and prices are specified as follows:

|  |  |
| --- | --- |
|  | Default Price |
| Quantity 1 | Price 1 |
| Quantity 2 | Price 2 |
| Quantity 3 | Price 3 |
| Quantity 4 | Price 4 |

## In Application Global Maintenance, you can select the purchase quote type: either Quantity-Break Tables or Up-to- Quantity Tables

## Quantity-Break Tables

If this option is selected, then the quantity levels are referred
to as Quantity Breaks and the following rules are used:

|  |  |  |  |
| --- | --- | --- | --- |
| This price is used |  | When |  |
| Default Price 1 |  | Order Qty | Quantity Break 1 |
| Price 1 | Qty Break 1 | Order Qty | Quantity Break 2 |
| Price 2 | Qty Break 2 | Order Qty | Quantity Break 3 |
| Price 3 | Qty Break 3 | Order Qty | Quantity Break 4 |
| Price 4 | Qty Break 4 | Order Qty |  |

In this case, the default price is a default price for a minimum
quantity, and Price 4 is used to cover the open end of the quantities
-- the high end.

## Consider the following example:

Default Price = $1.10

|  |  |  |
| --- | --- | --- |
| Quantity | Break Price | Means |
|  |  | 1-99 are $1.10 each\* |
| 100 | $1.00 | 100 - 199 are $1.00 each |
| 200 | $0.90 | 200 - 999 are $0.90 each |
| 1000 | $0.80 | Over 1000 are $0.80 each |

\* the default price

## Up-To-Quantity Tables

If this option is selected, then the quantity levels are referred
to as Up-To Quantities, and the following rules are used:

|  |  |  |  |
| --- | --- | --- | --- |
| Price Used | When |  |  |
| Price 1 | 1 | Order Qty | Up-To Qty. 1 |
| Price 2 | Up-To Qty. 1 | < Order Qty | Up-To Qty. 2 |
| Price 3 | Up-To Qty. 2 | < Order Qty | Up-To Qty. 3 |
| Price 4 | Up-To Qty. 3 | < Order Qty | Up-To Qty. 4 |
| Default Price | Up-To Qty. 4 | < Order Qty |  |

In this case, the default price assumes the bulk purchase -- it
is probably the lowest price available, only given when you purchase
above a certain point.

## Consider the following example:

Default Price = $0.70

|  |  |  |
| --- | --- | --- |
| Up-To Qty. | Price | Means |
| 100 | $1.00 | 1-100 are $1.00 each |
| 200 | $0.90 | 101 - 200 are $0.90 each |
| 1000 | $0.80 | 201 - 1000 are $0.80 each |
|  |  | Over 1000 are $0.70 each |

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Application_Global_Maintenance.md) User-defined Help