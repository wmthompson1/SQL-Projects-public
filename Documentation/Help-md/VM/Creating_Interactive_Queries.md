Creating Interactive Queries




# Creating Interactive Queries

You can display a dialog that prompts your query users
to specify the bind variables for a WHERE clause. You can require
users to specify an exact value or allow users to specify wildcards
in their variables.

To require an exact value, use this syntax:

WHERE TABLE.COLUMN =:Field label in dialog

To allow users to specify wildcards, use this syntax:

WHERE TABLE.COLUMN like :Field label in dialog

For example, if you specified WHERE CUSTOMER\_ORDER.ID like: My
Customer Order ID, a dialog is displayed when the user runs the query.
The dialog would contain one field named My Customer Order ID. The
user could specify wildcards in the dialog.

You can include multiple columns in the WHERE clause and prompt
the user to specify a value for each column. When the query is run,
columns with null values are not included in the results. Consult
a SQL guide for information about how null values are handled in SQL
queries.

You can also use a single quotation mark instead of the double quotation
mark.