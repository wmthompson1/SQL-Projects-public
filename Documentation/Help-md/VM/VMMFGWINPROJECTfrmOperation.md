Adding Tasks to Projects




# Adding Tasks to Projects

After you create the base project, begin by adding
tasks to which you can add legs and materials. Because each task is
different and the information you want to enter for each task may
vary, the procedure below describes how to add a task with only the
basic information.

To add a task to a project:

1. Select the header or
   leg card (WBS element) to which you want to add the task.

When you select an object on a header, the
header to which it is attached is automatically selected.

2. From the Edit menu,
   select the Add Task.

You can also click the Add
Task button on the Form toolbar, press the CTRL+K keys or,
if your popup menu is active, right-click the header card and select
Add Task from the menu.

The Task dialog appears with the Duration
tab open.

 The Task Sequence Number is automatically
numbered.

3. If this task is for
   a specific type of resource, click the Type
   button and select the Type you want to use.

Types act as task templates and can contain
all of the appropriate information you need for the Task dialog box.

4. If you select a type,
   a Load Defaults dialog box appears. If you want to copy the default
   information, select the Yes button.

The appropriate information appears in the
task dialog box.

5. If you want to change
   the Task Sequence Number, click in the Task Seq # field and enter
   the number you want to use.
6. Click the WBS
   Task button and select the resource you want to perform
   this task.

Only the resources you have designated as
project resources appear in the WBS Task list.

If you specified a subcontractor type resource,
click the Service ID button and select the
Service ID for this subcontractor.

7. Click in the Duration
   Hr/Dy field and enter the number of days it will take to accomplish
   this task. Alternately, you can specify the Start Date and End
   Date for the task and VISUAL automatically populates the Duration
   Hr/Dy field. You can also specify the Start Date and duration
   days and VISUAL automatically populates the End Date.

The decision to enter specific dates may
be either managerial or based on contractual obligation with your
customer. Remember, if you enter dates, the VISUAL Scheduler uses
the dates you enter.

If you want VISUAL to automatically associate
the task element when you enter the WBS Code, select the Default
Task for Manufacturing check box. Entering the WBS Code on
the header card in the Manufacturing window causes VISUAL to automatically
add the WBS element information in the Proj Ref Seq # field.

VISUAL only allows you to have one task
marked as Default Task for Manufacturing.

8. Click in the Specifications
   text field and enter any comments or specifications about this
   task.

These specifications appear on the task
card in the Project window.

9. Click in the appropriate
   fields and enter the Move information you want for this task.

In the Move Hrs field, enter the number
of hours that must pass between the end of this task and the beginning
of the next.

10. If you want material
    moved from one task to the next before the first task is complete,
    click in the Min Move Qty field and enter the minimum number of
    pieces you want moved. This allows scheduling of overlapping tasks
    based on a continuous quantity of material feeding from one task
    to the next.

If you do not want tasks to overlap, leave
the Min Move Qty field blank.

11. To specify the maximum
    overlap possible, enter 0.0001, the smallest minimum move quantity
    that VISUAL supports.
12. Click the Save
    icon on the Form toolbar.

VISUAL adds the operation to the Project
Window.

## Entering Information on the Other Tab

You can use the tests you set up in Test Definition
Maintenance to test the tasks in your project. By testing the results
of each task, you can ensure that the product is correct before you
begin the next task.

Enter the following information on the Other tab:

Test ID - Click the Test
ID button and select a Test ID to use for this task. The Test
ID and Drawing Number information appear.

VISUAL runs the test after you enter the results in Lists of Tests.

Capacity Use - If you want to specify
a minimum or maximum number of resource units needed for this task,
click in the appropriate field and enter the number of units you want
to use.

Schedule Discontinuous - If you want to
override the default values for discontinuous tasks, select the Schedule Discontinuous check box.

If you select the Schedule Discontinuous
check box, you can specify the minimum number of hours you want to
use for each schedule segment. Click in the Minimum Segment Size field
and enter the number of hours you want to use.

Obsolete - If this resource has been designated
Obsolete in Shop Resource Maintenance, then this check box is selected.
You cannot edit this check box in the Task dialog box.

Maximum Gap From Previous Operation -
Click in the Max Gap From Previous Op field and enter the maximum
number of minutes you want to have between scheduled segments.

## Entering Information on the User Defined Tab

Use the User Defined tab to enter additional information about the
task.

To bring the focus to the User Defined tab, click the User Defined
tab.

Click the User Defined Field Layout ID arrow and select the layout
for the tab. Enter the information you want in the appropriate fields.

For more information on setting up User Defined Fields, refer to
your VISUAL documentation.

When you have finished entering user defined information for this
project, click the Save button on the toolbar.

## Entering Information on the Budget Tab

Use the Budget tab to enter budget information for the selected
task.

You can also enter budget information in Budget Maintenance window,
available from the Project Summary window.

To bring the focus to the Budget tab, click the Budget tab.

To add a budget line item, click the Insert Row button on the tool
bar. Enter information in the following fields:

Dept ID - Double-click the Dept ID button
and select the department you want to use for this budget setup.

Cost Cat ID - Click the Cost Cat ID button
and select the cost category you want to use for this budget setup.

Hours/Amount - Depending on the cost category
you select, enter the number of hours for this line item in the Hours
field or enter a monetary amount in the Amount field.

Dist ID - Double-click the Dist ID button
and select the active Distribution ID you want to use for this budget
setup. The Distribution ID determines how VISUAL spreads the budgeted
hours/costs across the duration of the task.

## Entering Information on the ETC Tab

Before you can use the ETC Tab to enter estimate to complete figures,
you must initialize the first ETC. For more information, refer to
[Initializing
Estimate to Complete Figures](Initializing_Estimate_to_Complete_Figures.htm).

Use the ETC tab to maintain estimate to complete figures for the
task. You can also maintain ETCs in the Maintain ETC window available
from the Project Summary window.

To bring the focus to the ETC tab, click the ETC tab.

To revise ETC information, click in the Hours and Amounts fields
and adjust the figures as necessary.

If you would like to enter a new department/cost category combination
for the task, click the Insert Row button.

Double-click the Dept ID button and select
the department you want to use.

Double-click the Cost Cat ID button and
select the category you want to use.

Scroll to the period to which you want to add the cost, and add
the cost you want.

If you would like to enter new fiscal periods, use the Insert
Start Period and Insert End Period
buttons. Click the Insert End Period to add a period to the end of
the ETC. Click the Insert Start Period to add a period at the beginning
of the ETC.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Project_Window.htm) User-defined Help