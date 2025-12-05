Defining Shifts




# Defining Shifts

Before you can assign shifts to employees, you must
first define the Shift IDs. Shift IDs define the break, lunch, and
grace periods for a given shift.

You can break down Shift schedules by activities that occur during
the shift. These activities include allowed clock-in and clock-out
grace periods, between-job lag times, and break times.

To define shifts:

1. Select Edit,
   Shift Definition.
2. Specify this information:

Shift ID - Specify
an identifier for this shift.

Description -
Specify a description for the shift.

3. In the Allowed Clock
   In/Out Grace Periods section, specify the grace periods to use
   with the shift. Specify this information:

Minutes before start
of shift - Specify the grace period before the start of the
shift. If employees clock in during the grace period, their clock
in time is adjusted to the start time of the shift.

If the start of the shift is 7:00 AM and
the grace period is 5 minutes, employees clocking in between 6:55
and 7:00 will have a clock in time of 7:00. If they clock in at 6:54
or earlier, the actual clock in time is used.

Minutes after start of
shift - Specify the grace period after the start of the shift.
If employees clock in during the grace period, their clock in time
is adjusted to the start time of the shift.

If the start of the shift is 7:00 AM and
the grace period is 5 minutes, employees clocking in between 7:00
and 7:05 will have a clock in time of 7:00. If they clock in at 7:06
or later, the actual clock in time is used.

Minutes before end of
shift - Specify the grace period before the end of the shift.
If employees clock out during the grace period, their clock out time
is adjusted to the end time of the shift.

If the end of the shift is 4:00 p.m. and
the grace period is 5 minutes, employees clocking out between 3:55
and 4:00 will have a clock out time of 4:00. If they clock out at
4:54 or earlier, then the actual clock out time is used.

Minutes after end of
shift - Specify the grace period after the end of the shift.
If employees clock out during the grace period, their clock out time
is adjusted to the end time of the shift.

If the end of the shift is 4:00 p.m. and
the grace period is 5 minutes, employees clocking out between 4:00
and 4:05 will have a clock out time of 4:00. If they clock out at
4:06 or later, then the actual clock out time is used.

Between Job Lag Time
- Specify the amount of time allowed between jobs. If employees
exceed the amount of lag time between jobs, the time is charged to
an indirect ID.

For example, presume you specify 5 in this
field. If an employee clocks out of the first job at 2:00, then clocks
into the next job at 2:04, then no lag time is charged to an indirect
ID. The four minutes are posted to the second job. If the employee
clocks in to the next job at 2:06, then six minutes are charged to
an indirect ID.

Minutes Before/After
Breaks - Specify the grace period before and after breaks.
If employees clock in during the grace period before a break, their
time is adjusted to the start of the break. If employees clock out
during the grace period after a break, their time is adjusted to the
end of the break.

4. In the Break/Meal Indirect
   ID field, specify the indirect labor ID to use when a break or
   lunch period is deducted from time posted to the job.
5. Click the Save
   button.
6. To define the duration
   of the shift, break times, and meal times, click Edit
   Shift Codes.... The ID of the shift is inserted in the
   Shift ID field.
7. Specify this information:

Day Click the
arrow and select the day of the week for which you are defining the
shift times. If every day has the same shift schedule, select Every
Day.

If each day has a different schedule, you
must define the shift for each day. You can also use Mon thru Fri
to define the shifts for Monday through Friday, and Sat, Sun to define
the code for the weekend.

Description
Specify a description of the shift schedule.

Shift Use the
Start and End fields to specify the duration of the shift.

Meal and Breaks fields
Use the Start and End fields to specify when the break starts and
when the break ends. If employees are paid during the break, select
the Paid check box. If employees are not
paid during the break, clear the Paid check
box. If employees must manually clock in and out for the break, select
the Manual Clock In/Out check box. If employees
are clocked in and out of breaks automatically, clear the Manual
Clock In/Out check box.

Paid breaks Charged to
Indirect To charge paid breaks to an indirect ID, select
the Paid Breaks Charged to Indirect check box. Specify the indirect
ID in the Shift Definition dialog box.

Periods Per Hour
The system inserts 60. You cannot change this value. The system
rounds clock in and clock out times to the nearest minute.

8. Click Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Employee_Maintenance.htm) User-defined Help