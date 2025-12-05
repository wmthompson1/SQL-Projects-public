Maintaining SOA Information




# Maintaining SOA Information

If you use business object documents (BODs) to integrate VISUAL
to another product, use SOA Maintenance to set the default information
that must appear on each BOD. For more information on a particular
integration, refer to the appropriate integration guide.

Note: You must be signed in as the SYSADM user to access SOA Maintenance.

1. Select Admin,
   Application Global Maintenance.
2. Select Maintain,
   SOA Maintenance.
3. Enter information in
   the following fields:

VISUAL Instance ID
Enter the value you specified as the third part of the logical ID
when you configured Infor10 ION. For example, if the logical ID you
used during Infor10 ION configuration is infor.visual.vmfg654, then
specify vmfg654 in this field.

Tenant ID Contact
your Infor representative for this information. Every application
in the integration must have the same tenant ID.

BOD Location
Specify a specific, physical site location. For example, if your company
is located in New York, you could enter NewYork for this value. When
BODs are generated, the value you enter for the location attribute
helps to identify the information.

Calendar Name
Specify the name of your accounting calendar. Calendar Name is used
in BODs such as AccountingChart.

Language ID
Specify the ID for the language you use. The format for the language
ID is the ISO two character code for the language in lower case followed
by a dash, then the ISO two character code for the country in upper
case. For example, the code for US English is en-US.

Version Click
the drop-down button to select the version of the technology stack
to which you are integrating.

Default UM Specify
the default unit of measure to use if an incoming IQM ItemMaster BOD
does not have a stock unit of measure. VISUAL cannot consume an ItemMaster
BOD sent by IQM if it does not have a stock unit of measure.

4. The Noun Settings table
   lists each VISUAL application that can currently export BOD information,and
   the ID of the BOD that sends the information. Specify the following
   settings for each Name:

Granularity
Granularity identifies the level that data is sent in the BOD. There
are three levels of granularity: tenant, accounting entity, and location.
Tenant is the broadest category; BODs are sent with the tenant identifier
only. BODs with the accounting entity granularity setting are sent
with both the tenant identifier and the accounting entity identifier.
BODs with the location granularity setting are sent with the tenant
identifier, the accounting entity identifier, and the location identifier.
Most of these settings are default values that you cannot change.

SOR Select the
SOR check box if VISUAL is the system of record for the BOD ID. Clear
the check box if VISUAL is not the SOR for the BOD ID. The SOR owns
a particular set of data and publishes it to other components.

Sync You can
only send a Sync BOD if VISUAL is the SOR for the BOD. If VISUAL is
the SOR, click the Sync drop-down button and select Out to publish
the BOD. Select Disabled if VISUAL is the SOR but you do not want
to publish the BOD.

Process If VISUAL
is the SOR, click the Process drop-down button and select In if you
would like VISUAL to receive BODs from other components. If VISUAL
is not the SOR, click the drop-down button and select Out to generate
a Process BOD. If you do not want VISUAL to send the BOD, click the
drop-down button and select Disable.

Type This field
is read-only. This field indicates whether the data sent is Transactional
(such as a purchase order or customer order) or Master Data (such
as customer IDs or account IDs).

Use Service
This check box is read-only. If the system selects the check box,
then the BOD generation service is installed. If the system clears
the check box, then the BOD generation is not in use. Although using
the BOD generation service is optional, it can improve your systems
performance.

Filter If the
Allow Filter check box is selected, you can filter the information
you send in a BOD. Depending on the noun, you can filter information
by ID or Date. Click the Filter button and enter a starting value
and an ending value. Records created or modified between the two dates
you specify, or between the two IDs you specify, are sent.

5. Click Save
   to save your settings.

After you generate BODs, the system deactivates the Visual Instance
ID, Tenant ID, SOA Location, and Calendar Name fields. You cannot
edit the information in these fields after BODs are generated.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Application_Global_Maintenance.htm) User-defined Help