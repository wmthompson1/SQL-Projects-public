Recalculating Overtime




# Recalculating Overtime

You can account for overtime in Labor Ticket Entry
by using the Multiplier override field for tickets known to require
overtime pay. You can do this if you enter tickets for an employee
sequentially, and if you monitor the Session Total.

VISUAL can also automatically calculate overtime by examining all
tickets for a given employee and setting multipliers based on accumulated
hours.

1. Select Recalc
   Overtime from the Edit menu.

The Recalculate Overtime dialog box appears.

2. Enter the last date
   of the week for which you want to recalculate overtime.

The default is the Sunday of the previous
week. You can also use the < and > buttons to the right of the date field to
decrease and advance the date by one day, and the <<
and >> buttons to decrease and advance
the date by a week.

3. Enter multiplier and
   over values for Premium 1.

Premium 1 calculates overtime on anything
OVER a specified number of hours per week. VISUAL uses the multiplier
you enter here to perform the overtime calculation. The default multiplier
is 1.5 for time over 40 hours.

4. Enter a multiplier for
   Premium 2 and select the appropriate days of the week.

Use Premium 2 to indicate that hours reported
on certain days of the week are multiplied by a constant multiplier
to arrive at the overtime value.

5. Click Ok
   to recalculate the overtime.

VISUAL processes all time tickets for the
specific week and determines new overtime multipliers. Jobs worked
at the end of the week receive the overtime. If a time ticket crosses
the overtime hour limit, it is broken into two tickets so that overtime
only applies to the time over the specified limit.

VISUAL recalculates overtime in the following way:

1. For each employee, VISUAL
   considers all direct labor tickets for the specified week. Additionally,
   it also considers indirect tickets with an indirect code of Miscellaneous.
2. VISUAL calculates overtime
   based on tickets with the value of the multiplier. Therefore,
   all tickets with a value of greater than 1 are reset to 1. If
   a ticket has a multiplier of less than 1, it is prorated. Recalculation
   of overtime is done by multiplying hours worked by the multiplier,
   and resetting the elapsed time accordingly.

Evaluation of this type of labor ticket
in overtime calculations is questionable, because the elapsed time
does not represent real clock time. These tickets keep a multiplier
of 1, regardless of whether they fall in overtime or not.

3. VISUAL totals the hours
   for all tickets. If one ticket overlaps the overtime boundary,
   VISUAL splits it into two tickets, with clock in and clock out
   time adjusted accordingly. Quantities completed and deviated are
   prorated between the tickets.
4. VISUAL applies Premium
   1 to all tickets over the Over hours you specify. If the day matches
   one of the weekdays specified for Premium 2, VISUAL uses Premium
   2 instead.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Labor_Ticket_Entry.md) User-defined Help