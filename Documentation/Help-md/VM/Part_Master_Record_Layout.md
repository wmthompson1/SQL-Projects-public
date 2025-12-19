Part Master Record Layout




# Part Master Record Layout

The VISUAL Data Import Utility examines the following
fields and tokens (these begin with value 0) of information in the
text file before it begins the importation process to create a part
master.

This table shows the layout of the file. It shows
the data that is expected in each token, the length and type of the
data, and whether you are required to include the data in your import
file. For NumberString data types, the first value indicates the number
of digits that can be included to the left of the decimal point. The
second value indicates the number of digits that can be included to
the right of the decimal point.

|  |  |  |  |  |
| --- | --- | --- | --- | --- |
| **Token #** | **Name** | **Data type** | **Required** | **Notes** |
| 0 | Record Type Indicator | PART | Y | You must specify PART. |
| 1 | Part ID | String(30) | Y | Part ID |
| 2 | Description | String(40) | N | A description of the part. |
| 3 | Stock UM | String(15) | Y | The unit of measure used for stocking the part. |
| 4 | Fabricated | String(1) | N | Y if the part is fabricated. Default value is N |
| 5 | Purchased | String(1) | N | Y if the part is purchased. Default value is N |
| 6 | Stocked | String(1) | N | Y if the part is stocked. Default value is N |
| 7 | Detail Only | String(1) | N | Y if this is a detail only part. Default value N |
| 8 | Drawing ID | String(15) | N | The Drawing ID of the part. |
| 9 | Drawing Rev Number | String(8) | N | The revision number of the drawing. |
| 10 | Product Code | String(15) | N | The code must exist in the database. |
| 11 | Commodity Code | String(15) | N | The code must exist in the database. |
| 12 | Order Policy | String(1) | N | The order policy of the part. These values are used:  **N** = Not Planned, default  **D** = Discrete  **P** = Period Supply  **F** = Fixed  **E** = EOQ  **M** = Master Scheduled |
| 13 | Primary Warehouse ID | String(15) | N | The warehouse ID must exist in the database. |
| 14 | Primary Location ID | String(15) | N | The location ID must exist in the database. |
| 15 | Drawing File | String(40) | N | Full path to the drawing file, including the file name. |
| 16 | Part UDF 1 | String(80) | N | The value for User Defined Field 1 |
| 17 | Part UDF 2 | String(80) | N | The value for User Defined Field 2 |
| 18 | Part UDF 3 | String(80) | N | The value for User Defined Field 3 |
| 19 | Part UDF 4 | String(80) | N | The value for User Defined Field 4 |
| 20 | Part UDF 5 | String(80) | N | The value for User Defined Field 5 |
| 21 | Part UDF 6 | String(80) | N | The value for User Defined Field 6 |
| 22 | Part UDF 7 | String(80) | N | The value for User Defined Field 7 |
| 23 | Part UDF 8 | String(80) | N | The value for User Defined Field 8 |
| 24 | Part UDF 9 | String(80) | N | The value for User Defined Field 9 |
| 25 | Part UDF 10 | String(80) | N | The value for User Defined Field 10 |
| 26 | UDF Layout ID | String(15) | N | The ID of the user-defined field layout. |

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Data_Import_Utility.md) User-defined Help