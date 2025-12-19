Understanding How VISUAL Backflushes




# Understanding How VISUAL Backflushes

When you receive the part on your work order into
inventory or enter a labor ticket for the last operation on the root
of your work order, VISUAL backflushes the automatic reporting materials
and operations in a specific order.

For an example, click [here](javascript:void(0);).

With Autogen Labor on Receipt, Backflush
Subordinate Legs, and Generate Labor Tickets
During Backflush selected in the Application Global Maintenance
window, when you receive the part described on Sub 0 or enter a labor
ticket for Sub 0 Op 80, VISUAL backflushes in the following order:

1. Sub 0, Op 70.

2. Sub 0, Op 60.

3. Sub 1, Op 60.

4. Sub 1, Op 50.

5. Sub 3, Op 40.

6. Sub 3, Op 30.

7. Sub 4, Op 30.

8. Sub 4, Op 20.

9. Sub 1, Op 40.

10. Sub 1, Op 30.

11. Sub 2, Op 30.

12. Sub 1, Op 20.

13. Sub 0, Op 50.

14. VISUAL stops backflushing because it reaches a non-auto
reporting resource on Sub 0, Op 40.

In order for you take advantage of VISUALs backflushing
for the remainder of the work order, you wouldin no particular orderhave
to enter labor tickets for:

Sub 2, Op 20 - VISUAL backflushes:

1. Sub 2, Op 20.

2. Sub 2, Op 10.

3. VISUAL stops backflushing because VISUAL only backflushes
subordinate legs and not preceding legs. In this example, there are
no subordinate legs to backflush.

Sub 0, Op 40 - VISUAL backflushes:

1. Sub 0, Op 30.

2. Sub 0, Op 20.

3. VISUAL stops backflushing because it reaches a non-auto
reporting resource on Sub 0, Op 10.

Because

Sub 1, Op 10,

Sub 3, Op 10,

Sub 3, Op 20, and

Sub 4, Op 10

have non-auto reporting operations immediately preceding
them, VISUAL will not perform any backflushing when you report labor
against them.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Backflushing_Labor_Tickets.md)
Working with Backflushing

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Labor_Ticket_Entry.md) User-defined Help