Applying Engineering Changes to Work Orders




# Applying Engineering Changes to Work Orders

After you specify an ECN for an engineering master, you can apply
the changes to work orders associated with the engineering master.

The system applies the changes depending upon the Allow application
of ECN to unreported reqs to in-process work orders setting in Application
Global Maintenance. If you selected this check box, then the system
applies ECNs to work orders that are already in process, provided
that labor has not already been reported or material issued to the
operations and requirements affected by the ECN. The system will also
apply ECNs to work orders associated with the engineering master that
are not already in process. The system will not apply ECNs to split
work orders or work orders with active demand links.

If the ECN update has any impact on a requirement or operation that
has actual labor or material issues, the system will not update the
work order. For example, if an ECN changes a quantity per on a leg
header card, the system will not update the work order if labor or
materials have been applied under the leg.

If the check box is cleared in Application Global Maintenance, then
the system applies ECNs to work orders that are not in process only.

To apply changes:

1. Select the ECN line
   that you would like to apply to work orders. The ECN line must
   apply to either a Work Order or Engineering Master.
2. Click the Apply
   Changes button on the tool bar, or select Edit,
   Apply Changes to Work Orders.
3. The Apply change detail
   to work orders dialog box lists the work orders associated with
   the engineering master or work order you selected. The system
   places a check box in the Skip column if an associated work order
   cannot be changed. You can choose to skip additional work orders
   by selecting the Skip check box.
4. Click Apply.
   The system updates the work orders that are not designated as
   Skip.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_ECN_Entry.htm) User-defined Help