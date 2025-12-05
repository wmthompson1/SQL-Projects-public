What Is Code Mapping Maintenance




# What Is Code Mapping Maintenance?

Map codes in Code Mapping Maintenance if you use BODs to import
information to or export information from VISUAL.

BODs employ standard codes, such as ISO codes, for elements such
as currency, language, country, and unit of measure. To ensure that
information flows properly from VISUAL, use Code Mapping Maintenance
to associate the codes you use in VISUAL to the BOD codes.

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