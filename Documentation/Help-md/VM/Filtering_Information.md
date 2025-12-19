Filtering Information




# Filtering Information

Use the options in the Info menu to filter the information that
the system displays in the Scheduling Window.

## Highlighting Work Orders

When you highlight a work order, the program shows the operations
for the highlighted order in yellow (light yellow for operations scheduled
before the orders want date, bright yellow for operations scheduled
after the orders want date).

This makes it easier for the user to identify the operations belonging
to a particular work order during the users analysis of that Work
Orders schedule.

You can highlight a work order in two ways: enable the Highlight
Work Orders on Select feature or using the Set Highlight Work Order
dialog box to select a specific work order.

### Highlighting Work Orders Using Highlight Work Orders on Select

When you enable this feature, the system highlights the work order
when you click an operation or task in the scheduling window. To enable
this feature, select Info, Highlight
Work Order on Select. The system places a check box next to
the menu item.

### Highlighting Work Orders the Using Set Highlight Work Order Dialog Box

To highlight a specific work order using the Set Highlight Work
Order dialog box:

1. Select Set
   Highlight Work Order from the Info menu.

The system lists all firmed and released
work orders.

2. Select the work order
   you want to highlight.
3. Click OK.

The Scheduling Window returns. The horizontal bars for the highlighted
work order are yellow. Operations that VISUAL has scheduled on time
are light green. Late operations are a darker yellow.

## Viewing Highlighted Work Orders

If you would like to view the highlighted work order in the Manufacturing
Window or the highlighted project in the Project Window, select Info, View Highlighted Work
Order. You can also press Shift+F9.

## Highlighting the Determinant Path

Use Highlight Determinant Path from the Info menu to highlight the
operations along the determinant path for the highlighted work order.

The determinant path is the set of operations in a work order that
controls the duration of the work order. VISUAL measures this AFTER
it takes resource constraints into account. A path that you measure
before considering these constraints could be called a critical path.

To highlight the determinant path:

1. Click an appropriate
   work order to give it the focus.
2. Select Highlight
   Work Orders on Select from the Info menu.
3. Select Highlight Determinant
   Path from the Info menu.

VISUAL highlights the operations along the determinant path. The
determinant path operations appear in the Scheduling Window as green
bars. Determinant path operations that are late appear as dark green
bars.

## Highlighting Operations

You can choose to view only those operations that are late or just
in time. You can also choose to view any operation associated with
a late work order, whether the operation itself is late or not.

To view all late operations, select Highlight
Late Operations from the Info menu.

VISUAL highlights all late operations in red.

If you are just beginning to implement scheduling and have a large
number of late work orders, you may want to deactivate this option
until you have been running scheduling regularly.

To view all operations associated with a late work order, select
Highlight All Operations for Late Work Orders.

VISUAL highlights any late operations in red. If the operation itself
is on time, then VISUAL highlights the operation in purple.

## Showing Work Orders and Projects

If you are licensed to use VISUALs Projects features, you can choose
to view only project-related information. Use the following options
to filter the information that the system displays:

Show Work Orders and Projects Select
this option to view all projects and work orders.

Show Work Orders Select this option
to view work orders only. The system does not display any scheduled
projects as defined in the Project window, but it does show any work
orders associated with a project. It also shows all non-project related
work orders.

Show Projects Select this option to
view projects only.

Include Project Work Orders The system
activates this option if you select the Show Projects option. Select
Include Project Work Orders if you would like to view any work orders
associated with projects.

Show Work Orders by Task The system
activates this option if you select the Show Projects option. If you
select this option, the system displays any work orders associated
with the project task you select.

## Showing the Focus Work Order

You can limit the Scheduling Window to display only the operations
of the work order to which the focus operation belongs and the resources
those operations use. This option is very useful to examine the schedule
for a single work order that might otherwise require you to scroll
the display.

To show only the focus work order and related information:

Select Show Focus Work Order from the
Info menu.

The Scheduling Window removes all other information and displays
only the focus work order operations and the resources used by those
operations.

## Showing All Work Orders

Showing all work orders is the default behavior of the Scheduling
Window. Use the Show All Work Orders command to leave the Show Focus
Work Order mode.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Scheduling_Window.md) User-defined Help