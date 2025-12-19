Overview of Project Components and Relationships




# Overview of Project Components and Relationships

Because Project functionality is interwoven with VISUAL,
it is important to understand the relationships between the components
of VISUALs Project and execution systems.

Use the Project Window to establish the reporting structure of your
contract or project. Projects represent contracts or any other work
initiatives you need to manage. For example, capital improvements,
research and development, or product builds.

Use Work Breakdown Structures (WBSs) to break projects into manage
able components. You can then break WBS elements into their lowest
level for cost accumulation.

Customer orders represent "Contracts" and the individual
lines on each customer order represent Contract Line Items (CLINs).
As VISUALs planning system converts demand into supply, VISUAL maintains
the project, WBS, and task links throughout the system.

VISUAL also:

* Links inventory transactions
  to projects to ensure proper asset management and control
* Establishes Project warehouses
  to maintain inventory by project.

Linking work orders and purchase orders to projects allows you to
directly link labor and material purchases to those Projects and to
VISUALs integrated Project Accounting System. In addition, you can
charge labor or purchased goods directly to projects outside the formal
planning system.

Use the Project Summary Window or the budget tabs in the Project
window to develop the project budget. The project manager will also
use the Project Summary window to view actual project costs and use
VISUAL's Earned Value Management Tools to determine the project's
progress against plan.

## Mixed Mode Accounting: Project vs. Non-Project

VISUAL supports both project and non-project accounting environments
within the same database. In a non-project environment, general accounting
traces the following path:

Purchase material to inventory

Issue material to Work in Process

Transfer finished product into finished goods inventory

Upon shipment, VISUAL transfers the costs from Finished Goods into
Cost of Goods Sold. At this point, you bill the customer and VISUAL
recognizes the revenue.

During these non-project transactions, VISUAL maintains the G/L
accounts at the part level, then product code level, and lastly via
the G/L interface.

Within a project environment, the accounting rules are different:

When you bring material to a projectregardless of whether that
mate rial physically sits in project inventory or you issue it to
a project work orderVISUAL typically assigns the costs to Project
work in process. For internal company projects, these costs may go
directly to an expense account. Typically, in a project environment,
projects do not yield finished goods. Furthermore, when you ship goods
against a project, VISUAL may or may not trigger a billing and/or
revenue recognition event and simultaneous booking to cost of goods
sold. For these reasons, VISUAL maintains the G/L accounts for project
transactions are maintained within the Project G/L Mapping utility.

While the G/L accounts used and the flow of costs within VISUAL
differs for projects and non-projects, the rates and application of
overhead/ burden calculations must be consistent throughout the system.
Overhead calculations for the commercial or non-project side of your
business are correctly processed via mappings to a project type that
you mark as being Commercial.
Even if all of your business is project oriented, you may purchase
material to common inventory
and then issue to projects as you need. If this is the case, you should
handle these purchases as Commercial. You may also want to handle
the sale of spare parts after project completion in the same manner.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_General_Project_Topics.md) User-defined Help