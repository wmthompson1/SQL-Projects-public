Setting Up ECNs




# Setting Up ECNs

After you have set up the appropriate employees to
have access to your ECNs, you must set up your ECN options in the
Site Maintenance window.

If you are licensed to use multiple sites, you must
establish ECN default settings on a site-by-site basis. If you are
licensed to use a single site, you must establish ECN default settings
on an enterprise-wide basis.

1. Open the Site Maintenance
   window.
2. If you are licensed
   to use multiple sites, click the Entity ID
   arrow and select the parent entity of the site. If you are licensed
   to use a single site, this field is unavailable.
3. If you are licensed
   to use multiple sites, click the Site ID
   arrow and select the site for which you are setting up default
   ECN information. If you are licensed to use a single site, this
   field is unavailable.
4. Click the ECN
   tab.
5. Select the appropriate
   check boxes for the following:

Modify ECNs with an on-hold
status - If you want your users to be able to modify ECNs with
an on-hold status, select the Modify ECNs with an on-hold status check
box.

If you do not select the Modify ECNs with
an on-hold status check box, a user cannot modify the ECN until they
have changed the on-hold status.

Password required for
secured fields - If you want to require your users to enter
a password when they enter data or change the status of secured fields,
select the Password required for secured fields check box. This functionality
provides you with electronic signature capability.

Generate all tasks simultaneously
- If you want tasks generated for members of all of your ECN teams
at the same time when you change the ECNs status from Undefined,
select the Generate all tasks simultaneously check box. If you do
not select this check box tasks are generated only for the first non-completed
team. For example, Implementation team members will not receive tasks
until Authorization team members have all signed off on their tasks.

Lock new engineering
change notifications - If you want to automatically lock all
new ECNs, select the Lock new engineering change notifications check
box.

Allow application of ECN to unreported ops/reqs
to in-process work orders Select this check box if you would like
the system to apply ECNs to work orders that are already in process,
provided that labor has not already been reported or material issued
to the operations and requirements affected by the ECN. For example:
you have an engineering master with operations A, B, and C. You enter
an ECN that affects operation B.

In one work order based on the engineering
master, a labor ticket has already been entered against operation
B. In this case, the ECN would not be applied to the work order. In
another work order based on the engineering master, labor had been
reported to operation A but not to operation B. In this case, the
ECN would be applied.

If the ECN update has any impact on a requirement
or operation that has actual labor or material issues, the system
will not update the work order. For example, if an ECN changes a quantity
per on a leg header card, the system will not update the work order
if labor or materials have been applied under the leg.

If you select this check box, the system
will not apply ECNs to split work orders or work orders with active
demand supply links.

Clear the check box if you do not want the
system to apply ECNs to any in-process work order.

6. In the Maintenance section
   of the ECN tab, click the appropriate button and set up the following:

Types - In the
Types list, set up specific codes for the types of ECNs your company
uses. ECN types are specific classifications to your company. Some
common ECN types include Drawing Revision, Design Change, New Tooling,
and Tooling Change.

Reasons - In the
Reason list, set up the codes you want to use for the reasons you
will be issuing ECNs in your company. Some common ECN reasons include
Design Defect, Field Failure, Manufacturability, and Regulatory/Standards
Requirements.

Dispositions -
In the Disposition list, set up codes for the dispositions you want
in processing ECNs in your company. Some common ECN disposition codes
include New, Obsolete, Scrap, Use as Is, and Return to Vendor.

Rejection Codes
- In the Rejection Codes list, set up the codes you want to use for
why a particular ECN may be rejected.

7. If you use Infor Quality
   Management, specify the connection settings to use. Click the
   General tab, and then select the Enable check box in the Infor Quality Management
   Interface section. Specify this information:

Always Use/Query Use
After an ECN is ready to be implemented, you click the Start button
in ECN Entry. These options determine the result of clicking the Start
button. If you click Always Use, then IQM is always launched when
you click the Start button in ECN Entry. If you click Query Use, then
you are prompted to choose to open the appropriate IQM maintenance
window or to open the appropriate VISUAL maintenance window. For example,
if the ECN is for a document, you can choose to open IQM Document
Maintenance or VISUAL Document Maintenance.

Application Path
Specify the default URL for IQM. This is the URL you access to sign
into IQM.

Configuration
Specify the IQM configuration to sign into.

Use VE User
To pass the currently signed in VISUAL user ID to the IQM sign in
window, select this check box. If the user is already signed into
IQM, then IQM can be accessed directly from VISUAL. The user does
not have to sign into IQM again. If the user is not currently signed
into IQM, then the user ID is passed to the IQM sign in window. The
user must supply a password. To require users to always sign into
IQM, clear this check box.

8. Click the Save
   icon on the toolbar.

Your settings are saved to your database.