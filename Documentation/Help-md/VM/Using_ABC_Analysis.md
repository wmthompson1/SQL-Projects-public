Using ABC Analysis




# Using ABC Analysis

ABC analysis classifies part IDs by the value and
the usage of the item. Parts that cost the most and/or are used most
frequently are "A" items. Parts that cost the least and/or
are used least are "C" items. All other parts are "B"
items. A parts ABC code determines how often you should count the
part through Cycle Counting.

There are four ABC analysis methods:

Projected usage method - Each part has
a new field called Annualized Usage in the Planning area of Part Maintenance.
This value reflects the users estimated or calculated annualized
usage of the part.

Forecasted usage method - Uses the forecast
table to determine the annualized usage of the part and can specify
the ending date range for this method.

Actual usage method - Uses inventory transactions
(actual usage) to determine the annualized usage of the part. Specify
what the system may use, like the year to date usage, or last years
usage, or the preceding number of months of usage.

Planned Usage - Uses requirements to determine
planned usage of the part. Specify the starting and ending dates of
the requirements to include in the total.

Whichever usage method you use, the unit cost used is from the Total
cost in the Costing tab of Part Maintenance. VISUAL computes a dollar
value by multiplying the usage quantity by the unit cost.

The parts whose value falls into the top A percent of values of
all parts chosen for analysis receive an A code. The next B percent
receive B codes and the next C percent C codes. You can also assign
codes manually through Part Maintenance.

If you are licensed to use multiple sites, you must conduct ABC
analysis at the site level.

To access ABC analysis:

1. Select Inventory,
   Part Maintenance.
2. If you are licensed
   to use multiple sites, click the Site ID arrow and select the
   site to use. If you are licensed to use a single site, this field
   is unavailable.
3. Select Maintain,
   ABC analysis.
4. In the Product Code
   field, specify the product code on which to run the analysis.
   To run the analysis on all parts, leave this field blank.
5. Click the criterion
   for the analysis:

Projected Usage
- Click to choose projected usage.

Forecast Usage
- Enter starting an ending date.

Actual Usage -
Choose either Year to date or Last Year or Prior n months. Enter
the number of months.

Planned Usage
- Enter starting and ending date.

6. In the Setting section,
   specify the percentage of parts to be given A, B, and C classes.
   Percentages cannot exceed a total of 100.
7. Click Run.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Part_Maintenance.md) User-defined Help