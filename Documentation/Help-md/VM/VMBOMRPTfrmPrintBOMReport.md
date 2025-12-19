About the Bill of Material Reports Window




# About the Bill of Material Report Window

Use the Bill of Material Report Window to generate
an indented bill of materials for a range of engineering masters or
work orders. For each master or work order, this data is displayed
for each material requirement:

* BOM Level (0 is top level
  of part, 1 is a material requirement of the top part or a leg
  nested directly under the top part, 2 is material requirement
  of a leg, etc.)
* Part ID
* Quantity Required per Unit
* Fixed Quantity Required
* Scrap %
* Dimensional Information

For piece-tracked parts, the number of pieces, the length, width,
and height dimensions, and the dimension unit of measure appear.

## Starting the Bill of Material Report Window

Select Eng/Mfg, Bill
of Material Report.

## Tasks

This table shows the tasks that you can complete in the Bill of
Material Report window:

| Task | Description |
| [Generating Bill of Material Reports](Generating_Bill_of_Material_Reports.md) | Use this procedure to generate bill of material reports. |

## Fields

Type section

To generate information about engineering masters, click Eng
Master. To generate information about work order, click Work Order.

Site
ID(s)

The sites to include in the report.

Starting Part/Ending
Part and Starting Workorder/Ending Workorder

The range of information to include in the report. If you clicked
Eng Master, specify the first part in the range in the Starting Part
field and the last part in the range in the Ending Part field. If
you clicked Work Order, specify the first work order in the range
in the Starting Workorder field and the last work orderin the range
in the Ending Workorder field. To generate the report for one record,
specify the same ID in the Starting and Ending field. To generate
the report for all records, leave the fields blank.

Explode
top level parts only

Select this check box to show the bill of materials for top-level
parts only. If the engineering master or work order contains legs,
then the bill of materials for legs is displayed with the top-level
part only. If you clear the check box, the bill of materials for legs
are displayed with the top level part and separately on its own page
in the report. If you click Work Order in the Type section, this check
box is not available.

Explode
one level

Select this check box to show the top-level part and the materials
that are directly connected to the top level part.

Skip
masters with obsolete parts

Select this check box to exclude masters that refer to obsolete
parts.

Output
format

Specify how to output the report. See [Report
Output Options](Report_Output_Options.md).

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Bill_of_Material_Report.md) User-defined Help