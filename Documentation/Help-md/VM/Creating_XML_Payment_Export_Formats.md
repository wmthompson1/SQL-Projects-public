Creating XML Payment Export Formats




# Creating XML Payment Export Formats

You can create an AP export file format in XML. Use the Payment/XML
format to export payments to Single Euro Payment Area (SEPA)-compliant
file transfer systems. You can create an export format to use with
release version 4.0 for SEPA Credit Transfers. For more information,
refer to <http://www.europeanpaymentscouncil.eu/index.cfm>.

You can also use XML file format to create a custom export file
format.

You should have an understanding of XML before setting up export
file formats.

To create a simple XML payment export format:

1. Select Admin,
   Application Global Maintenance.
2. Select Maintain,
   Export Formats.
3. Click the Type
   arrow and select Payment/XML.
4. Specify an Export ID.
5. Click the Insert
   button
6. Specify this information:

Seq No Specify
a sequence number for the line. The sequence number indicates the
order of the lines in the XML document. The line with the lowest number
is inserted in the document first. You can specify a negative number.

Indent Level
Specify an indent number for the line. Indent numbers identify how
the lines are grouped together.

Element Specify
the name of the element. The element is the tag name. You do not have
to specify the starting tag or ending tag.

Value Specify
the value to use for the element. Click the arrow to select from common
database fields. You can also enter your own value.

Is An Attribute?
If the line in an attribute to the element, select the Is An Attribute
check box. If you designate an attribute, you should sequence the
line so that it is immediately after the element with which it is
associated. You should specify the same indent level.

7. Repeat steps 5 and 6
   to insert additional lines.
8. Click Save.

For example, say you entered the following lines:

| Seq | Indent | Tag | Tag Value | Is an Attribute? |
| 1 | 0 | Payment |  | n |
| 2 | 1 | Code | SEPA | n |
| 3 | 2 | Amount | AMOUNT (selected from drop-down menu) | n |
| 4 | 2 | Currency ID | CURRENCY\_ID (selected from drop-down menu) | y |

The system would generate the following XML:

<Payment>

<Code>SEPA</Code>

<Amount CurrencyID=USD>1234.00</Amount>

The system would extract the USD and 1234.00 values from the database.

## Building Payment/XML Formats with the Context Menu

You can build more complex Payment/XML formats using built-in macros
and the Context menu. The Context menu automatically inserts standard
elements into the XML file. You can use each context once in each
Export ID. The macros and contexts indicate how the files are linked
together.

1. Specify an Export ID
   in the Export ID field.
2. Build the File Header.
   Click the Context arrow and select File
   Header.

The system inserts the doctype and root
elements. The system inserts the standard xml version identification
information in the Value field associated with the doctype element.
Enter a value for the root element. The root element is the first
tag in the XML file.

3. Click the Insert
   button and specify any other elements you would like to use in
   the file header.

At the point where you would like to include
the Header context information, click the Insert button and specify
%HEADER% in the Element column. This indicates that the system will
look for the Header context information. If you create additional
lines after the %HEADER% line, the system will insert those lines
after it inserts the entire Header.

4. Click Save.
5. Build the Header context
   information. Specify the same Export ID as you entered in step
   1, then click the Context arrow and
   select Header.
6. Click the Insert button
   and specify the elements and attributes you want to use for the
   document header.
7. At the point where you
   would like to include the Line Item context information, click
   the Insert button and specify %LINEITEM%
   in the Element column. This indicates that the system will look
   for the Line Item information. If you create additional lines
   after the %LINEITEM% line, the system will insert those lines
   after it inserts the entire Line Item context information.
8. Click Save.
9. Build the Line Item
   context information. Specify the same Export ID as you entered
   in Step 1, then click the Context arrow
   and select Line Item.
10. Click the Insert
    button and specify the elements and attributes you want to use
    for the line items.
11. Click Save.

The system links together the information you built for the File
Header, Header, and Line Item contexts.

## Complex Expressions

You can combine simple calls for data from the database with expressions
that convert the data to a different format or prompt the system to
choose between two values. You can use the following expressions:

@FORMATNUMBER Use this expression to
change the format of a number. You can specify the number of decimal
places and the separator characters you use. To use the expression,
specify the number you would like to convert, then specify the format.
For example:

@FORMATNUMBER (1235,99, #,##0") would convert 1235,99 to 1,235.

@FORMATDATE Use this expression to change
the format of a date. To use the expression, specify the date you
would like to convert, then specify the format. For example:

@FORMATDATE (2010-07-14, mm/dd/yyyy") would convert 2010-07-14
to 07/14/2010.

@UTCDATE Use this expression to change
the format of a date into universal time coordinate (UTC) format.
To use the expression, specify the date you would like to convert,
specify if you would like to show the time, and specify if you would
like to show the offset. To specify whether or not to show the time
or offset, use True to show the time or offset and False to not show
the time or offset. For example,

@UTCDATE (2010-07-14, TRUE, FALSE) would convert 2010-07-14 to 2010-07-14T16.25.54.18z.
If you specified @UTCDATE (2010-07-14, TRUE, TRUE), the date would
convert to 2010-07-14T16:25:54.18Z-04:00.

@ROUND Use this expression to round
a fractional number to a specific number of decimal places. To use
this expression, specify the number you would like to round followed
by the precision and scale.  Precision is the number of digits
in the number; scale is the number of digits after the decimal point.
For example:

@ROUND (6543.1267, 6, 2) will convert 6543.1267 to 6543.13. If you
specified @ROUND (6543.1267, 5, 2), 6543.1267 would be converted to
6543.1 Since the number is limited to 5 digits in the definition,
the system would only include one digit after the decimal point.

@LOOKUP Use this expression to retrieve
a cross-referenced value from the database. To use the expression,
specify the key, table, keyfield, and datafield. For example,

@LOOKUP (CURRENCY\_ID, CURRENCY, ID, ISO\_CODE) would retrieve
the ISO code for the currency ID.

@SQL Use this expression to execute
a simple select SQL statement against the database. For example:

@SQL (SELECT COMPANY\_NAME FROM APPLICATION\_GLOBAL) would retrieve
the company\_name data from the application\_global table.

@IF Use this expression to ask the system
to return one of two values based on the result of a test you specify.
To use this expression, specify a test (for example, 1<2), the
value the system returns if the test is true, and the value the system
returns if the test is false. For example,

@IF (1>2, 1 is greater than 2, 1 is not greater than 2,)
 would return 1 is not greater than 2. The system would evaluate
the test, 1>2, determine that the test is false (1 is less than
2), and return the value you specified for a false test, 1 is not
greater than 2.

## Concatenation

You can join simple expressions or a string values and a simple
expressions together using a concatenation operator. The concatenation
operator is a double pipe: ||. For example:

VEND\_BANK\_CITY || , || VEND\_BANK\_STATE || VEND\_BANK\_ZIPCODE would
produce the vendor banks city, state and zip code in the following
format: Boston, MA 02123. In this example, the comma is a string value
and the references to database columns are simple expressions.

## Other Functions

You may find the following useful in your export file formats:

SalDateCurrent() Use this function to
return the current date and time. You can use this function in conjunction
with a complex expression to specify a format for the data. For example:

@UTCDATE ( SalDateCurrent(), TRUE, FALSE) would return the current
date expressed in UTC format without offset. For example, 2010-07-14T14:58:27.68Z.

SalStrLeftX( string, length) Use this
function to return a portion of the string value you specify. For
example:

SalStrLeftX (DESCRIPTION, 40) would return the first 40 characters
in the DESCRIPTION database column.

SalStrTrimX (string) Use this function
to remove all blanks from the string value. For example:

SalStrTrimX (COMPANY\_NAME) would return MajesticManufacturingCompany
instead of Majestic Manufacturing Company.

SalStrScan (string 1, string2) Use this
function to find the value you specify for string2 in string1. For
example:

SalStrScan (VENDOR\_NAME, Steel) would return vendor names that
included the word steel .

SalNumberAbs (number) Use this function
to return the absolute number.

## Using the SQL Dialog Box

After you specify your export file format, click the SQL
button. The system constructs a SQL statement that you can use to
add the export file format to your database. Copy the SQL statement
from the dialog box and paste it into a database management tool.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Application_Global_Maintenance.htm) User-defined Help