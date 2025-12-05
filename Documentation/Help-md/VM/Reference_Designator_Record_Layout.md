Reference Designator Record Layout




# Reference Designator Record Layout

Use the Reference Designator record to add reference designators
to a material card. To successfully import reference designator information,
one of these conditions must be true:

* In the import file, the
  lines for the operation and material requirement associated with
  the reference designator precede the line for the reference designator
  information, or
* The operation an material
  requirement already exist in your database.

Note: The number of reference designators
that you import is not validated. For example, if a material requirement
has a quantity of five, then five separate reference designators are
expected. After you import reference designators, open the associated
material requirement card to validate the number. You can save more
or fewer reference designators than expected.

For more information about reference designators, see [Specifying
Reference Designators](Specifying_Reference_Designators.htm).

This table shows the layout of the row in the file. It shows the
data that is expected in each token, the length and type of the data,
and whether you are required to include the data in your import file.

|  |  |  |  |  |
| --- | --- | --- | --- | --- |
| **Token #** | **Name** | **Data Type** | **Required** | **Notes** |
| 0 | Record Type Indicator | REF-DESIG | Y | You must specify REF-DESIG. |
| 1 | Sub ID | String(3) | N | The Sub ID where the material is used. If you leave this field blank, then the ID from the preceding Material row is used. |
| 2 | Operation Seq No | NumberString(2) | N | The operation sequence number where the material is used. If you leave this field blank, then the ID from the preceding Material row is used. |
| 3 | Piece No | NumberString(2) | N | The piece number of the material. If you leave this field blank, then the ID from the preceding Material row is used. |
| 4 | Part ID | String(30) | N | The part ID of the material. This information is not imported into your database. It is used for messages. |
| 5 | Ref Designator ID | String(15) | Y | The ID of the reference designator. |
| 6 | X Coordinate | String(15) | N | The x-coordinate of the designator |
| 7 | Y Coordinate | String(15) | N | The y-coordinate of the designator. |
| 8 | Description | String(30) | N | A description of the designator. |

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Data_Import_Utility.htm) User-defined Help