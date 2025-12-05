Updating Legs from Engineering Masters




# Updating Legs from Engineering Masters

You can update a leg on any type of master: work order, engineering
master, or quote master. You cannot update a leg if any one of the
following conditions is true:

* Quote masters linked to
  quotes that have been printed.
* Any master with an active
  ECN, unless you are on the implementation team for the ECN.
* Any work order with a status
  of Closed or Canceled.
* Any work order with transactions
  against any part of the leg.
* Any master where the Allow
  Update from Master check box is not selected on the Engineering
  tab.

To update a leg from an engineering master:

1. Select Edit,
   Update Legs from Master.
2. If you accessed the
   dialog box from an engineering master, the system inserts the
   Part ID and Source Eng ID. Click the Source
   Eng ID arrow to select another engineering master. You
   can select a different part by clicking the Part
   ID browse button and selecting a part, then selecting the
   Source Eng ID.
3. Use the filters to limit
   the masters the system displays in the table. Choose from the
   following options:

Type Select
the type of master to view. Select from Work orders, Eng Masters,
and Quote Masters. You can select more than one option.

Status Select
the status of the work order. Select from Firm, Released, Unreleased,
Closed, or Canceled. You can select more than one option. While you
can view Closed or Canceled masters in the table, you cannot update
them.

Include updatable legs
only Select this check box to view only legs that are eligible
to be updated. Refer to [Designating
Legs and Engineering Masters as Eligible for Updating](Designating_Legs_and_Engineering_Masters_as_Eligible_for_Updating.htm). Clear the
check box to view any master where the part ID is used for a leg.

Exclude legs already
updated to part engineering ID Select this check box to exclude
any legs that have already been updated by the selected engineering
master. Click the arrow to specify the master.

Exclude legs updated
after Select this check box to exclude any legs that have
been updated after the date you specify. Click the calendar button
to select the date to use.

The system inserts the masters that meet
your filter criteria in the table. The table contains the following
information:

Update Leg Click
the check box if you want the system to update the leg when you click
the save button. Clear the check box if you do not want to update
the leg. Click the Mark All button to select all masters eligible
for updating. Click the Unmark All button to clear all Update Leg
check boxes.

Work Order/Master Leg
The system inserts the ID of the master or leg where the part is
used.

Message The
system inserts Leg does not allow updates if the leg is not eligible
to be updated. The system displays this message if the Allow Update
from Master check box has been cleared on a leg card, if the master
is Closed or Canceled, or if the work order has any transactions against
the leg to be updated. If the master has an active ECN, the system
displays the Leg does not allow updates message if you are not on
the implementation team. If you are on the implementation team, the
system displays a caution message.

The system inserts Update Allowed if the
leg can be updated.

Work Order Status
The system inserts the current status of the master.

Leg Status The
system inserts the current status of the leg.

Quantity Per
The system inserts the quantity of part required per end product produced
as specified on the master or leg header card. You can change this
value. Click in the Quantity Per field and specify a new value.

Scrap % The
system inserts the percentage of part lost as scrap during the production
process as specified on the master or leg header card. You can change
this value. Click in the Scrap % field and specify a new value.

Fixed Quantity
The system inserts the fixed quantity of the part consumed as specified
on the master or leg header card. Fixed quantity is a one time quantity
of the required material that is used regardless of the work order
quantity. You can change this value. Click in the Fixed Quantity field
and specify a new value.

Unit of Measure
The system inserts the unit of measure of the part.

Dimensions The
system inserts the dimensions as specified on the master or leg header
card. You can change this value. Click in the Dimensions field and
specify a new value.

Last Update From Ref
If the leg has been updated before, the system inserts reference
information from the most recent previous update.

Last Update Part Eng
ID If the leg has been updated before, the system inserts
the part engineering ID used in the most recent previous update.

Last Update Date
If the leg has been updated before, the system inserts the most
recent update date.

Last Update User ID
If the leg has been updated before, the system inserts the ID fo
the user who last updated the master.

4. Click Save.
5. The system asks if you
   want to print a pre-update engineering report. The pre-update
   engineering report displays the original information from the
   masters before any changes are applied. Click Yes
   to view the report or No to proceed
   with the update without viewing the report. If you select yes,
   specify the output options and click Ok.
   Print a copy of the report so you can compare it to the after-update
   engineering report.
6. After the system updates
   the masters, it asks if you want to print an after-update engineering
   report. You can compare this report to the pre-update engineering
   report to view the changes the update process made. Click Yes to view the report. Click No
   if you do not want to review the report.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Manufacturing_Window.htm) User-defined Help