Using the Search Feature




# Using the Search Feature

The Search feature allows you to build a list of Part
IDs with which you can work based on a combination of criteria you
specify.

To build a search list:

1. If you are licensed
   to use multiple sites, specify the Site ID to use. If you are
   licensed to use a single site, this field is unavailable.
2. Click the Search
   button.

The Material Planning Window Search dialog
box appears.

3. Enter search information
   into the fields in the Part Qualifications section:

Part ID - The
Part ID for the part.

Description -
The description of the part.

Planner User ID
- The ID for the part planner.

Buyer User ID
- The ID for the person responsible for buying the part.

Planning Leadtime
- The number of days required to order and receive the part

On Hand Quantity
- The total quantity of the parts in all locations, including those
on hold.

Warehouse ID -
The Warehouse ID for the part.

Preferred Vendor ID
- The Preferred Vendor ID for the part.

Manufacturer -
The manufacturer of the part.

Manufacturer Part ID
- The manufacturers ID for the part.

Product Code -
User defined code used to group parts, usually used for parts that
are sold as products.

Commodity Code
- User defined code used to group parts, usually used for purchased
materials. You can search and sort on this field.

Fabricated - Select
whether the part must be fabricated or not. If it does not matter,
select Dont Care.

Purchased - Select
whether the part must be purchased or not. If it does not matter,
select Dont Care.

MRP is Required
- Select whether MRP is required or not. If it does not matter, select
Dont Care.

Select Required to examine the netting situation
before running MRP.

|  |  |
| --- | --- |
| IMPORTNT.gif | Queries are case-sensitive, as most Infor VISUAL strings are. You cannot combine wildcards with relational operators. |

4. Select one or more of
   the following option to filter your results:

Include parts with shortages
only - Select this option to search for parts with a negative
on-hand quantity.

Exclude obsolete parts
- Select this option to omit obsolete parts.

Parts with material requirements
dated between... - Select this option to view material requirements
between dates that you specify. When you select this option, the Starting
and Ending date fields become active. Enter the dates you would like
to use, or click the Calendar buttons to select dates.

Parts with customer orders
dates between... - Select this option to view parts listed
on customer orders within dates that you specify. When you select
this option, the Starting and Ending date fields become active. Enter
the dates you would like to use, or click the Calendar buttons to
select dates.

5. If you want the search
   to include parts with MRP exceptions, select the MRP Exceptions
   check box.

When MRP is run, if any exception messages
are generated for a part, it is marked as have MRP Exceptions.

Enter information into any of the following
exception qualifications fields:

Issue is Late by
- The number of days the issue of the part needed for the work order
is late.

Order is Late by
- The number of days the order that includes this part is late.

Release is Late by
- The number of days that an unreleased order with this part is late.
(This order should have been released X days ago.)

Sugg Release is Late
by - The number of days that an unreleased order with this
part is late, based on the system generated release date.

Order Projected Early
by - The number of days that any order with this part will
be early. (Find any part that has orders that will be early by X days.)

Order Projected Late
by - The number of days that any order with this part will
be late. (Find any part that has orders that will be late by X days.)

Stockout by -
The number of pieces at which this part reaches stockout quantity.

Overstock by -
The number of pieces at which this part reaches overstock quantity.

Release Near -
If you want the search results to include orders having a release
date within three days, select the Release Near
check box.

Sugg Release Near
- If you want the search results to include orders with suggested
release dates within three days, select the Sugg
Release Near check box.

Planned Orders Release Within - If you want to
use a different number of days than three for Release Near and Suggested
Release Near dates, select the Release Near
and Suggested Release Near check boxes and
enter the appropriate number of days in the Planned
orders rls w/in field.

|  |  |
| --- | --- |
| POSTIT.gif | You can only use the Release Near, Suggested Release Near, and Planned Orders Released Within functions if you have selected to use VISUALs Net by Required Date option. For more information, refer to [Netting By Required Date](Netting_By_Required_Date.htm). |

6. Select the search criteria
   for the exceptions qualifications section. Select the appropriate
   radio button:

* All
  of the specified criteria must be true. This is equivalent to
  an AND query.
* Any
  one of the specified criteria must be true. This is equivalent
  to an OR query.

7. Click the Search
   button to begin the search.

VISUAL searches your database, then displays
the results of the search in a browse dialog box.

8. Click the Sort
   by Vendor pushbutton to allow the user to view each item
   by the preferred vendor. The preferred vendors are displayed in
   the new Preferred Vendor column that has been added to the Material
   Planning Window Browse screen.

Note: The blank vendors are displayed first,
followed by the vendors that are displayed using the Sort option.

9. To call one of the parts
   into the Material Planning Window, double-click its line. You
   can also select the line and click View Part.

You can also print planning reports and
summary lists from the Browse dialog box.

## Using Wildcards and Relational Operators

You can use wildcards in your searches.

There are two types of wildcard you can specify. Use the % character
to indicate zero or more of any character in the position it is placed.
Use the \_ (underscore) character to indicate exactly one of any character
in the position in which you place it. You must match any other characters
exactly.

Consider the following examples for a Part ID, where the following
actual Part IDs exist: B12, B1241, B1241-A, B1242, B2242, BC2241

Query Matches
Parts    Matches

B1241 Must exactly match B1241  B1241

B12% Starting with B12 (B12, B1241)   B1241, B1242

%12\_\_ Starting with any string,

 containing "12," and ending

 with two more characters    B1242, BC1241

B\_242 Starting with B, having any

 second character and ending

 in 242     B1242, B2242

You can also use relational operators in front of an entry.

 > Greater than

 < Less than

 >= Greater than or equal to

 <= Less than or equal to

The most common use of operators is to query on leadtime and quantity
on hand. For instance, <10 would mean less than 10 days of leadtime
if placed in the Leadtime field.

## Saving Query by Example

All of the Part Qualifications entry fields in the Search dialog
box support the Query by Example selection method, which allows you
to use wildcards and relational operators.

If you frequently use the same search criteria, you can save time
by saving your search entries.

Click the Save QBE button to save your
search entries, including all wildcards and relational operators.

The next time to use the Search dialog box, your saved entries appear
in their respective fields.

![btn_mini.gif](btn_mini.gif "btn_mini.gif") Selecting Parts User Defined
Information