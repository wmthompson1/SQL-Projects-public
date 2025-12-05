Recording Outgoing Service Operations




# Recording Outgoing Service Operations

You can record outgoing service operations using Service
Receipt Entry.

To update service status:

1. Select Service
   Status from the Edit menu.

The Service Status dialog box appears. This
dialog displays service information for a specified subcontractor
resource.

2. Enter the Resource ID
   for the subcontractor resource. You can also press the Resource
   ID button and select the Resource ID from the Shop Resources
   table. All shop resources appear in the browse list; you can only
   select subcontractor type resources.

The table displays one line for each firmed
or released work order operation that uses the specified subcontractor
resource.

The following read-only information appears:

Work Order ID
- This column shows the work order Base ID, Lot ID, and Sub ID of
the service operation, in the format Base ID - Sub ID / Lot ID.

Oper # - The sequence
number of the operation.

Part ID/Description
- The Part ID and Part Description of the fabricated part.

Quantity - The
number of pieces that require the specified subcontracted service.

Scheduled Start Date/Scheduled
Finish Date - The scheduled start and finish date for the service
operation. The Global Scheduler determines these dates for the production
schedule. If the Scheduler has not scheduled this operation, no dates
appear in these fields.

Service Begin Date
- This is the only editable field. Use this field to record the date
that service materials were shipped to the contractor.

3. To indicate that materials
   have been shipped for subcontract work, enter the Service Begin
   Date for any work order operations that have been shipped.

If this field is initially blank, it automatically
defaults to the current date when you click this field. You can change
it to another date, if required.

The Global Scheduler uses this date to relieve
the schedule of any in-transit days for subcontracted operations that
have already passed. For example, consider a new global schedule run
on 9/15/2001, and a work order service operation that has a Service
Begin Date of 9/10/2001. If the service operation has 10 transit days,
the scheduler understands that only 5 of these now apply.