Adding Service Information




# Adding Service Information

If you are licensed to use multiple sites, certain
information is stored at the site level and certain information is
stored at the tenant level.

You can add services to the database using Service
Maintenance.

1. Select Purchasing,
   Outside Service Maintenance or Eng/Mfg, Outside Service
   Maintenance.
2. In the header, specify
   this information:

Site
ID -  If you are licensed to use multiple sites, click
the Site ID arrow and select the site that
uses this service. If you are licensed to use a single site, this
field is unavailable.

Service
ID - Specify the ID for the service.

Description
- Specify a description of the service.

Service
Part ID - If the service is performed on a particular part,
click the Service Part ID browse button and select the part. Otherwise,
you can leave this field blank.

Preferred
Vendor ID - Click the browse button and select the primary
vendor for the service.

Usage
UM - Specify the unit that the vendor uses to measure this
service. For example, the service may be completed by Case or Each.

Obsolete
- If you are creating a new service, clear this check box. If you
select the check box, the service is not available for use. See [Marking an Outside
Service Obsolete](Marking_an_Outside_Service_Obsolete.md).

VAT
Code - If the parent entity of the site is VAT-enabled, specify
the VAT tax code for the service.

Include
for Intrastat - If Intrastat is enabled, select this check
box if the service is subject to intrastat reporting.

3. Click the Costs
   tab. Use the fields on the cost tab to specify the standard costs
   for this service. You can specify vendor-specific costs in the
   Vendors supplying service dialog. See [Adding
   Service Vendors](Adding_Service_Vendors.md). Specify this information:

Cost
per unit - Specify the standard cost per unit of measure.

Base
charge per - Specify the base charge per service. The base
charge is a one-time fixed cost for performing the service. The total
cost of the service is (cost per unit \* number of units) + base charge
per.

Minimum
charge - Specify the minimum amount that the vendor charges
for a service. If the total cost of the service exceeds the minimum
charge, then the vendor charges the cost of the service. If the total
calculate cost of the service is less than the minimum charge, then
the vendor charges the minimum charge.

Bid
Rate Category - Specify the bid rate category for this service.
Use bid rate categories to analyze budgets and quotes for this service.
Set up bid rate categories in Application Global Maintenance. See
[Bid Rate Maintenance](Bid_Rate_Maintenance.md).

4. Click the Planning
   tab. Use the fields on the Planning tab to specify the standard
   for how long it takes to complete the service. You can specify
   vendor-specific planning information in the Vendors supplying
   service dialog. Specify this information:

Trans
days - Specify the number of days that the parts spend in transit
between your warehouse and the outside service vendor.

Run
Type - Specify how the run rate is measured. Select Days/Piece,
Pieces/Day, Days/Load, or Loads/Day. A piece is one unit of measure
of the quantity.

Run
- Specify the number of pieces or loads in the run measurement. For
example, if you specified Pieces/Day in the Run Type field and 4 in
the Run field, four units are completed each day.

Load Size - If you specified Days/Load
or Loads/Day in the Run Type, specify the number of units in one load.
During scheduling, load size is calculated in whole numbers. For example,
if the quantity on an operation is 101, and the load size is 100,
 then the vendor performs the service on two loads.

5. In the Specifications
   field, enter detailed information or specifications about the
   service.
6. Click Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Outside_Service_Maintenance.md) User-defined Help