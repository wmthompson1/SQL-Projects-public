About Cost Simulations




# About Cost Simulations

Predicting your overall costs prior to actually making
adjustments to costs or burdens in your database can be a useful planning
tool. Cost simulation allows you to manage an unlimited number of
simulations for materials, labor, burden, service costs, and unit
price for parts and resources. This feature is particularly useful
if you manufacture in a repetitive mode and maintain a standard cost
database because you can make adjustments and observe the potential
effects of those changes before you commit anything to the database.

Cost simulation is useful for:

* Simulating costs prior to
  setting Annual Standards
* Simulating and setting changes
  during the year for commodities or significant price changes by
  vendor
* Adjustments for labor rate
  changes during the year

Use cost simulation to reset costs only. If you need to revalue
your inventory, use the standard VISUAL revaluation process.

You can create multiple cost simulations for the same engineering
master, part, resource, or outside service. You can print simulation
reports to compare the simulations before you update costs.

## Starting the Costed Bill of Material Report Window

Select Inventory, Cost
Simulation.

## Tasks

This table shows the tasks that you can complete in the Costed Bill
of Material Report window:

| Task | Description |
| [Creating Cost Simulations](Creating_Cost_Simulations.md) | Use this procedure to set up a cost simulation. |
| [Copying Cost Simulations](Copying_Cost_Simulations.md) | Use this procedure to copy a cost simulation. |
| [Deleting Cost Simulations](Deleting_Cost_Simulations.md) | Use this procedure to delete a cost simulation. |
| [Updating Parts, Resource Costs, and Outside Resources from Cost Simulations](Updating_Parts_Resource_Costs_and_Outside_Resources_from_Cost_Simulations.md) | Use this procedure to update parts, resources, and outside services with the costs that are specified on the simulation. |
| [Viewing G/L Entries](VMCSTSIMfrmGLEntries.md) | Use this procedure to review G/L entries that were generated due to updating costs. G/L entries are created if the parent entity of the site uses the standard costing method. |
| [Updating Engineering Master Costs from Cost Simulations](Updating_Engineering_Master_Costs_from_Cost_Simulations.md) | Use this procedure to update engineering masters with the costs that are specified on the simulation. |
| [Printing Engineering Master Simulation costs](VMCSTSIMfrmEngCosts.md) | Use this procedure generate a report that shows costs of an engineering master based on a simulation. |
| [Printing Cost Simulation Reports](Printing_Cost_Simulation_Reports.md) | Use this procedure to generate a report that shows the costs specified in a simulation. |

## Fields

Site
ID

The site where you are running the simulation.

Simulation
ID

The identifier of the simulation.

Description

The description of the simulation.

Eng Master

If you are creating a simulation for a part that you manufacture,
the ID of the part's engineering master.

Eng ID

The version of the engineering master that you are using for the
simulation.

Eng
Master Part Type

If you selected an engineering master in the Eng Master field, the
type of material requirements to display in the Parts table. Select
Purchased to display material requirements that are purchased parts.
Select Fabricated to display material requirements that are fabricated
parts. Select Both to display all material requirements.

Date
Updated

If simulated costs have been applied to the database, the date that
the costs were updated.

Status

If simulated costs have been applied to the database, then Updated
is displayed. If simulated costs have not yet been applied to the
database, then Active is displayed.

Output

The output for the Cost Simulation report. See [Report
Output Options](Report_Output_Options.md).

PDF Format

If you selected E-mail in the Output field, select this check box
to attach a PDF of the report to the email.

Part
table

This information is displayed in the Parts table:

Part ID

The ID of the part.

Simulation Unit Price

The calculated unit price based on the Unit
Price Markup Type and the Price Markup Percent.

Unit Price Markup Type

The method used to calculate the Simulation
Unit Price. Select one of these options:

% + Total Cost

The Simulation Unit Price is calculated by
multiplying the Total Original Cost by the Price Markup Percent.

% + Current Cost

The Simulation Unit
Price is calculated by multiplying the Original Unit Price by the
price Markup Percent.

Amount + Cost

The Simulation Unit Price is calculated by
adding the Total Original Cost and the Price Markup Amount.

Amount + Price

The Simulation Unit Price is calculated by
adding as the Original Unit Price and the price Markup Amount.

Price Markup Amount

The amount by which you are marking up this
parts cost or price.

Price Markup Percent

The percentage by which you are marking up
this parts cost or price.

Current Material Cost

The current cost of the material as defined
on the Part record. If a cost is not defined, the column is blank.

Simulation Material Cost

The current material cost multiplied by the
Sim Markup Material %. Alternatively, you can specify the value that
you want to use.

Sim Markup Material %

The percentage by which you are increasing
the material cost.

|  |  |
| --- | --- |
| POSTIT.gif | If you specify a percentage after you enter a value in the Simulation Material Cost column, the value in the Simulation Material Cost column is overwritten. |

Current Labor Cost

If the part on this line is fabricated, the
current cost of the labor required to manufacture the part.

Simulation Labor Cost

The current labor cost multiplied by the Sim
Markup Labor %. Alternatively, you can specify the value that you
want to use.

Sim Markup Labor %

The percentage by which you are increasing
the labor cost.

|  |  |
| --- | --- |
| POSTIT.gif | If you specify a percentage after you enter a value in the Simulation Labor Cost column, the value in the Simulation Labor Cost column is overwritten. |

Current Burden Cost

If the part on the line is fabricated, the
current burden cost for the part.

Simulation Burden Cost

The current burden cost multiplied by the
Sim Markup Burden %. Alternatively, you can specify the value that
you want to use.

Sim Markup Burden %

The percentage by which you are increasing
the burden cost.

|  |  |
| --- | --- |
| POSTIT.gif | If you specify a percentage after you enter a value in the Simulation Burden Cost column, the value in the Simulation Burden Cost column is overwritten. |

Current Service Cost

If the part on the line is fabricated, the
current cost of outside services that are performed on the part.

Simulation Service Cost

The current service cost multiplied by the
Sim Markup Service %. Alternatively, you can specify the value that
you want to use.

Sim Markup Service %

The percentage by which you are increasing
the burden cost.

Current Fixed Cost

If the part on the line is purchased, the
current fixed cost for the part.

Simulation Fixed Cost

The current fixed cost multiplied by the Sim
Markup Fixed %. Alternatively, you can specify the value that you
want to use.

Sim Markup Fixed %

The percentage by which you are increasing
the fixed cost.

Total Sim Cost

The sum of these values:

Simulation Material Cost + Simulation Labor
Cost + Simulation Burden Cost + Simulation Service Cost

Total Original Cost

The total original costs from the part table
appear in the Total Org Cost Column. This is the current cost from
the part table.

Previous Unit Price

The Unit Price from the part table appears
in the Previous Unit Price column.

Previous Total Cost

The total cost of this part prior to an update
appear in the Previous Total Cost column.

Resources
table

This information is displayed in the Resources table:

Resource ID

The ID of the resource used in the operation.

Current Setup Cost/Hr

The setup cost per hour that is defined for
the resource in Resource Maintenance.

Simulation Setup Cost/Hr

The setup cost per hour to use in the simulation.

Current Run Cost/Hr

The run cost per hour that is defined for
the resource in Resource Maintenance.

Simulation Run Cost/Hr

The run cost per hour to use in the simulation.

Current Run Cost/Unit

The run cost per unit that is defined for
the resource in Resource Maintenance.

Simulation Run Cost/Unit

The run cost per unit to use in the simulation.

Current Setup Bur/Hr

The current burden cost per hour of setup
time. This value is defined for the resource in Resource Maintenance.

Simulation Setup Bur/Hr

The burden cost per hour of setup time to
use in the simulation.

Current Run Bur/Hr

The current burden cost per hour of run time.
This value is defined for the resource in Resource Maintenance.

Simulation Setup Bur/Hr

The burden cost per hour of run time to use
in the simulation.

Current Run Bur/Unit

The current burden cost per unit produced.
This value is defined for the resource in Resource Maintenance.

Simulation Setup Bur/Unit

The burden cost per unit produced to use in
the simulation.

Current Fixed Bur

The current fixed burden cost for the operation.
This value is defined for the resource in Resource Maintenance.

Simulation Fixed Bur

The fixed burden cost to use in the simulation.

Previous Setup Cost/Hr

If the simulated costs are applied, then the
previous setup cost per hour. This is the value that the simulated
cost replaced.

Previous Run Cost/Hr

If the simulated costs are applied, then the
previous run cost per hour. This is the value that the simulated cost
replaced.

Previous Run Cost/Unit

If the simulated costs are applied, then the
previous run cost per unit. This is the value that the simulated cost
replaced.

Previous Setup Bur/Hr

If the simulated costs are applied, then the
previous setup burden cost per hour. This is the value that the simulated
cost replaced.

Previous Run Bur/Hr

If the simulated costs are applied, then the
previous burden cost per hour of run time. This is the value that
the simulated cost replaced.

Previous Run Bur/Unit

If the simulated costs are applied, then the
previous burden cost per unit. This is the value that the simulated
cost replaced.

Previous Fixed Bur

If the simulated costs are applied, then the
previous fixed burden cost. This is the value that the simulated cost
replaced.

Outside
Services table

This information is displayed in the Outside Services table:

Outside Service ID

The ID of the outside service used in the
operation.

Service Part ID

The ID of the part that is sent for service.

Preferred Vendor ID

The ID of the preferred service provider.

Current Cost/Unit

The cost per unit that is defined for the
service in Outside Service Maintenance.

Simulation Cost/Unit

The cost per unit to use in the simulation.

Current Base Charge/Unit

The current base charge per unit that is defined
for the service in Outside Service Maintenance.

Simulation Base Charge/Unit

The base charge per unit to use in the burden
cost per hour f setup time to use in the simulation.

Current Min Charge

The current minimum cost that is defined for
the service in Outside Service Maintenance.

Simulation Min Charge

The minium charge to use in the simulation.

Previous Cost/Unit

If the simulated costs are applied, then the
previous cost per unit. This is the value that the simulated cost
replaced.

Previous Base Charge/Unit

If the simulated costs are applied, then the
previous base charge per unit. This is the value that the simulated
cost replaced.

Previous Min Charge

If the simulated costs are applied, then the
previous minimum charge. This is the value that the simulated cost
replaced.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Cost_Simulation.md) User-defined Help