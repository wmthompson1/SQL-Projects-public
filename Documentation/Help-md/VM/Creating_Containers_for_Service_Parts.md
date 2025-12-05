Creating Containers for Service Parts




# Creating Containers for Service Parts

Outside Service Maintenance allows you to define container
information for service parts, by vendor address. Usually a component
of a work order, service parts are parts dispatched to an outside
vendor for a specific service, such as heat treating or plating.

VISUAL uses a service part's container information when generating
pallet details in Service Dispatch Entry.

1. From the VISUAL main
   menu, select Outside Service Maintenance
   from the Purchasing or Eng/Mfg menu.

The Outside Service Maintenance window is
displayed.

2. Click the Service
   ID button to view a browse dialog of the SERVICE table
   and select the service for which you want to specify carton information.
3. From the Maintain menu,
   select Container Information.

The Container Information for Service (Service
ID currently in the window) dialog is displayed.

4. Click the Insert
   button to add a new line to the table.

VISUAL adds a new line to the table and
places a cursor in the <Vendor ID> field.

5. Specify this information
   :

The name of the column as it appears in
the SERVICE\_SHIPPING table follows in parentheses after each column
header.

|  |  |
| --- | --- |
| POSTIT.gif | Keep in mind that Service Part ID, Container Part ID, and Skid Part ID, are three unique identifiers for the same part. VISUAL uses each ID in a different aspect of the service part dispatch process. |

<Vendor ID>
(VENDOR\_ID) - Double-click the <Vendor ID>
column header to browse the VENDOR  table
and select the vendor for whom you want to create carton settings.

Addr No - (ADDR\_NO)
- Double-click the <Addr No> column
header to select a Address Number ID for the vendor. An address number
is a unique identifier for a vendor shipping address. This is the
vendor address to which you are going to ship the service parts.

<Service Part ID>
(SERVICE\_PART\_ID) - Double-click the <Service
Part ID> column header to select the Part ID of the part
you are dispatching for service. For example, if this container line
is for Part ID A8000, select Part ID A8000.

Later, you'll have the chance to specify
alternate IDs in the form of a Container Part ID and a Skid Part ID,
both of which are fields designed specifically to hold service container
information.

<Service Part UM>
(CONTAINER\_UM) - Double-click the <Service Part
UM> column header to select a unit of measure for the service
part.

|  |  |
| --- | --- |
| POSTIT.gif | After selecting a Service Part ID, place your cursor in the Service Part UM field. If appropriate, VISUAL auto-fills the field with the part's default UM. |

If a conversion factor does not exist between
the Service Part ID's stock unit of measure and the unit of measure
you specify here, VISUAL returns an error message. To proceed, you
must either choose another u/m with an acceptable conversion factor
or leave the field blank.

Service Part Weight
(SERV\_PART\_WEIGHT) - Enter a weight, in pounds, for the service part.

Because the weight of the part you are sending
out for service may change, use this field to enter an adjusted part
weight. For example, if a grinding service typically lessens the weight
of a part by a pound, enter the appropriate weight.

If the service does nothing to change the
weight of the part, accept the default weight from the part master.

<Container Part ID>
(CONTAINER\_PART\_ID) - Double-click the <Container
Part ID> column header to select a Container Part ID for
the service part.

In addition to the Service Part ID (see
above), select an alternate, container ID for the service part.

The Container Part ID must be different
than the Service Part ID.

<Container UM>
(CONTAINER\_UM) - Double-click the <Container
UM> column header to select a unit of measure for the Container
Part ID.

|  |  |
| --- | --- |
| POSTIT.gif | After selecting a Container Part ID, place your cursor in the Service Part UM field and VISUAL auto-fills the field with the part's default UM. |

If a conversion factor does not exist between
the Container Part ID's stock unit of measure and the unit of measure
you specify here, VISUAL returns an error message. To proceed, you
must either choose another u/m with an acceptable conversion factor
or leave the field blank.

Container Weight
(CONTAINER\_WEIGHT) - Enter the weight, in pounds, of the container.

Std Pieces Per Container
(STD\_PCS\_CONTAINER) - Enter the standard number of pieces (parts)
one container holds.

<Skid Part ID>
(SKID\_PART\_ID) - Double-click the <Skid Part
ID> column header to select a Skid Part ID for the service
part.

A skid is another name for a pallet, or
similar platform or area on which you would set material for processing
or transport.

The Skid Part ID must be different than
the regular Service Part ID and the Container Part ID.

<Skid UM>
(SKID\_UM) - Double-click the <Skid UM>
column header to select a unit of measure for the Skid Part ID.

|  |  |
| --- | --- |
| POSTIT.gif | After selecting a Skid Part ID, place your cursor in the Service Part UM field and VISUAL auto-fills the field with the part's default UM. |

If a conversion factor does not exist between
the Skid Part ID's stock unit of measure and the unit of measure you
specify here, VISUAL returns an error message. To proceed, you must
either choose another u/m with an acceptable conversion factor or
leave the field blank.

Skid Weight (SKID\_WEIGHT)
- Enter a weight, in pounds, of the skid.

Std Containers per Skid
(STD\_CONTAINER\_SKID) - Enter the standard number of containers the
skid holds.

Container Type
(CONTAINER\_TYPE) - Click the arrow to select either Disposable or
Returnable.

Select Disposable
if the container is disposable.

Select Returnable
if the container is reusable.

Default Container
(DEFAULT\_CONTAINER) - Select the Default
Container check box if you want the container type you previously
selected (see above) to be the default container for the service parts.

In order for VISUAL to automatically generate
pallet details when dispatching parts for service, specify a default
container in at least one row.

Vendor Service Part ID
(VEND\_SERV\_PART\_ID) - If applicable, enter the vendor's ID for the
service part.

Package Type (PACKAGE\_TYPE)  - Double-click the <Package
Type> column header to select a package type for the service
part. Enter package types in Application Global Maintenance.

Create Inv Transaction
- Select the Create Inventory Transaction
check box if you want VISUAL to generate an inventory transaction
record when issuing parts for service.

|  |  |
| --- | --- |
| POSTIT.gif | VISUAL fills the next 5 columns with default information it obtains from the vendor record in the VENDOR table. If you don't want to view these fields, configure the line item table to hide them. |

Name (NAME) -
The name of the vendor. This is a read-only field. To change it, use
Vendor Maintenance.

City (CITY) -
The city in which the vendor has its primary business address.

State (STATE)
- The state in which the vendor has its primary business address.

ZIP Code (ZIPCODE)
- The vendor's ZIP Code.

Country ID (COUNTRY\_ID)
- The vendor's unique country identifier.

Country (COUNTRY)
- The country in which the vendor has its primary address.

6. Click Save
   to save the container line.
7. To delete a line, select
   it, click Delete, and then click Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Outside_Service_Maintenance.htm) User-defined Help