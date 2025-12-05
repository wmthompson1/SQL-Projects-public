Selecting Tokens




# Selecting Tokens

By default, common database columns are included in
the available token list. Use the Edit Token List function to add
tokens. You can add tokens for columns from the database tables that
are primarily associated with a transaction. For example, you can
add tokens for columns from the CUST\_ORDER\_LINE and CUSTOMER\_ORDER
tables to the list of available tokens for the Customer Order template.

You cannot edit the tokens that are available for the Email AR Invoices
template.

To specify available tokens:

1. Select Admin,
   Notification Maintenance.
2. Select Edit,
   Edit Token List.
3. Optionally, apply these
   filters:

Included Notification
Tokens Select the template for which you are selecting tokens.
You can select more than one template.

Included Token Type
Select the section of the email template whose tokens you want to
manage. Email templates are divided into four sections. The sections
where a particular token can be used are predefined.

4. The table lists the
   available tokens based on your filter selections. This information
   is displayed in the table and is read-only:

Program ID The
ID of the program that sends a notification email. This table shows
the program ID and the template used for the email:

|  |  |  |
| --- | --- | --- |
| **Program ID** | **Template** | **Notes** |
| VMORDENT | Customer Order | Customer Order notifications can also be sent from VMORDWIN. |
| VMSHPENT | Shipment |  |
| VFARCENT | Cash Receipt (AR Inv Paid) |  |
| VMPURENT | Purchase Order | Purchase Order notifications can also be sent from VMPURWIN. |
| VMRCVENT | PO Receipt |  |
| VFAPCENT | Cash Disbursement (AP Inv Paid) |  |

Token Type The
section of the email notification where you can add the token. The
sections are Subject Line, Header, Detail Lines, and Footer.

Token Name The
name of the token associated with the database table and column.

Table/Column Name
The database table and column where the data is stored. The information
in the database column replaces the token in your email.

Data Format Type
The type of data that is stored in the table column. These types
are used:

String Shows alphanumeric
values.

Numeric Shows number
values that are not currency values.

Date Shows date
values.

Currency Shows
currency values.

Literal Shows literal
values. Literal values are one-character values that represent information
such as statuses and types, In your email, the information that the
literal value represents is used instead of the literal value. For
example, if you include the %OrderStatus token, and the customer order
has a status of Released, Released is used in the email instead of
R.

Calculated Value
Indicates that the data is calculated and not stored in the database.
For example, customer order totals are calculated values and are not
stored in the database.

Minimum Decimal Pos
Shows the minimum number of digits that is displayed after a decimal
point. For example, a percentage of 10.25 would be displayed as 10.250.
Non-zero digits that occur after the minimum number are always displayed.
For example, a percentage of 10.2501 would be displayed as 10.2501.

5. To make a token available
   for selection in your email template, select the Selected
   Token check box.
6. Click Save.