Using Auto Numbering




# Using Auto Numbering

Many programs in VISUAL have an auto-number feature
that automatically assigns sequential IDs without having to manually
enter them.

You usually set up Auto Numbering once in each module that uses
it, during implementation. However, you may activate the Automatic
Numbering function at any time.

If you are licensed to use multiple sites, you can set up auto-numbering
by site ID. It is highly recommended that you create a unique auto-numbering
scheme for each site. This helps to ensure that transactions within
a site are numbered sequentially.

To ensure that all IDs for a record type use the same auto-numbering
ID format, you should set up auto-numbering schemes before you create
records.

Auto numbers contain these components:

* An integer portion. Each
  new ID is generated in sequential order.
* An alphanumeric prefix affixed
  before the integer.
* An alphanumeric suffix affixed
  after the integer.
* A certain number of digits.

For example, a number of 1001 with a specific appendix of VR and
a suffix of X produces this sequence of Invoice IDs: VR1001X, VR1002X,
VR1003X

To set up autonumbering:

1. Open the application
   where you want to use auto numbering.
2. Select Edit,
   Auto Numbering.
3. If you are licensed
   to use multiple sites, click the Site ID
   arrow and select the site for which you are setting up the auto-numbering
   scheme. If you are licensed to use a single site, this field is
   unavailable.
4. Specify this information:

Next Sequential Number
Specify the number to use the next time you save a record.

Alphanumeric Prefix
Specify a prefix that is attached to the beginning of each sequential
number.

Alphanumeric Suffix
Specify a suffix that is attached to the end of each sequential
number.

Number of Digits
Specify the total number of digits in the numeric portion of the
ID in the Number of Decimal Digits field. If you select the Show Leading
Zeroes check box, this number is used to determine the correct number
of leading zeros.

Show Leading Zeroes
To include leading zeroes in the ID, select this option. When you
select this option, all of your IDs have the number of digits specified
in the Number of Digits field.

5. Click Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Concepts_Common_Features.md) User-defined Help