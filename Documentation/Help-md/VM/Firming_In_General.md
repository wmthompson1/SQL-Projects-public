Firming In General




# Firming In General

As each order is processed from either the single
part presentation or the multi-part presentation (these are really
the same display with minor runtime differences), VISUAL saves the
result. Generation of orders is time-consuming and resource consuming,
therefore, VISUAL commits as often as possible and still maintain
database consistency.

The window that performs this action is a form window, not a dialog
box. This permits you to minimize the window and allow it to perform
its work in the background. There is an abort button to halt the execution
at the boundary of a given order being processed. Progress is shown
to the user by highlighting the individual rows being worked on.

Otherwise, the logic used to generate orders from planned orders
is the same logic used by Planning Window now.

![btn_mini.gif](btn_mini.gif "btn_mini.gif") User Defined Information