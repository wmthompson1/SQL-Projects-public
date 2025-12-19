Calculating Retro Burden Figures




# Calculating Retro Burden Figures

Depending on your business practices, you may want
to periodically analyze the differences between your planned or target
burden rates and your actual incurred burden rates. As an outcome
of your analysis, you may decide to apply a new or revised set of
overhead/burden rules. Using VISUALs Retro Burden calculations you
can process an update to your projects to retroactively update your
year to date costs based on your revised burden/overhead rate target.
When you start the retro burden calculation, VISUAL applies the new
burden structures to the year to date actuals. Because VISUAL applies
retro burden adjustments to the current accounting period, the process
does not update any of your closed periods. The process performs the
following functions:

* Calculates burdens with
  the new rate for year to date.
* Compares the old burdens
  applied year to date.
* Posts the adjustment into
  the current accounting period in addition to the new rates for
  the current accounting period.

Before running the retroactive burdening program, you should set
up a revised set of rates in the Rate Maintenance window. In addition,
you should reset the "Used for Actuals" flag on the rate
maintenance table so that VISUAL will use the new rate for actual
cost processing.

Burden is usually expressed as a percentage of your actual costs.
For example:

Expense Pool/Allocation Base =Burden Percentage

In the above example, the applied burden rate for manufacturing
is 150%. The actual overhead rate based on actual expenses averages
125% over the three-month period. After setting the retro burden rate
to 125% VISUAL calculates the retro burden difference against the
previously applied rates and then posts the total difference in the
current month.

VISUAL performs the following calculations:

January (125% of 100) - (150% of 100)
= -25

February (125% of 50) - (150% of 50) =
-12.50

March (125% of 80) -(150% of 80) = -20

Total retro posting (-25)+(-12.5)+(-20)=-57.5

To calculate your retro burden costs:

1. Select Calculate
   Retro Burden on the Edit menu of the Rate Maintenance window.

The Calculate Retro Burden dialog box appears.
The current End of Fiscal Period automatically appears.

2. If you want to change
   the End of Fiscal Period, click the calendar button and select
   the period you want.
3. Click the Burden
   Rate ID button and select the burden rate you want VISUAL
   to use for its burden calculations.
4. Click the Burden
   Period ID button and select the burden period you want
   VISUAL to use for its calculations.
5. Click the Calculate
   button.

VISUAL calculates your retro burden costs
and updates the Project Summary window with the new information.

6. If you want to reset
   the Used for Actuals option in the Rate table window, click the
   Reset Actual Burden Flag button.

When you have finished calculating retro
burdens, click the Close button.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Project_Summary.md) User-defined Help