Using the Workflow Rule Table




# Using the Workflow Rule Table

In a typical workflow, you create statements for tables
within a VISUAL application (for example, PURCHASE\_ORDER for the Purchase
Order application). However, some workflows require that you create
a statement for the condition of a specific rule or step. To allow
the creation of rule and step statements, Workflow provides non-database
tables, such as Workflow Rule and Workflow Step. These tables allow
you to create statements for status and time conditions. For example,
you can set a time condition for a step that must be completed by
a specific date.

## Creating a Workflow Rule Label Statement

A statement containing a Label value affects the current
rule. The trigger for the Label value is the name of the current rule
in the Label field.

To create a Workflow Rule Label statement:

1. If necessary open a
   Rule Properties dialog box.
2. Click the Insert
   button.
3. In the Table column,
   click the arrow and select Workflow Rule.
4. Click in the Column
   column, click the arrow; then select Label.
5. If the statement requires
   a value in the <Operator> Value or <Comparison> Value
   column, enter the label name of the current rule.

## Creating a Workflow Rule Status Statement

A statement containing a Status value affects the
current rule. The trigger for Status is the value in the Status field.
The Status field is read-only and displays "Complete" when
VISUAL has completed the current rule or "InProcess" when
VISUAL has started, but not completed, the current rule.

To create a Workflow Rule Status statement:

1. If necessary open a
   Rule Properties dialog box.
2. Click the Insert
   button.
3. In the Table column,
   click the arrow and select Workflow Rule.
4. Click in the Column
   column, click the arrow; then select Status.
5. If the statement requires
   a value in the <Operator> Value or <Comparison> Value
   column, type one of the following values:

InProcess - The
statement requires that the status of the current rule is in process.
The InProcess value is case and space sensitive.

Complete - The
statement requires that the status of the current rule is complete.
The Complete value is case sensitive.

## Creating a Workflow Rule Time Complete Statement

A statement containing a Time Complete value affects
the current rule. The trigger for the Time Complete value is the date
in the Date/Time field of the current rule.

To create a Workflow Rule Time Complete statement:

1. If necessary open a
   Rule Properties dialog box.
2. Click the Insert
   button.
3. In the Table column,
   click the arrow and select Workflow Rule.
4. Click in the Column
   column, click the arrow and select Time Complete.
5. If the statement requires
   a value in the <Operator> Value or <Comparison> Value
   column, double-click the columns header.

The calendar dialog box appears.

6. In the Offset box, select
   the time for your operator value; then click the OK
   button.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Working_with_Statements.htm)
Working with Statements