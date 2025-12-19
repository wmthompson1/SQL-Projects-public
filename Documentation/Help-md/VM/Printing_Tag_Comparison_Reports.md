Printing Tag Comparison Reports




# Printing Tag Comparison Reports

The Print Tag Comparison report allows a tag-by-tag
comparison of on-hand quantities with counted quantities, and the
resulting difference between current value and the value of the counted
parts.

To use this report, follow these steps:

1. If you are licensed
   to use multiple sites, click the Site ID arrow and select the
   site where you conducted the count. If you are licensed to use
   a single site, this field is unavailable.
2. In the table, select
   the physical inventory count.
3. Select Print
   Tag Comparison from the File
   menu.

The Print Count Comparison Report dialog
box appears.

4. Enter the Physical Count
   ID.

You can use this report with any existing
physical count. If a count is in progress, Physical Count ID defaults
to the current count. If you want to compare a different count, enter
the Count ID.

5. Select the Count Type.

Although you can generate this report for
all tags by selecting the All Counted Tags radio button, it is most
valuable when used with its threshold feature. This allows you to
focus only on differences in quantity or value above a defined level.

To use this feature, select the Tags Where
radio button, and enter the following information:

Quantity Change
- You can filter out all tags where the difference between On-Hand
Quantity and Counted Quantity is less than or greater than a certain
amount. You can specify these thresholds independently, and as percentage
or unit amounts.

First, select whether you want to specify
quantity differences in units or as a percentage of the on-hand amount
by selecting the Units or Percent radio button.

Next, select the minimum overage that you
want, and enter the units or percent in the Plus field.

Finally, select the minimum underage that
you want to examine, and enter the unit or percent in the Minus column.

For example, you may only be interested
in tags where the counted quantity is lower than the on-hand balance
by more than five percent, or where the counted quantity is greater
by more than 20 percent. Select the Percent radio button, and enter
20 in the Plus field, and 5 in the Minus field.

Value Change - You can filter out all tags where the difference
between the value of the on-hand quantity and counted quantity is
less than or greater than a certain amount. As with quantities, you
can specify these thresholds independently either as a percentage
of dollar amount or specific dollar amount range.

Value thresholds are set identically to
quantity thresholds as described previously.

For example, you may only be interested
in tags where the counted value is lower than the on-hand balance
by more than one thousand dollars, or where the counted quantity is
greater by more than five thousand dollars. Select the Dollars radio
button, and enter 5000 in the Plus field, and 1000 in the Minus field.

You can use the Value Change and Quantity
Change thresholds together. VISUAL prints a tag if either set of criteria
are met.

Uncounted Tags - If
you choose to include uncounted tags, those tags will print with zero
dollar value. But you can also choose to apply the current dollar
value of inventory on the uncounted tags. An N will be printed to
the right of the value indicating when this value is an uncounted
value.

6. Select the Print Sequence.

You can print this report in order of Tag
Numbers, Part IDs, or Location IDs by selecting the corresponding
radio button in the Sequence box.

7. Select the output.

Select Print,
View, or File.

8. Click Ok.
9. A standard Windows Print
   dialog box appears.
10. Enter the appropriate
    information and click Ok.

For each tag listed, the following data
appears: Tag Number, Part ID, Location ID, On-Hand Quantity for the
Location, Previous Value (value based on the Location Quantity), Count,
and New Value (value based on the Count). If sequencing by Part ID,
the unit of measure for the part also appears. VISUAL totals Previous
Value and New Value.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Physical_Inventory_Count.md) User-defined Help