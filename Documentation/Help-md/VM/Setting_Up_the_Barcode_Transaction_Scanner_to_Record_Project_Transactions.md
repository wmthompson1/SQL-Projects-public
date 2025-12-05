Setting Up the Barcode Transaction Scanner to Record Project Transactions




# Setting Up the Barcode Transaction Scanner to Record Project Transactions

If you use the Barcode Transaction Scanner (BTS), you can set up
the VMBTS.INI file to determine which cost category and department
ID you would like to use transactions.

To set up the VMBTS.INI file:

1. Navigate to the directory
   where you store your VISUAL Manufacturing executables and open
   the VMBTS.INI file with a text editor such as WordPad or NotePad.
2. To set up VMBTS for
   work orders, scroll to the # AssumeWODeptANdCostCat section, or
   use your text editors search function to find the section.
3. Enter one of the following
   codes after AssumeWODeptAndCostCat=:

R Enter R if
you would like to use the department ID and cost category from the
shop resource. If the shop resource does not have a department ID
or cost category, then the system will use the department ID and cost
category from the employee. The user cannot change the cost category
or department ID.

E Enter E if
you would like to use the department ID and cost category from the
employee. The user cannot change the cost category or department ID.

P Enter P if
you would like to prompt the user to enter a department ID and cost
category. By default, the system displays the cost category and department
ID for the employee. The user can enter a new cost category or department
ID, or press Enter to accept the defaults.

PR Enter PR
if you would like to prompt the user to enter a department ID and
cost category. The system displays the cost category and department
ID for the shop resource. The user can enter a new cost category or
department ID, or press Enter to accept the defaults.

PE Enter PE
if you would like to prompt the user to enter a departmnet ID and
cost category. The system displays the cost category and department
ID for the employee. The user can enter a new cost category or department
ID, or press Enter to accept the defaults.

N If you enter
N or do not enter any value, then the system will determine which
department ID and cost category to use when the record is processed.
The user will not be prompted to enter a department ID or cost category.

4. To set up VMBTS for
   projects, scroll to the # AssumeProjectDeptAndCostCat section,
   or use your text editors search function to find the section.
   Enter one of the codes described above after AssumeProjectDeptAndCostCat=.
5. Save the VMBTS.INI file
   to commit your changes.