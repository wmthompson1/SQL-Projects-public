Material Record Layout




# Material Record Layout

The material record identifies the material requirements for an
operation.

This table shows the layout of the file. It shows the data that
is expected in each token, the length and type of the data, and whether
you are required to include the data in your import file. For NumberString
data types, the first value indicates the number of digits that can
be included to the left of the decimal point. The second value indicates
the number of digits that can be included to the right of the decimal
point.

| **Token #** | **Name** | **Data type** | **Required** | **Notes** |
| 0 | Record Type Indicator | MATERIAL | Y | You must specify MATERIAL. |
| 1 | Parent Assembly # (Sub ID) | String(3) | Y | The level of parent assembly. The default value is 0, which is also the top-level. |
| 2 | Sequence Number | NumberString(5) | Y | The sequence number of the operations that require this material. |
| 3 | Piece Number | NumberString(5) | N | The piece number of the material. The default is the next piece number, which the Data Import Utility increments by 10. |
| 4 | Part ID | String(30) | N | The Part ID of the material. This must be a valid Part ID. |
| 5 | Quantity Per | NumberString(12.8) | N | The quantity of material required for each part produced by operations. If you do not specify a value, a default value of 1 is used. |
| 6 | Quantity Per Type | String(1) | N | The quantity per type code. Because of scrap and yield, the start quantity may be different than the end quantity. This field indicates to use start quantity or end quantity when calculating quantity per.  S (Start Qty), also the default  E (End Qty) |
| 7 | Usage UM | String(15) | N | The unit of measure of the material. This must be a valid unit of measure. |
| 8 | Drawing ID | String(15) | N | The Drawing ID of the associated with the operation. |
| 9 | Drawing Rev Number | String(8) | N | The revision number of the drawing. |
| 10 | Unit Material Cost | NumberString(14.8) | N | The unit cost of this material. The Data Import Utility uses the part cost from the existing part table, unless you specify a different value. If you specify a value, it overrides the default. |
| 11 | Length | NumberString(10.4) | N | Only applies if the material is piece tracked and requires length. |
| 12 | Width | NumberString(10.4) | N | Only applies if the material is piece tracked and requires width. |
| 13 | Height | NumberString(10.4) | N | Only applies if the material is piece tracked and requires height. |
| 14 | Dimension UM | String(15) | N | The unit of measure of the material. This only applies to piece tracked parts and must be a valid unit of measure. |
| 15 | Drawing File | String(100) | N | The full file path to and name of the drawing file. |
| 16 | Scrap Percent | NumberString(3.2) | N | The scrap percent of the material. The Data Import Utility creates material records with a default scrap percent value of 0. |
| 17 | Fixed Quantity | NumberString(12.8) | N | The fixed quantity of the material. The Data Import Utility creates material records with a default fixed quantity value of 0. |
| 18 | Dimensions | String(80) | N | This dimension formula must equal a valid numeric expression. This is not applicable for piece tracked parts. |
| 19 | Reference # | String(10) | N | The reference number to an item number on a drawing. |
| 20 | Issued Quantity # | NumberString(12.8) | N | The quantity of the requirement that has been issued to date. If the quantity issued meets or exceeds the material requirement, this material requirement is considered complete. |
| 21 | Material UDF 1 | String(80) | N | The value for User Defined Field 1 |
| 22 | Material UDF 2 | String(80) | N | The value for User Defined Field 2 |
| 23 | Material UDF 3 | String(80) | N | The value for User Defined Field 3 |
| 24 | Material UDF 4 | String(80) | N | The value for User Defined Field 4 |
| 25 | Material UDF 5 | String(80) | N | The value for User Defined Field 5 |
| 26 | Material UDF 6 | String(80) | N | The value for User Defined Field 6 |
| 27 | Material UDF 7 | String(80) | N | The value for User Defined Field 7 |
| 28 | Material UDF 8 | String(80) | N | The value for User Defined Field 8 |
| 29 | Material UDF 9 | String(80) | N | The value for User Defined Field 9 |
| 30 | Material UDF 10 | String(80) | N | The value for User Defined Field 10 |
| 31 | Material UDF Layout ID | String(15) | N | The ID of the UDF Layout |
| 32 | Material Vendor ID | String(15) | N | The ID of the vendor who sells the part. |
| 33 | Material Vendor Part ID | String(30) | N | The ID that the vendor uses for the part. |
| 34 | Material Mfg Name | String(30) | N | The name of the manufacturer or the part. |
| 35 | Material Mfg Part ID | String(30) | N | The ID that the manufacturer uses for the part. |
| 36 | Material Unit Labor Cost | NumberString(14.8) | N | The cost of labor per unit. |
| 37 | Material Unit Burden Cost | NumberString(14.8) | N | The burden per unit. |
| 38 | Material Unit Service Cost | NumberString(14.8) | N | The service cost per unit. |
| 39 | Material Fixed Cost | NumberString(15.8) | N | The fixed cost per unit. |
| 40 | Material Burden Per Unit | NumberString(9.6) | N | The material burden cost per unit. |
| 41 | Material Burden Percent | NumberString(3.2) | N | The percentage charged for burden. |
| 42 | Material Warehouse ID | String(15) | N | The warehouse where the material requirement is stored. |
| 43 | Material Location ID | String(15) | N | The location in the warehouse where the material requirement is stored. |