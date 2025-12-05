Setting Work Order Status




# Setting Work Order Status

Work orders and their operations, materials, and legs
all have independent status values. This supports concurrent engineering
and manufacturing by allowing individual operations and legs to be
released while other portions are in process or not even created yet.

VISUAL uses the following status values:

Unreleased - Engineering is in process,
or dates and quantities are not firm.

Firm - Engineering is complete, and dates
and quantities are firm.

Released - Work is authorized to start
based on the specified release date.

Setup Complete - For operations only,
setup is complete, operation is ready to run. This is really a sub-status
of Released.

Closed - Work Order is completed.

Canceled - Work Order will not be started
or completed.

A great many Infor VISUAL functions and reports operate on work
orders that have a status value or values that you can specify. Many
others VISUAL functions work strictly with work orders of a specific
status.

For material planning and shop scheduling purposes, VISUAL usually
treats Firm and Released work orders, operations, and legs the same.
These status values indicate that they should be considered as causing
demand and producing supply.

In general, only Released operations have labor reported against
them, and only Released material requirements are issued. However,
you are allowed to perform these functions on Firm and Unreleased
operations and materials, though VISUAL issues warnings.

A work order must be firm or released before any of its finished
goods can be received into inventory or issued to a customer order
or another work order. New operations and requirements added to an
in-process work order are added with a default status of Unreleased.
This allows control of deviations to a standard process.

To set the status of work orders and their operations,
legs, and requirements:

1. Open the work order
   in the Manufacturing Window.
2. Select the lowest level
   object (header, leg, operation, material) for which you wish to
   set the status.
3. Select the desired status
   from the Status Change menu.

The Status Change dialog box appears.

The default behavior for a status change
is to set the status of all subordinate objects to the same status.

If you selected the work order header, this
changes the status of all objects on the work order. If you selected
a leg, this changes all of the operations and requirements on the
leg. If you selected an operation, this changes all material requirements
and legs on the operation as well. Material requirements have no subordinate
objects.

4. If you only wish to
   change the status of the selected object, clear the Change Status
   of Subordinate Materials and Operations check box.
5. Click the Ok
   button.

VISUAL changes the status of the object.

You can control which status values can
be set on a per-user basis, using the Application User Permissions
command of Application Global Maintenance. This allows a user to create
an unreleased or firm work order, but requires a different user to
actually perform the release. These permissions only apply to these
explicit status changes; automatic ones are performed regardless of
permissions.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Manufacturing_Window.htm) User-defined Help