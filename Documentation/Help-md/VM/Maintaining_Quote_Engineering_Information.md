Maintaining Quote Engineering Information




# Maintaining Quote Engineering Information

If you have set Cost From for a line item to Engineering
Master or Quote Master, you can view and edit the master using the
Engineering option. Consider the following situations:

## Quoting Inventory Parts Using Engineering Masters

In this case, you probably chose to use the engineering master rather
than the part definition because you wanted to calculate estimated
costs based on quantity. You need to use the engineering master, because
individual operations and material requirements need to be referenced
to separate fixed costs from variable ones, and to take purchased
material price breaks into account.

You can use the Engineering option to view the engineering master,
but you probably do not want to change anything in it. This is the
standard master for an inventory part.

If you are licensed to use multiple sites, engineering masters are
defined at the site level.

## Quoting a New Inventory Part Using Engineering Master

If the quoted part will be a standard inventory part, but has not
yet been or is currently being engineered, use the Engineering option
to create or modify the engineering master.

## Quoting a Custom Part

If the quoted part is being custom made, then use the Engineering
option to build a quote master for the part. A Quote Master is identical
to an Engineering Master, except that it exists in the context of
a quote line item. The purpose of a quote master is to allow engineering
masters to be defined for custom jobs without flooding the part database
with customer Part IDs and engineering masters. You can generate a
work order directly from a quote master.

Specification of the quote master is likely to take place in two
stages: to release the quote, you must specify enough information
in the quote master to accurately estimate costs. If the order is
placed, you can then adjust the quote master to make it suitable for
release as a work order.

Maintenance of a quote master is the most common use of the Engineering
option in the Estimating Window.

## Editing Tools

There are two editing tools available for working with engineering
and quote masters:

Manufacturing Window - This is the editing
application in Infor VISUAL that maintains engineering masters, quote
masters, and work orders. The Estimating Window automatically invokes
this tool and loads the selected master.

Quick Quote - Quick Quote is an alternate
editor for engineering and quote masters. It does not contain the
full functionality of the Manufacturing Window, but does contain enough
to specify at least a skeleton master to produce cost estimates. Quick
Quote has an easy-to-use table based format; because it is smaller
and is not a separate application, Quick Quote uses less memory and
system resources than the Manufacturing Window.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Estimating_Window.htm) User-defined Help

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Using_the_Manufacturing_Window.htm) Using the Manufacturing Window

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMESTWINfrmQuickQuote.htm)
Using Quick Quote