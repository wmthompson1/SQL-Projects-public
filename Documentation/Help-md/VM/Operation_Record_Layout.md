Operation Record Layout




# Operation Record Layout

Operation records add operations to the previous MASTER
record.

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
| 0 | Record Type Indicator | OPERATION | Y | You must specify OPERATION. |
| 1 | Parent Assembly # | String(3) | N | The level of parent assembly record. The default value is 0, which is also the top level. |
| 2 | Sequence Number | Number String(5) | Y | The sequence number of the operation. |
| 3 | Resource ID | String(15) | Y | The Resource ID of the operation. The resource must exist in your database. |
| 4 | Run | Number String(12.8) | N | The run speed of the operation. The Data Import Utility creates operations with a run default of 0. This is not a required field. The Data Import Utility uses this value along with run type and load size to calculate run time. |
| 5 | Run Type | String(1) | N | Run type code:  H = Hours/Piece. This is the default value.  P = Pieces/Hour  M = Minutes/Piece  N = Pieces/Minute  L = Loads/Hour  D = Hours/Load |
| 6 | Drawing ID | String(30) | N | The Drawing ID of the associated with the operation. |
| 7 | Drawing Rev Number | String(8) | N | The revision number of the drawing. |
| 8 | Setup | Number String(5.3) | N | Setup time. Default is 0. |
| 9 | Load Size Qty | Number String(12.8) | N | The load size quantity of the operation. Default is 0. |
| 10 | Move Hours | Number String(3.3) | N | The move hours of the operation. The default is 0. |
| 11 | Minimum Move Quantity | Number String(12.8) | N | The minimum move quantity of the operation. The default is 0. |
| 12 | Scrap/Yield Type | String(1) | N | The scrap/yield type code of the operation:  S = Scrap  Y = Yield |
| 13 | Scrap/Yield Percentage | Number String(3.2) | N | Percentage of scrap/yield. |
| 14 | Fixed scrap units | Number String(12.8) | N | The fixed scrap units of the operation. |
| 15 | Drawing File | String(100) | N | The full file path to and name of the drawing file. |
| 16 | Transit Days | Number String(3.3) | N | This field applies to services. The amount of time it takes for the material to travel to the service vendor. The default is 0. |
| 17 | Service ID | String(15) | N | The ID of the outside service provided by the vendor. |
| 18 | Run Cost Per Unit | Number String(14.8) | N | This field applies to services. The cost per unit to perform the service. The default is 0. |
| 19 | Service Base Charge | Number String(15.8) | N | This field applies to services. The base amount charged by the vendor. The default is 0. |
| 20 | Service Min Charge | Number String(15.8) | N | This field applies to services. the minimum amount that the vendor charges. The default is 0. |
| 21 | Begin Traceability | String(1) | N | This indicates if traceability begins starting at an operation. Y indicates that traceability takes effect starting at this operation. The default is N. |
| 22 | Start Qty | Number String(12.8) | N | Use this quantity if you want to enable the override quantities feature. See the note in the Qty Complete description. |
| 23 | End Qty | Number String(12.8) | N | Use this quantity if you want to enable the override quantities feature. See the note in the Qty Complete description |
| 24 | Qty Complete | Number String(12.8) | N | The cumulative quantity completed for this operation. The default is 0.    **Note:** If the quantity completed meets or exceeds the end quantity (either specified or calculated) of the operation, this operation is considered complete. Be careful when using the Qty Complete field. |
| 25 | Operation UDF 1 | String(80) | N | The value for User Defined Field 1 |
| 26 | Operation UDF 2 | String(80) | N | The value for User Defined Field 2 |
| 27 | Operation UDF3 | String(80) | N | The value for User Defined Field 3 |
| 28 | Operation UDF 4 | String(80) | N | The value for User Defined Field 4 |
| 29 | Operation UDF 5 | String(80) | N | The value for User Defined Field 5 |
| 30 | Operation UDF 6 | String(80) | N | The value for User Defined Field 6 |
| 31 | Operation UDF 7 | String(80) | N | The value for User Defined Field 7 |
| 32 | Operation UDF 8 | String(80) | N | The value for User Defined Field 8 |
| 33 | Operation UDF 9 | String(80) | N | The value for User Defined Field 9 |
| 34 | Operation UDF 10 | String(80) | N | The value for User Defined Field 10 |
| 35 | Operation UDF Layout ID | String(15) | N | The ID of the UDF Layout |
| 36 | Capacity Usage Max | Number String(5) | N | The maximum capacity usage for the resource in the operation. |
| 37 | Capacity Usage Min | Number String(5) | N | The minimum capacity usage for the resource in the operation. |
| 38 | Setup Cost Per Hr | Number String(14.8) | Y | The per hour cost to set up the resource in the operation. |
| 39 | Run Cost Per Hr | Number String(14.8) | Y | The per hour cost to run the operation. This is not a required field. |
| 40 | Burden Per Hr Setup | Number String(14.8) | Y | The burden per hour applied to setup of the operation. |
| 41 | Burden Per Hr Run | Number String (14.8) | Y | The burden per hour applied to setup of the operation. |
| 42 | Burden Per Unit Run | Number String (14.8) | Y | The burden per unit produced. |
| 43 | Fixed Burden | Number String (15.8) | Y | The fixed burden for the operation. |
| 44 | Burden Percent Setup | Number String (3.3) | Y | The burden rate for setting up the operation. |
| 45 | Burden Percent Run | Number String (3.3) | Y | The burden rate for running up the operation. |
| 46 | Operation Type | String (15) | N | The operation type. |

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Data_Import_Utility.htm) User-defined Help