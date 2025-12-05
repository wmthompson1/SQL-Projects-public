Printing Customer Backlog Reports




# Printing Customer Backlog Reports

The Customer Backlog report contains information on
all partially or totally unshipped order lines, including those with
status of Firm, Released, or On Hold.

Customer order lines are considered released if one
of these conditions is met:

* The customer order line
  has a status of Released
* The customer order header
  has a status of Released and the customer order line has a status
  of Inherit.

Customer order lines are considered firmed if one
of these conditions is met:

* The customer order line
  has a status of Firmed
* The customer order header
  has a status of Firmed and the customer order line has a status
  of Inherit.

Customer order lines are considered on hold if one
of these conditions is met:

* The customer order line
  has a status of On Hold
* The customer order header
  has a status of On Hold and the customer order line has a status
  of Inherit.

The total revenue value of the unshipped portion of
each order is displayed, along with totals for each sequence group.

1. Select Sales,
   Customer Backlog Report.
2. If you are licensed
   to use multiple sites, click the Site ID(s)
   arrow and select the sites to include in the report. If you are
   licensed to use a single site, this field is unavailable.
3. In the Starting Due
   Date and Ending Due Date fields, specify the date range to use
   for the report. Dates are based on the Desired Ship Date that
   is specified on the customer order.
4. In the Sequence section,
   specify how to sort the information in the report. When you select
   an option, the names  of the Starting ID and Ending ID fields
   are updated. Other options, such as the options in the Order Amount
   Based On section, are unavailable depending on the sequence that
   you select.
5. In the Starting and
   Ending ID fields, specify the range of IDs to include in the report.
   The label for these fields changes based on the sequence option
   that you select. For example, if you select Customer ID in the
   Sequence section, the field labels are Starting Customer ID and
   Ending Customer ID. Use these fields to print the report for a
   range of IDs or records. To include all IDs in the report, leave
   the fields blank. To print the report for one ID, specify the
   same ID in the Starting ID and Ending ID fields.

If you click Due date in the Sequence section,
these fields are not displayed.

6. To exclude order amounts
   and totals from the report, select the Suppress
   Amount check box. The Suppress Amount feature is useful
   if the report is used by personnel who should not have access
   to revenue information.

7. If you clear the Suppress
   amount check box and also click Order ID, Customer ID, or Customer
   Name in the Sequence section, specify how to value the orders.
   Click Qty to be shipped to value the
   orders based on the sales prices of the outstanding items. Click
   Value uninvoiced to value the orders
   based on the amount remaining to be invoiced.
8. Select the output for
   the report. See [Report Output
   Options](Report_Output_Options.htm).
9. Click Print.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Customer_Backlog_Report.htm) User-defined Help