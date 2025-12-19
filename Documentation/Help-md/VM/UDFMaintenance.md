Using Customizable User Defined Fields




# Using Customizable User Defined Fields

## In Reports

Wherever you have set up Customizable User Defined
Fields for a program, you can use those fields in the appropriate
reports.

To use the Customizable UDF fields in reports, modify the report
(QRP) you want to use to accept the appropriate fields.

For Tabs, the input object names for your reports are:

* UDF\_STRING1 through UDF\_STRING10
* UDF\_NUMBER1 through UDF\_NUMBER10
* UDF\_BOOLEAN1 through UDF\_BOOLEAN5
* UDF\_DATE1 through UDF\_DATE5
* UDF\_STR\_COMBO1 through UDF\_STR\_COMBO10
* UDF\_URL1 through UDF\_URL5

For Line Items, the input object names for your reports are:

* UDF\_COL\_STRING1 through
  UDF\_COL\_STRING10
* UDF\_COL\_NUMBER1 through
  UDF\_COL\_NUMBER10
* UDF\_COL\_BOOLEAN1 through
  UDF\_COL\_BOOLEAN5
* UDF\_COL\_DATE1 through UDF\_COL\_DATE5
* UDF\_COL\_STR\_COMBO1 through
  UDF\_COL\_STR\_COMBO10
* UDF\_COL\_URL1 through UDF\_COL\_URL5

For Delivery Line Items, the input object names for your reports
are:

* UDF\_COL\_STRING1 through
  UDF\_COL\_STRING10
* UDF\_COL\_NUMBER1 through
  UDF\_COL\_NUMBER10
* UDF\_COL\_BOOLEAN1 through
  UDF\_COL\_BOOLEAN5
* UDF\_COL\_DATE1 through UDF\_COL\_DATE5
* UDF\_COL\_STR\_COMBO1 through
  UDF\_COL\_STR\_COMBO10
* UDF\_COL\_URL1 through UDF\_COL\_URL5

|  |  |
| --- | --- |
| POSTIT.gif | The names you assign for your Customizable User defined fields do NOT correspond to the names you use for your reports. |

## In Macros

Wherever you have set up Customizable User Defined
Fields for a program, you can use Customizable UDF fields and columns
in the same manner as other fields and columns.

To use customizable UDFs in macros, use the macro editor dialog
in the application and add them the same way as other fields and columns.
 In the Available Fields combo box you will find thirty new field
references:

Fields

* udfString1 through udfString10
* udfNumber1 through udfString10
* udfBool1 through udfBool5
* udfDate1 through udfDate5
* udfStrCombo1 through udfStrCombo10
* udfURL1 through udfURL5

Columns

* udfStringCol1 through udfStringCol10
* udfNumberCol1 through udfStringCol10
* udfBoolCol1 through udfBoolCol5
* udfDateCol1 through udfDateCol5
* udfStrCombo1 through udfStrCombo10
* udfURL1 through udfURL5

## In Browsing by SQL Statement

Wherever you have set up Customizable User Defined Fields for a
program, you can include those Customizable UDF fields in your search
by SQL filter.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Concepts_Common_Features.md) User-defined Help

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](What_are_Macros_.md)
What are Macros?

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Browsing_by_SQL_Statement.md)
Browsing by SQL Statement