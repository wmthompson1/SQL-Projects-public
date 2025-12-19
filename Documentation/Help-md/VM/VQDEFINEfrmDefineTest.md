Using Test Definition




# Using Test Definition

After you have set up the global values in [Quality
Maintenance](VQAPLGLBWhat.md), use Test Definition to define and edit tests.

After you define a test, you can use Work Order and Operation Input
to link it to an operation in an engineering master or work order.

## Starting Test Definition

Test Definition is available from the Infor VISUAL Main window.

Select Test Definition from the Eng/Mfg menu.

The Test Definition window appears.

The table window in the Test Definition window
lists the test steps that belong to the test.

The table contains the following columns:

Step No - Together
with the Test ID in the header forms the primary key which uniquely
identifies the test step.

Seq No - Used in
sequencing the display of the test steps.

Type - The type
of SPC test. Valid types are XBar, proportion nonconforming (p), number
nonconforming (np), nonconformities per unit (u), number of nonconformities
(c).

Description - A
user supplied description of the test step.

Status - The current
status of the test step: Active (A), Inactive (I) or marked Deleted
(D).

Dimension Type -
There are three dimension types: Mean +/-, Max/Min, and Min/Max.

Aim - The aim or
target engineering specification.

LSL - The lower
specification limit.

USL - The upper
specification limit.

Limit ID - A user
defined ID of limits.

Limit Description
- A description of the limits.

Central Line X -
The central line of the control chart.

LCL X - The lower
control limit.

UCL X - The upper
control limit.

Central Line RS
- The central line of the range or standard deviation control chart.

LCL RS - The lower
control limit of the range or standard deviation control chart.

UCL RS - The upper
control limit of the range or standard deviation control chart.

R or S - Whether
Range or Standard deviation is used in XBar control charts.

Gauge ID - ID of
gage for this test step.

Gauge Desc - Description
of gage used for this test step.

Subgrp Size - Subgroup
size (i.e. number of measurements per subgroup). (The 3 in 3 out of
8 pieces).

Sample Size - Size
of the group from which subgroup size measurements are take. ( The
8 in 3 out of 8 pieces).

Freq Measure - The
type of measure used in sample size. (The pieces in 3 out of 8 pieces,
or the minutes in 3 out of 8 minutes).

Defect Class - The
defect classification, e.g. Critical, Major, Minor, etc.

Create Date - The
date the test was first defined and saved.

Last Update - The
date the test was last modified. (e.g. change in status or sampling
frequency).

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Defining_New_Tests.md)
Defining New Tests

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Test_Definition.md) User-defined Help