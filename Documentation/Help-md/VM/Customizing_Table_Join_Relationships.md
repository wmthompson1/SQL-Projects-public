Customizing Table Join Relationships




# Customizing Table Join Relationships

If you use custom tables or views in your database,
you can use the Extra Joins table to define the relationships between
tables.

When you open the Extra Joins dialog, the dialog is populated with
custom joins between standard VISUAL tables. We recommend that you
do not delete or edit these relationships.

To set up custom relationships:

1. Select Options,
   Extra Join Edit.
2. Click Insert.
3. Specify this information:

Parent Table
Specify the table that contains the primary key to which the child
table refers.

Child Table
Specify the table that contains the foreign key reference to the parent
tables primary key.

Relation Name
Specify a name for the relationship.

Child Columns
Specify the names of the columns in the child table that contain
the foreign key reference.

Additional Where
Optionally, specify a WHERE clause to limit the relationship between
the tables. You do not need to enter the WHERE SQL command. You only
need to specify the condition to meet.

4. Click Save.