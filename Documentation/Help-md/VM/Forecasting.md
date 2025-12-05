Forecasting




# Forecasting

VISUAL presents each part forecast as an array (or
list) of quantities and dates.

|  |  |  |  |  |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Part | Fcst ID | Jan6 | Jan13 | Jan20 | Jan27 | Feb3 | Feb10 | Feb17 | Feb24 | Mar3 |
| A | 1 | 100 | 112 | 131 | 102 | 102 | 105 | 150 | 180 | 200 |
| A | 2 | 100 | 110 | 120 | 130 | 140 | 150 | 160 | 170 | 180 |
| A | 3 | 150 | 140 | 130 | 100 | 120 | 100 | 150 | 200 | 100 |

VISUAL calculates the dates by applying the PLANNING\_CALENDAR information.
VISUAL supports multiple calendars. You determine the calendar in
use. VISUAL defaults to the first one entered.

VISUAL stores forecast data using a bucketless method in which the
quantity and date are stored explicitly. When the forecast appears
it must be "reoriented." This causes the date-quantities
to be loaded into buckets, a virtual series of numbers. The bucket
that a given date-quantity is loaded into is determined by comparing
the date of the forecast to the date of the bucket (calculated using
the code above).

Forecasting interfaces with Forecast Pro. Since this is an outside
package, information coming from it is subject to rules VISUAL cannot
impose. For example, the origin of the forecast you are importing
may not be the same day of the week, or the period sizes may differ.
It is primarily because of the ability to import (and export) forecasts
that we have devised a bucketless data storage method. Viewing the
data in a grid is preferable to showing it in a list, we have devised
the use of an origin and a constant period size. Anytime the bucketless
data is loaded into the grid view the dates are forced into the bucketed
framework.

## As an extreme case, consider the following array of forecast entries:

|  |  |  |  |
| --- | --- | --- | --- |
| Part ID | Forecast ID | Quantity | Date |
| A | 1 | 100 | 1/1/04 |
| A | 1 | 110 | 1/4/04 |
| A | 1 | 105 | 1/7/04 |
| A | 1 | 97 | 1/10/04 |
| A | 1 | 89 | 1/13/04 |
| A | 1 | 105 | 1/16/04 |
| A | 1 | 115 | 1/19/04 |
| A | 1 | 151 | 1/22/04 |
| A | 1 | 146 | 1/24/04 |

In the above case, the user has imported a forecast that has a period
size of 3 days. If Infor VISUAL is setup to have a planning origin
date of January 1, 2003, period sizes as follows:

|  |  |  |  |  |  |  |  |  |  |  |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
|  |  | 7 | 7 | 30 | 30 | 30 | 30 | 30 | 30 |  |
| Part | fcst ID | Jan6 1997 | Jan13 1997 | Feb12 1997 | Mar14 1997 | Apr13 1997 | May13 1997 | Jun12 1997 | Jul12 1997 | Aug11 1997 |
| A | 1 | 210 | 291 | 517 |  |  |  |  |  |  |

The presentation logic routes the misalignment in the data to the
appropriate buckets. The origin is first extended to the current date
and then subsequent dates are calculated for column headings.

This horizontal presentation allows you to view more information
at one time, and gives you the ability to compare forecasts coming
from more than one forecast ID of the part and forecasts for more
than one part at a time.

As an alternate display technique, VISUAL allows you to show the
grid using the bucketless date information, thereby ignoring the origin
and period size information normally used. The top most entry in the
grid determines the dates used in the headings. If additional forecasts
appear at the same time, they are forced to conform with the date
headings already imposed by the controlling part and forecast (i.e.,
the top line).

The grid above is a standard Centura table window. The first two
columns are fixed and not scrollable. The other columns are scrollable.
The first column visible is a function of the current date. If forecast
information exists prior to the current date, it is loaded and can
be scrolled to if desired. A limit of 12 periods is imposed for data
occurring before the current date. A limit of 256 periods is imposed
for the entire grid. Centura Builder does not impose such limits.
Tests indicate that many more columns can be created dynamically,
so this limit may be increased.

![btn_mini.gif](btn_mini.gif "btn_mini.gif") User
Defined Information