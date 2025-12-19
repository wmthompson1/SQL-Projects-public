What are Costing Tools




# What are Costing Tools

Detail transactions provide the basis from which summary
data is formed and occurs for all transactions and balances within
VISUAL. Cost Accounting is a very crucial area for manufacturing concerns.
Companies need to know manufacturing data is reflected in the VISUAL
accounting system. There are times when this data can get out of sequence
due to system failures. In order to keep the integrity of cost data,
VISUAL now provides a utility window (the first of its kind) to correct
instances where summary records are not supported by detail transactions.

With the VISUAL Costing Tools you now have the ability to visually
compare detail transaction records with their corresponding summary
records. You also have the ability to correct them immediately or
set them to correct the next time you run costing utilities. After
you run Costing Utilities VISUAL records any necessary entries or
fixes, to properly reflect the manufacturing accounting data in the
financial system.

The Costing Tools option is located on the Admin menu. The program
option is secured by read/write access as well as program component
security. To access program security SYSADM access is required.

## Data Inconsistencies

In todays computing environment, sophisticated applications (like
VISUAL) must include tools available to users (through the guidance
of technical support) to assist in the maintenance and upkeep of database
information. Typically these tools allow for the detection and correction
(if appropriate) of data inconsistencies.

In a business environment this definition can be specifically applied
to transactions (transaction inconsistencies) or it can be applied
in a general sense to expected results in the data (data inconsistencies).

Therefore, when discussing inconsistencies in VISUAL we cover the
spectrum of data inconsistencies to transaction inconsistencies. Data
inconsistencies result when transaction values are expected to be
picked up in one period but are actually calculated into another.
Transaction inconsistencies occur where accumulated transaction sub-totals
do not support the summation of detail transaction entries.

Typically, transaction inconsistencies occur as a result of a system
crash during an update stage. In VISUAL, when a transaction is entered
into the system it usually causes another record to be to updated
or added to the system. VISUAL stores "summary" records,
dependent on detail transaction records. If a system crash occurs
during a summary record update, database inconsistencies are quite
likely to occur as well. VISUAL Costing Tools can check for these
inconsistencies and make appropriate modifications.

To understand data inconsistencies, and how transactions expected
in one period can show up in another, you must first understand how
VISUAL Costing accumulates and processes information. Typically, Costing
Utilities assign transactions to the period in which the transaction
date falls, as established in application global. This, however, is
not consistent when transactions dated with a prior month transaction
date (intended for the prior month) are picked up in the costing run
for the current month. This may occur when the costing utilities feature
is executed for the current month without having been run for the
prior month. If a situation occurs where costs are posted to one period
when they were expected to be closed to a different period, costing
tools can be used to affect the proper change in accounting. Technical
support can assist in this matter.

## Security Access

The Costing Tool window is secured under normal program security.
In addition, the options available (reports and tools) within the
Costing Window are further secured by component security. This allows
specific program access to be assigned to the appropriate individuals
within your organization.

When you first upgrade your database to version 5.2, access to the
Costing Tool option is denied, even to users with SYSADM security
privileges. However, SYSADM users can set the appropriate security
for the Costing Tool features on a user-by-user basis.

To access program security you must have SYSADM security clearance.
Within the program security area, a new program ID, VMAPLTLS, provides
Yes, Read Only, and No security access settings. Furthermore, programs
listed under the "Components" column are assigned an initial
setting of YES. A YES setting indicates that component level security
is in effect. By clicking on the pgm security
button, located at the bottom of the window, access to the Costing
Tools option can be denied, on a user-by-user basis.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_Defined_Help_Files_Project_Costing_Tools.md) User-defined Help