Starting Service Planning




# Starting Outside Service Planning

The Outside Service Planning Window shows the demand
for outside services coming from work orders vs. the dispatch and
receipt information. It aids you in determining when purchase orders
for outside services need to be placed and what is currently dispatched
to outside services. Linked service purchase orders and linked service
dispatches (supply) are displayed on the same row as the linked contractor
operation (demand).

To start the Outside Service Planning window:

1. Select Outside
   Service Planning Window from the Purchasing menu.

The Outside Service Planning window appears.

2. If you are licensed
   to use multiple sites, click the Site ID arrow and select the
   site to view. If you are licensed to use a single site, this field
   is unavailable.
3. Enter the Service ID in the Service ID field.
4. Select the Vendor ID
   from the Vendor menu.
5. If you want to show
   the selected vendor only, select the Show Selected Vendor Only
   check box

You can view the following information:

Transit
Days - For subcontractor operations, enter Transit Days. This
is the total time between the start of the operation and the time
the material is back in house and ready for the next operation.

Run/RunType - Use the Run
and Run Type fields together to express the run time.

In the Run field, enter the number of the
run, which you qualify in the Run Type field.

You can specify run time in Hours/Piece,
Pieces/Hour, Minutes/Piece, Pieces/Minute, Hours/Load, Loads/Hour.
Keep in mind that "piece" refers to any unit quantity of
the material.

For example, if a product is produced in
feet, and you know it takes 15 minutes to produce a foot, the run
time is 15 Minutes per Piece. Enter 15 in the Run field, and Minutes/Piece
in the Run Type field.

Load
Size - You can also express run time in terms of a standard
load size for the resource. Use the field when the material is processed
in discrete loads. When you specify Hours/Load of Loads/Hour, you
must also provide the load size.

VISUAL breaks the Start Quantity for the
operation into the number of loads needed. For example, if 101 units
are incoming and the load size is 100, VISUAL needs to process two
loads to complete the job.

Minimum
Move Quantity - The minimum quantity required to be completed
at this resource before moving it to the next operation.

Usage
Unit of Measure - The usage unit of measure for this part appears.

Unit
Cost - The price per unit

Minimum
Charge - The minimum that the system will charge for a service.
If the service ordered costs more than the minimum charge allowed,
then the system charges the actual cost. If the service ordered cost
is less than the minimum charge, the system charges the minimum charge.

Base
Charge - The one time fixed cost for performing the basic service.
This cost plus the cost per unit multiplied by the units of service
is the total cost for a specific service.

Service
Part ID - The part ID sent to the outside service vendor.

Date Required
- The date the parts are required to be returned from the outside
service vendor.

Total Quantity Required
- The total part amount needing service.

Total Quantity Dispatched
- The part amount sent to the outside service vendor.

Quantity Completed
- The part amount completed.

Quantity Required
- The amount of serviced parts required from the outside service vendor.

Net Quantity Dispatched
- The net part amount sent to the outside service vendor.

Stat - Allows
you to indicate the status of the service.

Operation Vendor ID -
Vendor ID performing the outside service.

Peg To  The Work
Order ID..

Quantity Ordered
- The total part amount from the purchase order to be sent to the
outside service vendor.

Total Quantity Dispatched
- The total part amount sent to the outside service to date.

Quantity Received
- The serviced part amount received from the outside service vendor.

Net Quantity Due
- Enter the net quantity due.

Net Quantity Dispatched
- The net part amount sent to the outside service vendor.

Due Date - The
date the order is due.

Release Date -
The date the order was released.

Stat - Allows
you to indicate the status of the service.

Due Vendor ID -
A unique ID of the due vendor.

Order ID - The
ID for that particular order.

Order Line # -
The purchase order line number for the outside service.

Issue Late - If
you issue a service late to a work order, the number of work days
it is late appears.

Order Late - If
you order a service late to a work order, the number of work days
it is late appears.

Release Late -
If you release a service late to a work order, the number of work
days it is late appears.

Suggested Release Late
- If service is late, the date VISUAL calculates that you should
release the order.

Order Proj Early -
If you expect to complete an order early, the number of days you project
it to be early appears.

Order Proj Late -
If you expect to complete an order late, the number of days you project
it to be late appears.

Release Near -
The date you should release the order near.

Suggested Release Near
- The date VISUAL calculates that you should release the order
near.

Exception - Specifies
the dispatch state.

Suggested Release -
The date VISUAL calculates that you should release the order.

Schedule Start
- This is the date on which the first operation of the work order
would start. You may wish to focus on the difference between this
date and the release date to get a feel for the days delay before
work would be started.

Schedule Finish
- This is the date on which the work order is scheduled to finish.
If youre checking against a specified Want Date, compare whether
this date is on or before it. If not, the check shows that the date
cant be met with the schedule as it stands. You may want to run the
check against an Infinite schedule to see where the overload resources
are.

If youre checking to determine a lead time,
you can subtract this date from the Release Date to get a lead time.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Outside_Service_Planning_Window.htm) User-defined Help