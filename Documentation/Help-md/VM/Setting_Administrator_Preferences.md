Setting Administrator Preferences




# Setting Administrator Preferences

Administrator Setup contains options controlling the
operation of VISUAL ALTS. You can only access Administrator Setup
when you are signed in as SYSADM. You must set these options for EACH
wedge station.

1. Select the Admin menu.

The Preferences/Setup dialog box appears.

2. Enter the following
   preferences:

Duration Threshold
- This number, specified in hours, represents the longest transaction
allowed for an operator to enter. When an operator tries to complete
an in-process transaction with a longer elapsed time than this threshold
(up to a maximum of 24 hours), VISUAL does not allow the transaction,
displaying a You have been clocked in for more than 12 hours...
message. You must complete the transaction using manual Labor Ticket
Entry, keeping in mind that automatic breaks will not be accounted
for.

Default Indirect ID
- This is the Indirect ID VISUAL uses to cover all non-direct time
not specifically logged using the Indirect action.

Multiple Jobs
- This controls whether a single employee is allowed to simultaneously
have multiple in-process transactions. You have two choices in allowing
multiple jobs:

Prorate Hours Spent on
Work - For each overlapping ticket for the same employee, this
option divides elapsed time by the total number of simultaneous tickets
and adjusts the elapsed hours accordingly. For example, If two jobs
(run simultaneously) begin at 1:00 and end at 3:00, the hours worked
will be 1.0 for each job (2 hours / 2 jobs).

Prorate Cost of Work
- VISUAL adjusts the multiplier of overlapping tickets to a value
less than one, based on the amount of overlapping time. Using the
example above but under this proration method, hours worked are 2.0
hours for each ticket and the multiplier for each is .5 (calculated
as 1 divided by the number of jobs = or .5). You can view this multiplier
in the Multiplier 2 field of manual Labor Ticket Entry. Only if
you look at the Detail or Summary Labor Report, will the hours calculated
include the multiplier, showing hours worked as 1 hour for each job
(2 hours \* .5 = 1 hour).

The option you choose partially depends
on if you want tickets to accurately reflect the real elapsed time.
If you do, choose Prorate Cost of Work. Both options will result in
the same labor costs but not burden costs. Prorate by Cost assigns
burden without regard for other jobs in process, i.e., it does not
prorate burden. Prorate by Hours assigns burden based on the prorated
hours.

For example, assume Job A and Job B have
a resource burden costing $20 an hour and the employee running the
jobs is paid $10 an hour. Job A and B are run simultaneously for one
hour. Prorate by Cost assigns $5 for labor (($10/hour \* 1 hr.) / 2
jobs) for each job and $20 for burden on each job ($20/hour \* 1 hour),
totaling $10 for labor and $40 for burden during that one hour. Prorate
by Hours calculates $5 for labor (($10/hour \* 1 hr.) / 2 jobs) and
$10 for burden (($20/hour \* 1 hour) / 2 jobs) on each job, totaling
$10 labor and $20 for burden for the one hour.

Typically, a machine-intensive shop will
prorate by cost to assign full burden to each machine. Labor-intensive,
assembly-oriented shops typically use prorate by hours. Efficiency
ratings (under production schedule reports) will be meaningful using
this method.

Automatically Compute
Quantity Complete - Check this box to compute quantity complete
based on elapsed time. The resource for the job must be set to pieces
per hour for this setting to work.

Operation seq no must
be scanned/wanded in - If you check this box, you must enter
an operation sequence number by scanning a barcode or wanding in.
If you do not check this box, you have the option of entering operation
numbers (Base ID, Lot ID, Split ID, Sub ID, Operation Sequence) from
the keyboard.

Operator is allowed to
change Resource ID - If you check this box, you can change
the Resource ID for a labor transaction to any other valid VISUAL
Resource ID. While in effect, after VISUAL validates the operation
sequence number, the focus is set to the Resource ID. You can either
accept the default Resource ID or enter a different Resource ID. If
you do not check this box, the focus is always set to the default
for the reported operation.

Ask for Confirmation Before Save - Check
this box to have VISUAL present a confirmation dialog box before saving
a transaction.

Announce Transaction Accepted - Check this
box to have VISUAL present a dialog box to inform of a transaction
success or failure.

Edit Quantity Complete
vs. Standard - Check this box to set the allowable percentage
over the work order quantity.

After you check this box, enter the allowable
percentage over standard in the field that appears.

After you set this option, users are not
allowed to enter any value over the allowable percentage.

Employee ID Must Be Scanned/Wanded
In - Check this box to require an employee ID be scanned/wanded
into the system, as opposed to entering the ID via the keyboard. This
setting is an effective security measure to prevent other employees
from clocking in as (or for) someone else.

3. Click Ok
   to save the preferences.