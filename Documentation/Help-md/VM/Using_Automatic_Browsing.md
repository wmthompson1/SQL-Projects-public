Using Automatic Browsing




# Using Automatic Browsing

When you use auto browse, the field on the main form
can be used as a browse filter. Use automatic browsing when you want
to find an item in the table, but you only know a few characters of
the item name. With Auto Browse enabled, enter the characters you
know in the appropriate field, then press the TAB key to move the
cursor out of the field. The database is searched using the characters
you entered, and the results are listed in a Browse table window.
All items that match the characters you entered are shown. If only
one matching item is found, the current window is completed with the
information for that item.

For example, if you are searching for part RJ45 in Part Maintenance
but you are unsure of the full part ID, you can enter R in the Part
ID field, then press the TAB key to return a Browse table window with
all Part IDs beginning with R.

You can use two wildcards with automatic browsing. For example,
if you wanted to find all customer IDs that had B as the second letter,
specify \_B in the Customer ID field. If you wanted to find all customer
IDs that have the letter B in the ID, specify %B in the Customer ID
field. If you specify a wildcard at the end of your search term, the
wildcard is ignored.

When you activate automatic browsing for a browse dialog, the feature
is enabled only for that browse in the current application. For example,
if you are using Part Maintenance and activate automatic browsing
for the Part ID browse, automatic browsing is only activated for the
Part ID browse in Part Maintenance. It is not activated for the Part
ID browse in Customer Order Entry.

To activate automatic browsing:

1. For the field where
   you want to use automatic browsing, click the browse button.
2. Select Options,
   Auto Browse Enabled.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Concepts_Common_Features.htm) User-defined Help