Using Table Windows




# Using Table Windows

Tables are an important user interface component of
VISUAL. Nearly every application uses at least one table, and many
use more than one. Although there may be slight differences depending
upon the exact function, all tables operate in essentially the same
way.

## Table Components

The following terminology is used when referring to tables:

Column - Vertical areas that represent
one type of data for all rows.

Row - Horizontal areas that represent
one record of data in the table.

Column Header - The gray box at the top
of each column that contains the column title.

Row Header - The gray box at the left
of each row. The row header is used to select the row, and contains
special symbols to indicate whether the row is new, being modified,
or has been deleted.

Column Title - The name of the column
appearing in the column header.

Field - The data entry area where a row and column meet. Fields
may be editable or read-only.

Row Cursor - The "Row-Cursor"
is the heavy line that appears around a row any time the cursor is
in that row. This allows you to move between rows using the cursor
keys. When typing data into a field, you can use the up or down cursor
keys to move to a new row, but keep the text cursor in the same column.
Do not confuse this cursor with the selection of the line. When a
line is selected, it is entirely highlighted - usually white text
on a black background.

## Selecting Table Rows

In many cases, you need to select one or more rows from a table
to perform various functions.

## Select rows in the following ways:

Single Select - To select a single row,
click the row header (dark box to the left of the row).

Multiple Contiguous Select - Some applications
allow you to select multiple rows. To select multiple rows that are
in a continuous (unbroken) sequence, place the pointer on the row
header for the first row and hold down the left mouse button. Then,
keeping the button down, drag the cursor down to the row header for
the last row. The table scrolls automatically if the last row is not
currently visible in the window. The first, last, and all rows in
between become selected. Release the mouse button when you are finished.

Multiple Discontiguous Select - In some
instances, you may need to select multiple rows that are not in an
unbroken sequence. To do this, click the row header of the first row,
just as for a single select. Then, click each remaining row header
while holding down the CTRL key. Each row becomes selected individually.

Deselecting one Row - To deselect a row,
hold down the CTRL key and click the row header for the selected row.
It becomes deselected.

You can use all of these actions in sequence. For example, you can
use the multiple contiguous select method to select a large group
of rows, and then the deselect function to remove unwanted rows.

Double-Clicking on a Row - Sometimes there
is only one function you can perform on a row, or one function that
is most common. In many cases, double-clicking on the row performs
the function automatically; this is a very common Windows shortcut.

## Using VISUAL Table Buttons

When there are functions that you can perform on a VISUAL table,
there is usually a set of buttons directly below the table that provide
the functions.

For example, there are often Insert and Delete buttons to add and
remove rows. These buttons are enclosed in a box connected to the
table, to indicate that they work with the table. The buttons are
also in a smaller font than the main window buttons to distinguish
them from those buttons.

Usually these buttons work with the currently selected row or rows.
One exception is Insert, which places a new row at the bottom of the
table.

## Inserting Table Rows

Many applications allow you to insert rows into a table. For example,
you can enter line items into Accounts Receivable invoices, Accounts
Payable checks using tables.

When you can insert a row into a table, there is usually an Insert
button below the table. Clicking on this button adds a new line at
the bottom of the table. In many cases, a shortcut for inserting a
row is to click the gray box at the upper right corner of the table.
A third shortcut is to press the Tab key when on the last column in
the last row of the table.

A right-arrow symbol is displayed in the row header of the new row.
This symbol indicates that this is a new table row that has not been
saved yet. It disappears after you save the table.

You can now enter and modify data in the new row.

## Modifying Table Rows

To modify an existing row of a table, place the cursor in the field
you want to modify and enter or modify data accordingly. A check mark
is displayed in the row header of the modified row. This symbol indicates
that this row has been changed and has not been saved yet. It disappears
after you save the table.

If a field is modifiable, the pointer changes to the "I-beam"
when it is over the field. If it is not, then it changes to an arrow
pointing to the upper right (![RtUpCrsr.gif](RtUpCrsr.gif "RtUpCrsr.gif")).

A few tables are not directly modified in this way. Sometimes, you
must select the row and make the changes in other fields in the window.
An example is the Shipping Addresses dialog box in Customer Maintenance.

## Using the Keyboard with Tables

You can enter and modify data in tables without using the mouse.
To move to the next field in a row, press the Tab key. To move to
the previous field, press Shift-Tab. To move up one row in the same
column, press the cursor up key, to move down press the cursor down
key.

## Deleting Table Rows

To delete one or more rows, select the rows and click the Delete button. In most cases, an X symbol is displayed
in the row header of each deleted row; this indicates that the row
has been marked for deletion, and will be deleted the next time you
save your work. At that point, the row will be removed from the table.
You can unmark a row, to stop it from being deleted, by pressing Delete
again, or double-clicking on the row header.

When a new row is deleted, it is not marked with the X symbol. It
is deleted when you click the Delete button. This is because it has
never been stored in the database and can therefore be removed without
any Save action.

## Scrolling in Tables

If a vertical scroll bar appears to the right of the table, then
there are more rows in the table than can be displayed. Use the scroll
bar to scroll through the entries.

If the Horizontal scroll bar appears below the table, then all of
the columns cannot be displayed. Use the scroll bar to scroll through
the columns. You may be able to resize columns so more can fit on
the screen.

## Moving and Resizing Table Columns

To move a table column, move the pointer to the bottom edge of the
column header for the column, just below the column label. The pointer
changes to a double-arrow icon indicating a column move. Simply hold
down the left mouse button, and drag the column horizontally to the
desired position. The table scrolls automatically, if necessary. Release
the mouse button to move the column.

To change the size of a table column, place the pointer on the separator
between two column headings. The cursor changes to a double-arrow
with a vertical line, indicating movement of the divider between the
columns. Hold down the left mouse button, and drag horizontally. You
are changing the size of the column to the left. Release the mouse
button to finish the operation.

These changes are not permanent unless the table is configurable,
but are still convenient when using a table.

## Sorting Tables

You can sort information in several tables. In the tables, the system
inserts a triangle in the column header. Double-click the triangle
in a column to sort the table by that column. You can double-click
the triangle again to switch between ascending and descending order.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Concepts_Common_Features.htm) User-defined Help