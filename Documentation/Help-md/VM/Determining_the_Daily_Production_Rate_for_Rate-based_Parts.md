Determining the Daily Production Rate for Rate-based Parts




# Determining the Daily Production Rate for Rate-based Parts

To determine the daily production rate for a rate-based
part, this calculation is used:

hourly run rate of last operation on work
order \* hours resource runs each shift \* number of shifts

For example, if the last operation on the work order for the rate
based part has a run rate of two pieces an hour, each shift is eight
hours long, and you run the resource for two shifts, this calculation
is made:

2 \* 8 \* 2 = 32

If the total quantity produced on the work order is not a multiple
of the daily rate, then the work order is backwards prorated from
the finish date. For example, if the daily run rate is 32 and the
total quantity produced on the work order is 100, then a quantity
of four would be available for planning purposes on the first day
of production, followed by a quantity of 32 for the next three days.