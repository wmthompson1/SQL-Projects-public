Specifying Filters




# Specifying Filters

You can provide filters that users can apply to a metric when they
add it to their dashboards. For example, you can allow users to filter
metrics by date, by a range of IDs, or by a list of predefined values.

The types of filters that can be applied to column depend upon the
data type.

To add filters to the metric:

1. Select File,
   Dashboard.
2. Select Edit,
   Edit Data Source.
3. In the Data Source ID
   field, select the data source.
4. In the Filter Type field,
   specify the filter to use. This table shows the filter types that
   are available for each data type:

   | Data type | Filter type |
   | --- | --- |
   | Number | Value  The user can filter the metric to include data for one specific value.  Value (<=)  The user can filter the metric to include data for a specific value and all values less than the specified value.  Value (>=)  The user can filter the metric to include data for a specific value and all values greater than the specified value.  Value (<=,>=)  The user can filter the metric to include data for a specific range of values. The values that the user specifies are included. |
   | String | Browse  The user can filter the metric to include data for a specific value. If you specify this filter type, a field with a browse button is available for the user to select a single value.  Browse Range  The user can filter the metric to include data for a range of values. If you specify this filter type, two fields with browse buttons are available for the user to select a range of values.  Drop List  The user can select a single value on which to filter from a list. If you specify this filter type, a drop-down field is available to the user.  List  The user can select multiple values on which to filter from a list. If you specify this filter type, a multi-select field is available to the user.  Range  The user can filter the metric to include data for a range of values. If you specify this filter type, two fields are available for the user to select the range of values. Browse buttons are not provided.  Value  The user can filter the metric to include data for a specific value. If you specify this filter type, a field is available for the user to specify the value. A browse button is not provided. |
   | Date Time | Range  The user can filter the metric to include data for a range of dates. If you specify this filter type, two fields are available for the user to specify the start and end dates. Browse buttons are not provided.  If you use more than one Date Time column in your data source, then you can apply the Range filter type to only one of the Date Time columns. |
5. If you selected Drop
   List or List as the filter type, specify how to build the filter
   list. This table shows the source types, a description of the
   filter source type, and the filter text to specify:

   | Filter Source Type | Description | Filter Text |
   | --- | --- | --- |
   | Configuration | Select this option to specify the browse dialog to use. The browse configuration determines the dialog that is opened when the user clicks the browse button for the filter. | Click the Edit Filter Text button to select the browse dialog to use. The configuration that you select should match the data in the database column. For example, if you specified CUSTOMER\_ID as the Column Name, then select Customer as the filter text. |
   | Enum Codes | Select this option to use common status codes, such as work order status and customer order line status. These codes are read from the ENUM\_CODES database table. When the user adds the metric, the translated value of each code is displayed. For example, if you add customer status codes, the user sees Closed, Firmed, Hold, Released, and Cancelled instead of C, F, H, R and X. | To select the codes to use as the filter:  1.Click the Edit Filter Text button.  2.In the Table field, select the table that contains the codes to use. For example, if you are providing filters for customer credit status, select Customer.  3.In the Column field, select the code type.  4.Click Ok. |
   | Enum List | Select this option to manually create a list of translated values for the user. You can use this option to limit the choice of codes found in the ENUM\_CODES database. For example, use the Enum List option to limit a customer order status filter to only Released and Firmed. You can also use this option if you included a particular ID in your data source but not the description. For example, if carrier IDs are in your data source but not carrier descriptions, you could this option to present the descriptions instead of the IDs. | Specify valid selections in pairs. The User Value is the text that is displayed to the end user. The Data Value is the code used in the system. For example, to allow users to select Firmed as a filter for customer orders, specify Firmed as the User Value and F as the Data Value.  1.Click the Edit Filter Text button.  2.Click Insert.  3.In the User Value column, specify the text to display to the end user.  4.In the Data Value, specify the code that is used in the system.  5.Click Ok. |
   | List | Select this option to create a list of options for the user. The option that the user selects is the value used in the SQL query. | Specify valid selections separated by commas. Do not use spaces before or after the commas. |
   | Query | Select this option to create a list based on a SQL query. The query you specify must be for a single column. This option is useful if you want to present users with a list of distinct values instead of all values from a particular database column. For example, you could specify this statement:  select distinct rel\_type from v\_task  If you used this query, users could select from a list of Related To types. Related To types are used with Activities. | Specify a query that references one table. |
   | Table | Select this option to create a list of all values in a database column. | To select the database column to use as the filter:  1. Click the Edit    Filter Text button. 2. In the Table    field, select the table that contains the database    column. 3. In the Column    field, select the column. 4. Click Ok. |
   | Viewable Sites | Apply this filter source type to a data source column for Site ID. Select this option to present a list of the users viewable sites. | n/a |
   | Viewable Warehouses | Apply this filter source type to a data source column for warehouse ID. Select this option to present a list of the users viewable warehouses. | n/a |

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Custom_Metrics.md)
Custom Metrics

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Creating_Data_Sources.md)
Creating Data Sources

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_File_Menu.md) User-defined Help