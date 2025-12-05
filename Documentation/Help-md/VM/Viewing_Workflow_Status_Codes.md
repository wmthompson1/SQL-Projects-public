Viewing Workflow Status Codes




# Viewing Workflow Status Codes

The Workflow Status Codes window displays a list of
VISUAL database tables, status column names, and status values. This
window also displays the actual text that appears in VISUAL status
fields. For example, the Status field in Purchase Order Entry displays
values such as Firmed, Released,
and Hold. The corresponding status values
in the Purchase Order database table are F,
R, and H.

Use the Workflow Status Codes window as a reference when creating
VISUAL Workflow statements that require condition comparisons on status
columns.

## Opening the Workflow Status Codes Window

To open the Workflow Status Codes window:

1. On the Admin menu of
   VISUALs main window, select Application Global
   Maintenance.

The Application Global Maintenance window
appears.

2. On the Maintain menu,
   click Workflow Status Codes.

The Workflow Status Codes window appears.

The following information appears in the
Workflow Status Codes Window:

Language - Click
the arrow to view a list all supported languages in the system.

Status Text -
The actual text that appears in the status field of a particular VISUAL
application. For example, when the value "C" appears in
the STATUS column of the PURCHASE ORDER table, the status field in
Purchase Order Entry displays "Closed." You can edit status
text for any language except USA.

Status Value -
The actual value that appears in the status column of the VISUAL database
table. You cannot edit this field.

Table Name - The
name of the VISUAL database table.

Column Name -
The name of the status column in the corresponding VISUAL database
table.

## Changing Status Text Language

You can edit definitions in the Status Text column
to support other languages, however, you cannot edit definitions for
the USA language code.

To change the status text language:

1. In the Status Text column,
   change the text from English to another supported language.
2. Click the Copy
   to Language ID button.

The Copy Status Codes dialog box appears.

3. In the Copy to Language
   ID list, select the ID of the language that you want to copy the
   status definition.
4. Click the Ok
   button.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Workflow.htm) User-defined Help