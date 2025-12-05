Demand Fences and Demand Periods




# Demand Fences and Demand Periods

A demand fence is the time period boundary before
a specified calculation applies to the determination of demand. A
demand period is a time duration, bounded by the fence, during which
the calculation method applies.

There are two demand fences that effect how VISUAL calculates gross
demand. VISUAL considers only real demand up to the first demand fence.
Real Demand is the combination of customer order demand (independent
demand) and work order requirement demand (dependent demand).

Between the first and second demand fences, VISUAL uses the greater
of real demand and forecast demand as the gross demand. After the
second fence,VISUAL uses only forecast demand as gross demand. VISUAL
searches for demand fences in the following order: by Part, by Product
Code and by system (Application Global).

Real demand period Begins on the current
date and ends at the first demand fence. During this period the forecast
is ignored and only dependent and independent demand, for example,
real, are shown as demand. This demand is displayed in green in the
AMP.

Mixed demand period Begins immediately
following the first demand fence at ends at the second demand fence.
During this period, demand is defined as the greater of the forecast
or the dependent and independent demand. This demand is displayed
in blue in the AMP.

Forecast demand period Begins immediately
following the second demand fence and ends with the forecast or master
schedule. This demand is displayed in black in the AMP.

This means that you specify two data items to make up these fences.

Demand fence 1 - The user-specified number
of days in the real demand period.

Demand fence 2 - The user-specified number
of days in the mixed demand period.

![btn_mini.gif](btn_mini.gif "btn_mini.gif") Advanced
Material Planning User Defined Information