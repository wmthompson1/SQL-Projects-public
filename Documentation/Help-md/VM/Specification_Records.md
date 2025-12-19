Specification Records




# Specification Records

You can add specifications to MASTER, PART, OPERATION,
MATERIAL, and ASSEMBLY records. VDIU uses any records that it finds
after the BEGIN-SPEC and before the END-SPEC as the specification
to the previous Master, Part, Operation, Material, or Assembly record.
BEGIN-SPEC and END-SPEC must be separate records; the text that comprises
the actual specifications must be also be a separate records. Therefore,
the minimum number of records that VDIU needs to create a record is
3 - one for the BEGIN-SPEC, one for the END-SPEC, and at least one
for the actual specification.

|  |  |
| --- | --- |
| POSTIT.gif | If you do not specify a specification for a MATERIAL or ASSEMBLY record but do specify a valid Part ID for that MATERIAL or ASSEMBLY record, VDIU copies the specification from part Maintenance to the material requirement or leg specifications. |

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Data_Import_Utility.md) User-defined Help