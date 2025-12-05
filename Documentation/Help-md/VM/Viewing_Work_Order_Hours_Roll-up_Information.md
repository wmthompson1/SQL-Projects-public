Viewing Work Order Hours Roll-up Information




# Viewing Work Order Hours Roll-up Information

Note: To ensure that you
are viewing up-to-date information, run the top two options of the
Costing Utilities before accessing the Work Order Hours Roll-up dialog.

By default, total standard, actual, variance, and
projected hours are displayed in the table. To add setup and run detail
columns to the table, use the View menu.

1. Select Eng/Mfg,
   Manufacturing Window.
2. Open the work order
   whose hours you want to view.
3. Select Info,
   Work Order Hours Roll-up. This information
   is displayed:

Quantity Required
The quantity required by the top-level part in the dialog. This
is the part that is specified on the work order header.

Quantity Costed
Of the quantity issued to the work order, the quantity that has
been costed. The costed quantity is used to calculate the actual hours.
If a requirement was deliberately over-issued to the work order, then
this value can exceed the quantity required.

Std. Total Hours
The standard total hours to complete the quantity displayed on the
line. This value is calculated by adding the standard setup hours
to the standard run hours.

Std. Setup Hours
The standard total hours to set up the quantity displayed on the
line.

If the quantity on the default engineering
master is not 1, then the standard setup hours in the first row are
calculated by multiplying the quantity required by the standard hours
setup value that is specified for the part in Part Maintenance.

For the other rows in the table, one of
these calculations are made:

* If no parts
  have been issued or costed, then the standard setup hours are
  calculated by multiplying the quantity required by the multi-level
  setup value specified for the part in Part Maintenance.
* If parts have
  been issued and costed, then the standard setup hours are calculated
  by multiplying the quantity required by the standard hours setup
  value specified for the part in Part Maintenance.

See [Calculating
Standard Unit Hours](Calculating_Standard_Unit_Hours.htm).

Std. Run Hours
The total hours that are estimated to complete the run of the quantity
displayed on the line.

For the first row in the table, the standard
run hours are calculated by multiplying the quantity required by the
standard hours run value that is specified for the part in Part Maintenance.

For the other rows in the table, one of
these calculations are made:

* If no parts
  have been issued or costed, then the standard run hours are calculated
  by multiplying the quantity required by the multi-level run value
  specified for the part in Part Maintenance.
* If parts have
  been issued and costed, then the standard run hours are calculated
  by multiplying the quantity required by the standard hours run
  value specified for the part in Part Maintenance.

See [Calculating
Standard Unit Hours](Calculating_Standard_Unit_Hours.htm).

Act. Total Hours
The total hours that have been reported on labor tickets for the
work orders producing the part.

**Act. Setup Hours** The hours that have been
reported on setup labor tickets.

**Act. Run Hours** The hours that have been
reported on run labor tickets.

Var. Total Hours
The standard total hours minus the actual total hours.

Var. Setup Hours
The standard setup hours minus the actual setup hours.

Var. Run Hours
The standard run hours minus the actual run hours.

Projected Total Hours
For the first row in the table, one of these calculations is made:

* If the main
  work order is closed or cancelled, the actual total hours are
  displayed.
* If the main
  work order is open but no header quantity has been received, the
  projected hours are calculated by adding the standard total hours
  and the actual total hours.
* If the main
  work order is open and header quantities have been received, the
  projected hours are calculated using this formula: (remaining
  quantity \* (standard hours/required quantity)) + actual hours.

For all other rows, one of these calculations
is made:

* If the
  costed quantity is greater than or equal to the required quantity,
  the actual hours are used.
* If the
  costed quantity is less than the required quantity, then projected
  hours are calculated using this formula: (remaining quantity \*
  (standard total hours/required quantity)) + actual total hours

Projected Setup Hours
For the first row in the table, one of these calculations is made:

* If the main
  work order is closed or cancelled, the actual setup hours are
  displayed.
* If the main
  work order is open but no header quantity has been received, the
  projected setup hours are calculated by adding the standard setup
  hours and the actual setup hours.
* If the main
  work order is open and header quantities have been received, the
  projected hours are calculated using this formula: (remaining
  quantity \* (standard setup hours/required quantity)) + actual
  setup hours.

For all other rows, one of these calculations
is made:

* If the costed
  quantity is greater than or equal to the required quantity, the
  actual setup hours are used.
* If the costed
  quantity is less than the required quantity, then projected setup
  hours are calculated using this formula: (remaining quantity \*
  (standard setup hours/required quantity)) + actual setup hours

Projected Run Hours
For the first row in the table, one of these calculations is made:

* If the main
  work order is closed or cancelled, the actual run hours are displayed.
* If the main
  work order is open but no header quantity has been received, the
  projected run hours are calculated by adding the standard run
  hours and the actual run hours.
* If the main
  work order is open and header quantities have been received, the
  projected hours are calculated using this formula: (remaining
  quantity \* (standard run hours/required quantity)) + actual run
  hours.

For all other rows, one of these calculations
is made

4. If the costed
   quantity is greater than or equal to the required quantity, the
   actual run hours are used.
5. If the costed
   quantity is less than the required quantity, then projected run
   hours are calculated using this formula: (remaining quantity \*
   (standard run hours/required quantity)) + actual run hours
6. When you are finished
   viewing work order hours roll-up information, select File,
   Close.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Work_Order_Hours_Roll-up_Information.htm) Work Order Hours Roll-up Information