Using Auto Numbering Purchase Order Entry




# Using Auto Numbering Purchase Order Entry

Using Auto Numbering to generate the Our Order IDs
can significantly reduce keystrokes and confusion. Although it is
not required, it is highly recommended that you use this feature.

You usually set up Auto Numbering once in each module that uses
it, during implementation. However, you may activate the Automatic
Numbering function at any time.

## Auto numbers contain the following parts:

* An integer portion that
  is incremented to produce a new number for each new order
* An alphanumeric prefix that
  will be prefixed to the number
* An alphanumeric suffix that
  will be appended to the number

For example, a number of 1001 with a specific appendix of PO and
a suffix of X produces this sequence of Order IDs: PO1001X, PO1002X,
PO1003X ...

1. Select Auto
   Numbering from the Edit menu.

The Setup Automatic Numbering dialog box
appears.

2. Fill in the next sequential
   number that you want used for the numeric portion of Our Order
   ID. This number may be up to 7 digits long.
3. Assign any alphanumeric
   prefix or suffix. These are case sensitive; you should use capitals
   for all letters.
4. Enter the total number
   of digits in the numeric portion of the ID in the Number of Decimal
   Digits field.

VISUAL uses this number to generate the
proper number of leading zeros, if you select that option.

5. If you want leading
   zeros to be included in a number, check the Show Leading Zeroes
   check box.

This keeps all IDs the same number of characters
in length.

6. Click the Save
   button to save the changes, or Cancel to close the dialog box
   without saving the changes.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Purchase_Order_Entry.md) User-defined Help