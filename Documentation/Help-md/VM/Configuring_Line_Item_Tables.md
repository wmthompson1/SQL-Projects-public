Configuring Line Item Tables




# Configuring Line Item Tables

Some Infor VISUAL Financials applications have line
item tables that are user configurable. This allows you to specify
which columns to show or hide, column ordering, sizing, and naming.
The following application has this type of table:

 General Journal Entry

The window has a Configure Line Item /Table selection in the Options
menu.

## Moving Columns

To move a table column, move the pointer to the bottom
edge of the column header for the column, just below the column label.
The pointer changes to a double-arrow icon indicating a column move.
Simply hold down the left mouse button, and drag the column horizontally
to the desired position. The table automatically scrolls, if necessary.
Release the mouse button to move the column.

## Resizing Columns

To change the size of a table column, place the pointer
on the separator between two column headings. The cursor changes to
a double-arrow with a vertical line, indicating movement of the divider
between the columns. Hold down the left mouse button, and drag horizontally,
changing the size of the column to the left. Release the mouse button
to finish the operation.

## Showing/Hiding and Renaming Columns

To show or hide columns, or rename them, select Configure Line Item Table from the Options menu.

The Configure Table Window dialog box appears.

The table contains a line for each column that can be shown in the
table. The Column Name shown is the internal VISUAL column name and
begins with the letters col. The name is usually close to the columns
function and/or title.

The Include column controls the visibility of the columns. The Title
column shows the text that appears in the columns header.

|  |  |
| --- | --- |
| POSTIT.gif | You cannot hide required fields or make unavailable fields appear.  For example, because the CLIN information is required for A&D users, you cannot hide the CLIN column and if you are not using VAT functionality, you cannot show VAT columns. |

To modify column titles, modify the text in the Title field for
the column. You can use the @ sign in titles to indicate a line break,
so you can specify a title to appear on multiple lines.

Click Ok to complete the operation. Note
that this also saves the current columns sizes and positions.

Be careful not to hide any columns that are required by the program.
If this happens, VISUAL gives you the normal error message that a
field needs an entry when you try to use the application.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Concepts_Common_Features.md) User-defined Help