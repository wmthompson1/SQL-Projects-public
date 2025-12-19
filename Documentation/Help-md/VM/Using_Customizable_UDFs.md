Setting Up Customizable User Defined Fields




# Setting Up Customizable UDFs

Each User Defined Tab can hold six fields. If you
want to create more than six User Defined Fields to be placed on a
Tab, create additional User Defined Tabs by specifying additional
tab names in the Tab field. Refer to step 5, below.

Any user with System Administrator privileges can create and edit
customizable user defined fields.

You can create a total of 40 Customized User Defined Fields per
window.

To set up Customized User Defined Fields:

1. Start the program in
   which you want to set up UDFs.
2. If you are using Part
   Maintenance, Outside Service Maintenance, or Shop Resource Maintenance
   and you are licensed to use multiple sites, specify \*\*Tenant\*\*
   in the Site ID field.
3. Select Customizable
   UDFs from the Maintain or Edit menu.
4. Click one of the following
   buttons:

1. To set up a tab field, click the Insert Tab UDF toolbar button
2. To set up a Line Item UDF, click the
   Insert Line Item UDF toolbar button.
3. To set up a Delivery Schedule UDF, click
   the Insert Delivery Schedule UDF toolbar
   button.

Depending on the window in which you are
creating UDFs, some of the Insert buttons are unavailable.

5. Enter the following
   information. As you enter values in the dialog box header, the
   system inserts information in the table that reflects your choices.

Label Specify
the name of the field.

Tab/Table If
you clicked the Insert Tab UDF button, click the arrow to select the
existing user-defined tab where you want to place the field. If you
want to place the field on a new tab, specify a new tab name in the
Tab field.

If you clicked the Insert Line Item UDF
button or the Delivery Schedule UDF button, the system displays the
name of the table where your UDF will appear in the Table field. You
cannot change the name of a table.

Seq No - Specify
where you want the field to appear. For Tabs, the system displays
fields in ascending order; the field with the lowest sequence number
appears at the top of the tab, followed by the field with the next
lowest sequence number and so on. For Lines and Delivery Schedules,
the system inserts the user-defined columns after the last column
in the table. The field with the lowest sequence number is first,
followed by the field with the next lowest sequence number and so
on.

Data Type - Choose
one of the following data types:

String - Use this
type of data to record alphanumeric data. You can use up to 10 string
type fields per window.

Number - Use this
type of data field to record numeric data. You can use up to 10 number
type fields per window.

Boolean - Use this
type of data field to create a check box that users can select or
clear. You can use up to 5 Boolean type fields per window.

Date/Time - Use this
type of data field to record date and time. You can use up to 5 date
type fields per window.

String List - Use
this type of data field to prompt users to select from a list of alphanumeric
data. You can use up to 10 string list type fields per window.

Uniform Resource Locater
Use this type of data field if you want users to enter a URL. You
can use up to 5 URL type fields per window.

Required - If
you want VISUAL to require users to enter data into the field, select
the Required check box. VISUAL will not save the record unless users
enter data in all required fields.

6. If you selected String
   List in the Data Type field, the system activates the Database
   and List check boxes. Use these check boxes to define the type
   of list you want to use.

You can create three types of lists: database,
static, and dynamic. In a database list, the system populates the
drop-down list with values from a database table and column that you
specify. In a static list, users select from options you define. In
a dynamic list, the system populates the drop-down list with values
that have previously been entered for the field.

Database - Select
this check box if you want to create a database list. When you select
the Database check box, the system activates the Set Column button.
Click the Set Column button to choose the
database table and column you would like to use to populate the string
list. In the Set Database Column dialog box, specify the following
information:

Table - Click the
Table arrow to select the VISUAL database table that contains the
column you would like to use.

Column - Click the
Column arrow to select the column you would like to use.

After you specify a Table and Column, click
Ok to exit the Set Database Column dialog
box.

List - Select
this check box if you want to create a static list. When you select
the List check box, the system activates the Set List button. Click
the Set List button to define the choices
that will be available for users to select. In the Set Static String
List dialog box, click the Insert button
to enter an alphanumeric value. Insert as many values as you need.
When you are finished inserting values, click the Save
button.

Clear both the Database and List check boxes
if you want the system to create a dynamic list. The system compiles
the list from values previously entered in the field. Users can enter
any value in a dynamic list field; they do not have to select from
the list.

7. If you specified the
   Uniform Resource Locater data type, enter the prefix you would
   like to use in the URL Protocol field. The system attaches the
   prefix you specify to the URL the user specifies. For example,
   if you would like users to enter a website, enter http:// in the
   URL Protocol field. If a user enters www.infor.com in your user
   defined field, the system will add the http:// prefix automatically.
8. When you have finished
   setting up your Customizable UDFs, click Save.

The system displays the customizable UDFs
when you have closed the User Defined Field Maintenance [program name]
dialog box.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Concepts_Common_Features.md) User-defined Help