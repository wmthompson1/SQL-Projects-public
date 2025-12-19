Creating and Editing Exceptions




# Creating and Editing Exceptions

If you are licensed to use multiple sites, you can
create exceptions at the tenant level only.

To create exceptions:

1. Open the Manufacturing
   Window Exceptions window by selecting Exceptions
   from the Edit menu.

The Manufacturing Window Exceptions window
opens with any exceptions you have previously entered.

2. Click the New
   toolbar icon.

The New/Edit Manufacturing Window Exceptions
window opens.

3. Enter an identifying
   name for this exception in the Name field.
4. Click the Object
   Type arrow and select the type of exception you are creating.

You can select:

3. Material
4. Operation
5. Service
6. Leg
7. W/O Header

|  |  |
| --- | --- |
| POSTIT.gif | The appropriate data items for the type you selected appears. A data input field appears allowing you to enter specific information against which you can base the exception. |

5. Enter a description
   for this exception in the Description field.
6. If you want to set a
   priority for this exception, enter it in the Priority field.

Set priorities only if you want VISUAL to
process exceptions in a specific order.

7. Select the Data Item
   you want to use for the exception.

Some Data Items have predefined functions
associated with them. For example, if you select a date data item,
CurrentDate appears in the Functions list. You can select CurrentDate
to compare the selected data item to the current date.

8. Select the operator
   you want to use for this exception.

There are four types of operators from which
you can select:

* Comparison

>
Greater than

<
Less than

>=
Greater than or equal to

<+
Less than or equal to

=
Equal to

!=
Not equal to

* Arithmetic

+
Plus

-
Minus

* Boolean

And

Or

Not

* Grouping

(
- Open bracket

) - Close
bracket

9. If you have selected
   a Data Item that has a Predefined Function, select the Function
   you want to use from the Function list.
10. When you have finished
    creating your Exception, click the Save
    toolbar button.

|  |  |
| --- | --- |
| POSTIT.gif | If you want to clear your exception, click the Clear Expr button at the bottom of the New/Edit Manufacturing Window Exception window. |

## Editing Exceptions

To edit your exception rules, open the New/Edit Manufacturing Window
Exception window, select the Exception you want to edit, and click
the Edit Row toolbar icon.

## Using Default Exception

Infor has included some default exceptions to the exceptions window
that you can modify to meet your specific needs. To use these Exceptions,
click the Import Default Exceptions toolbar
button.

## Deactivating Exceptions

You can deactivate exceptions without deleting them by clearing
the Active check box.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Work_Order_Operation_Input.md) User-defined Help

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMMFGWINfrmMfgWinExceptions.md)
Working with Exceptions