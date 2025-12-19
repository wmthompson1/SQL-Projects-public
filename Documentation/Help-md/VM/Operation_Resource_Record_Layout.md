Operation Resource Record Layout




# Operation Resource Record Layout

Operation resource records add concurrent resource
to an operation. If used, these records must follow the OPERATION
record for which the concurrent resources are required.

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
| 0 | Record Type Indicator | OPER\_RES | Y | You must specify OPER\_RES. |
| 1 | Resource ID | String(15) | Y | The Resource ID of the operation. This must be a valid Resource ID. |
| 2 | Type | String(1) | N | The type of operation resource.  **B** - Specifies that concurrent resources apply to both setup and run. This the default value.  **S** - Specifies that concurrent resources apply only to setups.  **R** - Specifies that concurrent resources apply only to runs. |
| 3 | Percent Duration | String(3) | N | The percent of the operation that the resource is concurrent. The default value is 100 |
| 4 | Justification | String(1) | N | Where the overlap between operations begins:  **S** - The concurrent resource applies overlaps the start of the operation. This is the default.  **E** - The concurrent resource overlaps the end of the operation. |
| 5 | Schedule Type | Number(2) | N | Specify 0 for continuous scheduling. Specify 1 for discontinuous scheduling. |
| 6 | Minimum Segment Size | Number String(12.2) | N | If the schedule is discontinuous, the minimum run duration on one resource unit before a second unit can be scheduled. |

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Data_Import_Utility.md) User-defined Help