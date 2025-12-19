Understanding the Manufacturing Window Display




# Understanding the Manufacturing Window Display

The Manufacturing
Window provides a vast array of information for each object. The following
data appears on the faces of cards in graphical modes, and on the
lines in text mode. In one-window graphical mode, information appears
on subsequent lines of the index card. The cards appear front to back
in the following order: header information, material requirements
for an operation, then operations.

In the example above, the header card is followed by the material
for Operation 10. Operation 10 follows, then Operation 20, which has
no material requirements. Operation 30 is subcontracted operation
out of house. The next three materials are requirements for Operation
40. Operation 40 follows, then Operation 50, which has no material
requirements.

For one-window text mode, all information appears on one line. For
two-window text mode, limited information appears for headers and
operations, and material information appears in a separate window.

## Popup Cards

In all display modes, you can get a full summary of information
for an object by placing the pointer on the object and pressing the
right mouse button. An informational index card appears with one to
four lines of information concerning the object.

You can display the popup card for multiple objects without releasing
the right mouse button drag the pointer around to each object, and
the card automatically changes.

## Header Information

The Header Information is on the front card. The header information
differs slightly for work orders, engineering masters, and quote masters.

## Card Line 1/Text Column 1 Information

Line 1 of the card in graphical mode and column 1 in Text Mode contains
the following information.

Type

For an engineering master, the letter M is
shown.

For a quote master, the letter Q is shown.

For a work order, the current status of the
work order is shown in parentheses. U for unreleased, F for firm,
R for released, C for closed, and X for cancelled.

Base ID

For an engineering master, this is Base ID/Engineering
ID. Engineering ID is omitted if it is zero. Remember that the Base
ID is always the Part ID.

For a quote master, this is the Base ID/Engineering
ID. Remember that the Base ID is always the Quote ID, and the Engineering
ID refers to the line within the quote.

For a work order, this is the Base ID/Lot
ID. Split ID.

Part ID

Identifies the part associated with the master/work
order. For a work order, this may be blank if its a custom job.

Part Description

The description of the part from Part Maintenance.

## Card Line 2/Text Column 2 Information

Quantity

For an engineering master, this is the standard
lot size.

For a work order, this is the desired quantity.

Specifications

The first line of the specifications from
the master/work order header.

## Card Line 3/Text Column 3 Information

The information in the third line applies only to work orders.

Days Early/Late

The difference between the scheduled finish
date and the current date. A negative value indicates a late order,
a positive value an early one.

Desired Want Date

The date by which you want the work order
completed.

Scheduled Finish Date

The scheduled Finish Date of the work order
as determined by the Global Scheduler. This appears in parentheses

Desired Start Date

The date on which you want to start the work
order.

Scheduled Start Date

The scheduled start date of the work order
as determined by the Global Scheduler.

## Card Line 4/Text Column 4 Information

Elapsed Days

The elapsed days between release date and
the current date.

True Prod. Hours

The total setup and run time for all operations
on all legs, irrespective of calendar time taken to perform them.

Viewing Header Information
in the Engineering/Work Order Dialog Box

You can also view the header information by
double clicking on the header card in graphical mode or the first
line in the first column in text mode.

The Engineering/Work Order dialog box appears.

## Material Requirement Information

If an operation requires certain materials, Material Requirement
information precedes the operation information after the Header card.

To view the entire contents of the material requirement card, right
click the card and hold the mouse button down.

The Material Requirements popup card appears.

## Card Line 1/Text Column 1 Information

Piece No.

The piece number for the material requirement
within the operation.

Part ID

For an inventory part, the Part ID. Otherwise,
this is blank.

Description

For an inventory part, description of the
Part ID from Part Maintenance. Otherwise, the Specifications for the
material are shown here.

## Card Line 2/Text Column 1

Status

For work orders only, the status of the material
requirement is shown.

Date

For work orders only, the required date of
the material is shown. This is usually equal to the start date of
the operation. If the material has been issued, then the last issue
date is shown instead. Not shown in two-window mode.

Qty Required

The calculated quantity required, in terms
of the stock unit of measure. Not shown in two-window mode.

## Card Line 3/Text Column 3 Information

Quantity Per

The Quantity Per from the material requirement.

Scrap Percent

The Scrap percent from the material requirement.

Fixed Quantity

The Fixed quantity from the material requirement.

## Viewing Material Information in the Material Information Window

You can also view the material information by double clicking on
the material card in graphical mode or the first line in the first
column in text mode.

The Material Information window appears.

## Operation Information

Operation information cards follow any material requirement cards
for that operation.

To view the entire contents of the operation card, right click the
card and hold the mouse button down.

## Card Line 1/Text Column 1 Information

Seq. No.

The sequence number for the operation.

Resource ID

The primary Resource ID for the operation.

Specifications

The description or other specifications for
the operation.

## Card Line 2/Text Column 2 Information

These items appear only for work orders.

Status

The status of the individual operation. An
additional status of S/U indicates that the operation is released
and the setup portion has been completed.

Start and Finish Date

The scheduled Start Date and scheduled Finish
Date, if the work order has been scheduled.

Delay

The days delay for the operation appears in
parentheses. This indicates the difference between the time the operation
could finish with an ideal schedule, and the time it is actually scheduled
to finish.

## Card Line 3/Text Column 3 Information

For In-House Operations:

Setup Time - The
setup hours for the operation.

Run Time - The calculated
run hours for the operation.

For Subcontracted Operations:

Service ID - Service
ID specified in operation.

Transit Days - Number
of transit days for service, specified in operation.

Quantity In - The
Start Quantity as discussed previously.

Quantity Out - The
End Quantity as discussed previously.

## Viewing Operation Information in the Operation Information Window

You can also view the operation information by double clicking on
the operation card in graphical mode or the first line in the first
column in text mode.

The Operation Information window appears.

## Leg Information

The leg information card displays similar information to the header
card.

## Card Line 1/Text Column 1 Information

Type

For an engineering master, the letter M is
shown.

For a quote master, the letter Q is shown.

For a work order, the current status of the
work order is shown in parentheses. U for unreleased, F for firm,
R for released, C for closed, and X for cancelled.

Base ID

For an engineering master, this is Base ID/Engineering
ID. Engineering ID is omitted if it is zero. Remember that the Base
ID is always the Part ID.

For a quote master, this is the Base ID/Engineering
ID. Remember that the Base ID is always the Quote ID, and the Engineering
ID refers to the line within the quote.

For a work order, this is the Base ID/Lot
ID.Split ID.

Part ID

Identifies the part associated with the master/work
order. For a work order, this may be blank if its a custom job.

Part Description

The description of the part from Part Maintenance.

## Card Line 2/Text Column 2

Quantity Per - As
specified for the leg.

Specifications -
The first line of the specifications from the leg header.

## Card Line 3/Text Column 3

This information appears for work orders only.

Days Early/Late -
This is the difference between the scheduled finish date and the current
date. A negative value indicates a late order, a positive value an
early one.

Scheduled Start -
The scheduled Start Date of the leg as determined by the Global Scheduler.

Scheduled Finish -
The scheduled Finish Date of the leg as determined by the Global Scheduler.

## Completion Meters

For work orders, a horizontal bar appears at the top of each card
in graphical mode, and to the left of each line in text mode. This
bar indicates the percentage of the total completion for the object.
It begins empty, and fills in black as work progresses.

For the header, the bar indicates the percentage of goods received
into finished goods versus the total desired quantity. For operations,
the bar shows the percentage of Quantity Completed reported through
labor ticket entry or service entry versus the End Quantity required
of the operation. For material requirements, the bar shows the percentage
of material issued though inventory transaction entry versus the total
calculated quantity required.

## Determinant Path

The "determinant path" for a work order is the string
of operations (a path) that controls the total duration of the work
order. Whereas "critical path" is the controlling path in
an ideally scheduled work order, the determinant path also takes into
account schedule delays caused by unavailability of resources.

Determinant path for a work order is shown in the graphical mode
of the Manufacturing Window by a darker outline around each operation
on the path. The work order must be scheduled into the production
schedule to show a determinate path.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Manufacturing_Window.md) User-defined Help