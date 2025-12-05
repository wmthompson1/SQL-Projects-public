Using Code Mapping Maintenance




# About the Code Mapping Maintenance Window

If you use BODs to  integrate VISUAL to other
applications, set up code mappings.

BODs employ standard codes, such as ISO codes, for
elements such as currency, language, country, and unit of measure.
To ensure that information flows properly to and from VISUAL, use
Code Mapping Maintenance to associate the codes you use in VISUAL
to the BOD codes.

You can map codes on a one-to-one basis only. For example, if you
use multiple codes for US, such as USA, US of A, and so on, you can
only map one of these codes in Code Mapping Maintenance. An unmapped
code is not sent.

When VISUAL sends information to a BOD, the user-defined codes in
VISUAL are replaced with the codes you mapped to them in Code Mapping
Maintenance. When information is sent into VISUAL via a BOD, the BOD
codes are replaced with their corresponding VISUAL user-defined codes.

Note: Infor recommends restricting access
to Code Mapping Maintenance to ensure that data passes to and from
BODs as expected. You can control access to Code Mapping Maintenance
in Program Security.

## Starting the Code Mapping Maintenance Window

Select Admin, Code
Mapping Maintenance.

## Tasks

This table shows the task that you can complete in the Code Mapping
Maintenance window:

| Task | Description |
| [Using Code Mapping Maintenance](Using_Code_Mapping_Maintenance.htm) | Use this procedure to map VISUAL codes to standard codes. |

## Fields

List
ID

The category of code that you are mapping.

Agency
ID

The ID of the agency that devised the standard codes.

Code
Mapping Table

Use the table to add mappings. The table contains these columns:

VISUAL Code

The VISUAL code that you are mapping to a
standard code.

VISUAL Description

The description of the code.

SOA Code

The SOA code to which you are mapping the
VISUAL Code.

SOA Description

The description of the SOA code.