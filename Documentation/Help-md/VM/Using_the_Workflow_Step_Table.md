Using the Workflow Step Table




# Using the Workflow Step Table

In a typical workflow, you create statements for tables
within a VISUAL application (for example, PURCHASE\_ORDER for the Purchase
Order application). However, some workflows require that you create
a statement for the condition of a specific rule or step. To allow
the creation of rule and step statements, Workflow provides non-database
tables, such as Workflow Rule and Workflow Step. These tables allow
you to create statements for status and time conditions. For example,
you can set a time condition for a step that must be completed by
a specific date.

## Creating a Workflow Step Action Statement

A statement containing an Action value affects the
entire workflow. The triggers for the Action value are a delete action
or a save action. For example, VISUAL triggers an Action statement
when a workflow document is saved or deleted.

To create a Workflow Step Action statement:

1. If necessary, open a
   Step Properties dialog box.
2. Click the Insert
   button.
3. In the Table column,
   click the arrow and select Workflow Rule.
4. Click in the Column
   column, click the arrow; then select Action.
5. If the statement requires
   a value in the <Operator> Value or <Comparison> Value
   column, enter one of the following:

Delete The workflow
document must be deleted to trigger the workflow.

Save The workflow
document must be saved to trigger the workflow.

## Creating a Workflow Step Label Statement

A statement containing a Label value affects the previous
step. The trigger for the Label value is the value in the Label field.

To create a Workflow Step Label statement:

1. If necessary open a
   Rule Properties dialog box.
2. Click the Insert
   button.
3. In the Table column,
   click the arrow and select Workflow Step.
4. Click in the Column
   column, click the arrow; then select Label.
5. If the statement requires
   a value in the <Operator> Value or <Comparison> Value
   column, enter the label name of the previous step.

## Creating a Workflow Step Status Statement

A statement containing a Status value affects the
previous step. The trigger for Status is the value in the Status field.
The Status field is read-only and displays "Complete" when
VISUAL has completed the previous step or "InProcess" when
VISUAL has started, but not completed, the previous step.

For example, the following graphic shows the Status field with a
Complete value.

To create a Workflow Step Status statement:

1. If necessary open the
   Properties dialog box for a step.
2. Click the Insert
   button.
3. In the Table column,
   click the arrow and select Workflow Step.
4. Click in the Column
   column, click the arrow; then select Status.
5. If the statement requires
   a value in the <Operator> Value or <Comparison> Value
   column, enter one of the following:

In Process - The
statement requires that the status of the previous step is In Process.

Complete - The
statement requires that the status of the previous step is Complete.

## Creating a Workflow Step Time Started Statement

A statement containing a Time Started value affects
the previous step. To calculate this value, VISUAL Workflow looks
at the Started on box in the previous Step Properties dialog box.
The following graphic shows the Started on field with a time started
value.

To create a Workflow Step Time Started statement:

1. If necessary open a
   Step Properties dialog box.
2. Click the Insert
   button.
3. In the Table column,
   click the arrow; then select Workflow Step.
4. Click in the Column
   column , click the arrow, then select Time
   Started.
5. If the statement requires
   a value in the <Operator> Value or <Comparison> Value
   column, double-click the columns header.

The calendar dialog box appears.

6. In the Offset box, select
   the time for your operator value; then click the OK
   button.

## Creating a Workflow Step Time Complete Statement

A statement containing a Time Complete value affects
the previous step. The trigger for the Time Complete value is the
date in the Date/Time field of the previous step.

For example, the following graphic shows the Date/Time field with
a completed time value.

To create a Workflow Step Time Complete statement:

1. If necessary open a
   Step Properties dialog box.
2. Click the Insert
   button.
3. In the Table column,
   click the arrow and select Workflow Step.
4. Click in the Column
   column, click the arrow; then select Time Complete.
5. If the statement
   requires a value in the <Operator> Value or <Comparison>
   Value column, double-click the columns header.

The calendar dialog box appears.

6. In the Offset box, select
   the time for your operator value; then click the OK
   button.

## Creating a Workflow Step Time Notified Statement

A statement containing a Time Notified value affects
the previous step. To calculate this value, VISUAL looks at the Last
Notified field in the Step Properties dialog box of the previous step.

To create a Workflow Step Time Notified statement:

1. If necessary open a
   Step Properties dialog box.
2. Click the Insert
   button.
3. In the Table column,
   click the arrow and select Workflow Step.
4. Click in the Column
   column, click the arrow and select Time Notified.
5. If the statement requires
   a value in the <Operator> Value or <Comparison> Value
   column, double-click the columns header.

The calendar dialog box appears.

6. In the Offset box, select
   the time for your operator value; then click the OK
   button.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Workflow.htm) User-defined Help

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Working_with_Statements.htm)
Working with Statements