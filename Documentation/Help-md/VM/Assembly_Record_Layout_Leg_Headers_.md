Assembly Record Layout (Leg Headers)




# Assembly Record Layout (Leg Headers)

Assembly records add Sub-IDs (leg-headers) to the
previous MASTER record. The OPERATION that requires the Sub-ID MUST be listed prior to the ASSEMBLY record.

This table shows the layout of the file. It shows
the data that is expected in each token, the length and type of the
data, and whether you are required to include the data in your import
file. For NumberString data types, the first value indicates the number
of digits that can be included to the left of the decimal point. The
second value indicates the number of digits that can be included to
the right of the decimal point.

| **Token #** | **Name** | **Data type** | **Required** | **Notes** |
| 0 | Record Type Indicator | ASSEMBLY | Y | You must specify ASSEMBLY. |
| 1 | Parent Assembly | String(3) | Y | The level of parent assembly. This is the Sub ID of the parent record. The default value is 0, which is also the top-level. |
| 2 | Operation Number | NumberString(5) | N | The operation sequence number of the parent operation. |
| 3 | Piece Number | NumberString(5) | N | The piece number of the material. This must be a valid Part ID. The default is the next piece number for the part assembly number. |
| 4 | Part ID | String(30) | N | The Part ID of the material. |
| 5 | Quantity Per | NumberString(12.8) | N | The quantity of material required for each part produced by operations. If you do not specify a value, a value of 1 is used. |
| 6 | Quantity Per Type | String(1) | N | The quantity per type code. Because of scrap and yield, the start quantity may be different than the end quantity. This field indicates to use start quantity or end quantity when calculating quantity per.  **S** (Start Qty), also the default  **E** (End Qty) |
| 7 | Usage UM | String(15) | N | The unit of measure of the material. This must be a valid unit of measure. |
| 8 | Drawing ID | String(30) | N | The Drawing ID of the assembly. |
| 9 | Drawing Rev Number | String(8) | N | The revision number of the drawing. |
| 10 | Unit Material Cost | NumberString(15.8) | N | The unit cost of this material. The Data Import Utility uses the part cost from the existing part table, unless you specify a different value. If you specify a value, it overrides the default. |
| 11 | Drawing File | String(100) | N | The full file path to and name of the drawing file. |
| 12 | Sub ID | String(3) | N | The sequential number of this assembly. Specify the Sub-ID for this leg-header here. The Data Import Utility automatically increments to the next Sub ID. |
| 12 | Length | NumberString(10.4) | N | Only applies if the material is piece tracked and requires length. |
| 13 | Width | NumberString(10.4) | N | Only applies if the material is piece tracked and requires width. |
| 14 | Height | NumberString(10.4) | N | Only applies if the material is piece tracked and requires height. |
| 15 | Dimension UM | String(15) | N | The unit of measure of the material. This only applies to piece tracked parts and must be a valid unit of measure. |
| 16 | Scrap Percent | NumberString(3.2) | N | The scrap percent of the material. The Data Import Utility creates material records with a default scrap percent value of 0. |
| 17 | Fixed Quantity | NumberString(12.8) | N | The fixed quantity of the material. The Data Import Utility creates material records with a default fixed quantity value of 0. |
| 18 | Dimensions | String(80) | N | This dimension formula must equal a valid numeric expression. This is not applicable for piece tracked parts. |
| 19 | Reference # | String(10) | N | The reference number to an item number on a drawing. |
| 20 | Issued Quantity # | NumberString(12.8) | N | The quantity of the requirement that has been issued to date. If the quantity issued meets or exceeds the material requirement, this material requirement is considered complete. |
| 21 | Assembly UDF 1 | String(80) | N | The value for User Defined Field 1. |
| 22 | Assembly UDF 2 | String(80) | N | The value for User Defined Field 2. |
| 23 | Assembly UDF 3 | String(80) | N | The value for User Defined Field 3. |
| 24 | Assembly UDF 4 | String(80) | N | The value for User Defined Field 4. |
| 25 | Assembly UDF 5 | String(80) | N | The value for User Defined Field 5. |
| 26 | Assembly UDF 6 | String(80) | N | The value for User Defined Field 6. |
| 27 | Assembly UDF 7 | String(80) | N | The value for User Defined Field 7. |
| 28 | Assembly UDF 8 | String(80) | N | The value for User Defined Field 8. |
| 29 | Assembly UDF 9 | String(80) | N | The value for User Defined Field 9. |
| 30 | Assembly UDF 10 | String(80) | N | The value for User Defined Field 10. |
| 31 | Assembly UDF Layout ID | String(15) | N | The ID of the UDF Layout. |

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Data_Import_Utility.md) User-defined Help