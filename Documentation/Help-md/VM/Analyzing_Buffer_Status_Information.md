Analyzing Buffer Status Information




# Analyzing Buffer Status Information

When you monitor your buffer statuses on a regular basis, you can
identify which buffers are constantly being over used or under used
and make adjustments.

Generally, you should strive for buffer statuses between 33 and
66 percent. Regular figures under 33 percent indicate that your buffers
are oversized and should be reduced. Regular figures above 66 percent
indicate that your buffers are undersized and should be increased.

If only certain work orders have consumed too much of the buffers,
you can adjust the buffers for those work orders only. Make these
adjustments by using buffer factors. You can specify buffer factors
in DBR Maintenance or in the Manufacturing Window. Use this option
with care. It can be difficult to manage many different work order
factors.

Statuses appear in the following formats:

Red Red numbers indicate that the amount
of remaining buffer has fallen below the level of the Emergency Zone
% you set in the Buffer Management window.

Red buffer statuses indicate that further investigation is warranted.
The last completed process for the work order is displayed in the
Last Piece(s) Sub ID/Seq ID column. Use this operation or piece number
as the starting point for your investigation. Work backward from this
point to analyze where the excess buffer penetration occurred.

Black Black numbers indicate that the
current buffer penetration is below your emergency zone level and
demand exists for the part. Use the Last Piece(s) Sub ID/Seq ID information
to identify where the issues are occurring.