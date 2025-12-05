About the Costed Bill of Material Reports Window




# About the Costed Bill of Material Report Window

Use the Costed Bill of Material Report window to view
the cost of each material in a fabricated part. Engineering masters
are the source for the bills of material and the costs.

## Starting the Costed Bill of Material Report Window

Select Eng/Mfg, Costed
Bill of Material Reports.

## Tasks

This table shows the tasks that you can complete in the Costed Bill
of Material Report window:

| Task | Description |
| [Generating Costed Bill of Material Reports](Printing_Costed_Bill_of_Material_Reports.htm) | Use this procedure to generate costed bill of materials reports. |
| [Resetting Material Requirement Costs in the Costed Bill of Material Report Window](Resetting_Material_Requirement_Costs_in_the_Costed_Bill_of_Material_Report_Window.htm) | Use this procedure to reset material requirement costs for one or more parts. |
| [Resetting Operation Costs in the Costed Bill of Material Report Window](Resetting_Operation_Costs_in_the_Costed_Bill_of_Material_Report_Window.htm) | Use this procedure to reset operation costs for one or more parts. |
| [Resetting Outside Service Costs in the Costed Bill of Material Report Window](Resetting_Outside_Service_Costs_in_the_Costed_Bill_of_Material_Report_Window.htm) | Use this procedure to reset service costs for one or more parts. |
| [Imploding Costs in the Costed Bill of Material Report Window](Imploding_Costs_in_the_Costed_Bill_of_Material_Report_Window.htm) | Use this procedure to calculate the total cost of one or more parts based on the operations and material requirements in the engineering master. |

## Fields

Site
ID(s)

The sites to include in the report.

Starting Part
ID and Ending Part ID

The range of parts to include in the report. To include a range
of parts, specify the first part in the range in the Starting Part
ID field and the last part in the range in the Ending Part ID field.
To generate the report for one part, specify the same ID in the Starting
and Ending field. To generate the report for all parts, leave the
fields blank.

Explode
top level parts only

Select this check box to show the bill of materials for top-level
parts only. If the engineering master or work order contains legs,
then the bill of materials for legs is displayed with the top-level
part only. If you clear the check box, the bill of materials for legs
are displayed with the top level part and separately on its own page
in the report. If you click Work Order in the Type section, this check
box is not available.

Skip
masters with obsolete parts

Select this check box to exclude masters that refer to obsolete
parts.

Include active
ECNs

Select this check box to include masters that are subject to active
engineering change notices.

Output
format

Specify how to output the report. See [Report
Output Options](Report_Output_Options.htm).

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Costed_Bill_of_Material_Report.htm) User-defined Help