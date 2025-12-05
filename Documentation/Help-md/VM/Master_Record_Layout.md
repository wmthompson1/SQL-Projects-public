Master Record Layout




# Master Record Layout

This is the header record for a bill of material.
The VISUAL Data Import Utility examines the lines and tokens (these
begin with value 0) of information in the text file before it begins
the importation process to create the work order, engineering master,
or quote master.

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
| 0 | Record Type Indicator | MASTER | Y | You must specify MASTER. |
| 1 | Type | String(1) | Y | The type of data that you are importing. Specify one of these values:  **M** ( Engineering Master)  **W** (Work Order)  **Q** (Quote Master) |
| 2 | Base ID | String(30) | N | The Base ID of the master you are importing.  For type **M**, you do not have to supply an ID.  For type **W**, you must specify a Work Order ID or leave this field blank for the next seq#.  For Type **Q**, you must specify a Quote ID or leave this field blank for the next seq#. |
| 3 | Lot ID | String(3) | N | The Lot ID of the master you are importing.  For type **M**, specify an Engineering ID. The default is the next Engineering ID.  For type **W**, specify a Lot ID. The default value is 1.  For type **Q**, specify a Lot ID. The default value is 1. |
| 4 | Part ID | String(30) | N | The Part ID for the Master. This must be a valid Part ID or the next import record must be a part record that adds this part. |
| 5 | Desired Qty | NumberString(12.8) | N | If you do not specify a value, then 1 is used. |
| 6 | Drawing ID | String(30) | N | The ID of the drawing of the part. |
| 7 | Drawing Rev Number | String(8) | N | The revision level of the drawing. |
| 8 | Product Code | String(15) | N | If specified, the code must exist in the database. |
| 9 | Commodity Code | String(15) | N | If specified, the code must exist in the database. |
| 10 | Engineered By | String(40) | N | The individual who configured the product. |
| 11 | Engineered Date | String(10) | N | The day, month, and year of engineering. This defaults to the current date if you do not enter a date. Use MM/DD/YYYY format. |
| 12 | Desired Want Date | String(10) | N | The date that production on the master should be complete. Use MM/DD/YYYY format. |
| 13 | Desired Release Date | String(10) | N | The date that you plan to release the master to production. Use MM/DD/YYYY format. |
| 14 | Status | String(1) | N | Specify one of these values:  U (Unreleased)  F (Firmed), also the default  R (Released)  The user must have permission to set the status code. If the user does not have permission to set a status of Firmed, the Data Import Utility creates the master with a Unreleased status. The Data Import Utility generates an error message or log entry when a user with insufficient privileges has tried unsuccessfully to change a master status. |
| 15 | Drawing File | String(100) | N | The full path name to the Drawing File and name of the Drawing File. |
| 16 | Forward Schedule | String(1) | N | Specify Y or N. The default is N. |
| 17 | Copy Routing | String(1) | N | Specify Y or N. This setting is used when importing work orders or quotes. If you specify Y, then the operations from the parts engineering master are copied. If you specify Y, you must specify a part ID in field 4.  This function is designed to be used primarily with the APS Import Utility, and as such only copies the operation (not material requirement) for the main assembly - Sub ID 0. |
| 18 | Copy Materials | String(1) | N | Specify Y or N. This setting is used when importing work orders or quotes. If you specify Y, then the materials from the parts engineering master are copied. If you specify Y, you must specify a part ID in field 4. |
| 19 | Master UDF 1 | String(80) | N | The value for User Defined Field 1 |
| 20 | Master UDF 2 | String(80) | N | The value for User Defined Field 2 |
| 21 | Master UDF 3 | String(80) | N | The value for User Defined Field 3 |
| 22 | Master UDF 4 | String(80) | N | The value for User Defined Field 4 |
| 23 | Master UDF 5 | String(80) | N | The value for User Defined Field 5 |
| 24 | Master UDF 6 | String(80) | N | The value for User Defined Field 6 |
| 25 | Master UDF 7 | String(80) | N | The value for User Defined Field 7 |
| 26 | Master UDF 8 | String(80) | N | The value for User Defined Field 8 |
| 27 | Master UDF 9 | String(80) | N | The value for User Defined Field 9 |
| 28 | Master UDF 10 | String(80) | N | The value for User Defined Field 10 |
| 29 | Master UDF Layout ID | String(15) | N | The ID of the user-defined field layout. |
| 30 | Split ID | String(3) | N | If the work order has been split, the ID of the split. |
| 31 | Warehouse ID | String(15) | N | The warehouse where the manufactured product is stored. |

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Data_Import_Utility.htm) User-defined Help