Working with Statements




# Working with Statements

Statements are conditions on which you want actions
to occur. They can range from simple one-line statements to more complex
multi-line statements.

To set up statements:

1. Click the Insert
   button:

A arrow appears in the Table.

2. In the Table column,
   click the arrow and select the data table you want to use for
   this statement.

The Table column lists all the data tables
associated with the VISUAL application for which you are creating
a workflow. It also contains two "non-standard tables" named
Workflow Rule and Workflow Step that allow you to create statements
for the condition of a rule or step.

3. Click in the Column
   column, click the arrow; then select the column you want to use
   for this statement.

The Column column lists all the columns
associated with the table you select in the Table column. If you select
Workflow Rule the list displays Label, Status, and Time Complete.
If you select Workflow Step, the list displays Action, Label, Status,
Time Started, Time Complete, and Time Notified. For more information,
refer to [Using the Workflow
Step Table](Using_the_Workflow_Step_Table.htm) and [Using
the Workflow Rule Table](Using_the_Workflow_Rule_Table.htm).

4. If your statement requires
   an operator, click in the Operator column, click the arrow; then
   select an operator value. You can select one of the following:

+ - Add (Column
value + Operator value)

- Subtract (Column
value - Operator value)

\* - Multiply (Column
value \* Operator value)

/ - Divide (Column
value / Operator value)

5. If your statement requires
   an operator value, enter a value in the <Operator> value
   column header or double-click the column header and select a value.
6. Click in the Comparison
   column, click the arrow; then select the comparison function you
   want to use for this statement. You can select one of the following:

< - Less than
(Column value + Operator value < Comparison value)

> - Greater
than (Column value + Operator value > Comparison value)

= - Equal to (Column
value + Operator value = Comparison value)

>= - Greater
than or equal to (Column value + Operator value >= Comparison value)

<= - Less than
or equal to (Column value + Operator value <= Comparison value)

!= - Not equal
to (Column value + Operator value !=  Comparison value)

in - In (Column
value + Operator value in  Comparison
value)

not in Not in
(Column value + Operator value not in Comparison value)

like - Like (Column
value + Operator value like  Comparison
value)

not like Not
like (Column value + Operator value not like Comparison value)

between - Between
two values (Column value + Operator value between Comparison
value)

not between
Not between (Column value + Operator value not between comparison
values)

7. Click in the Value column
   and enter the specific value you want to use for this statement.
   When creating statements that require status values, double-click
   the column header to view a browse list of acceptable values.

   |  |  |
   | --- | --- |
   | IMPORTNT.gif | You can view a list of status values for all VISUAL tables from VISUALs Application Global Maintenance window. On the Application Global Maintenance windows Maintain menu, click Workflow Status Codes. For more information on Workflow Status codes, refer to [Viewing Workflow Status Codes](Viewing_Workflow_Status_Codes.htm). |

8. If you want to combine
   two statements or compare more than one value, click in the Logical
   column and select one of the following:

Or - If you want
one or more conditions or other conditions to exist before statement
can be true, select the Or option. For example,
if you have a two line statement the first line OR the second line
can be true for the whole statement to be true.

And - If you want
multiple conditions to exist before the statement can be true, select
the And option. For example, if you have
a two line statement, both lines must be true before the whole statement
can be true.

And any - If you
want the first line and ANY of the subsequent lines to exist before
the statement can be true, select the And Any
option.

Or any - If you
want the first line OR any of the subsequent lines to exist before
the statement can be true, select the Or Any
option.

Next Line Use
the Next Line option if you want to consider one database column in
relation to a second database column to determine the records you
want to select. For example, if you want to create a statement that
selects parts with a unit price (part.unit\_price) that is greater
than or equal to 20% more than the wholesale unit cost (part.whsale\_unit\_cost),
you would enter the following two lines:

| Table | Column | Operator | Operator Value | Comparison | Comparison Value | Logical |
| +Part | unit\_price |  |  | >= |  | Next Line |
| +Part | whsale\_unit\_price | \* | 1.2 |  |  |  |

You can combine more than one Next Line
statement. For example, if you wanted to create a statement that selects
parts with a unit price greater than or equal to 20% of the wholesale
unit cost but less than or equal to 50% of the wholesale unit cost,
you would enter the following two lines:

| Table | Column | Operator | Operator Value | Comparison | Comparison Value | Logical |
| +Part | unit\_price |  |  | >= |  | Next Line |
| +Part | whsale\_unit\_price | \* | 1.2 |  |  | And |
| +Part | unit\_price |  |  | <= |  | Next Line |
| +Part | whlsale\_unit\_price |  | 1.5 |  |  |  |

You can also create Next Line statements
that search for information across two different database tables.
For example, if you wanted to search for all part IDs that have been
used in customer order lines, you would enter the following:

| Table | Column | Operator | Operator Value | Comparison | Comparison Value | Logical |
| +Part | ID |  |  | in | "" | Next Line |
| +Cust\_order\_line | Part\_id | \* |  |  |  | And |

9. When you have finished
   setting up your Step or Rule, click the Ok
   button.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Workflow.htm) User-defined Help