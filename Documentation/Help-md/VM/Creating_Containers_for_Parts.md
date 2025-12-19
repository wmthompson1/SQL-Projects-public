Creating Containers for Parts




# Creating Containers for Parts

Two types of containers are used for shipments in
the automotive industry: returnable containers and disposable containers.
Returnable containers offer significant cost-saving and control opportunities
over disposable containers.

Some of the benefits are:

* Reduced expendable packaging
  for part numbers
* Decreased or eliminate the
  recurring costs of expendable packaging and related costs for
  waste disposal
* Improved standardized packaging
* Improved inventory accuracy
* Reduced quality control
  costs
* Improved floor space use
  and maintain a cleaner work environment
* Decreased likelihood of
  damage during shipment.

Disposable containers provide expendable packaging for material
shipments. For parts shipped in bulk, bags or rolls, disposable containers
are the packaging choice.

For both returnable and disposable containers it is important to
record the weight of the container, weight of the dunnage, and weight
of the tray. Carton quantity, pieces per container, and unit of measure
are used to compute total weight for dunnage. Dunnage is a generic
term used to identify the entire package you are shipping and can
include the skid, any number of cartons or containers on the skid,
and any wrapping used to secure the cartons to the skid.

By creating containers for parts, you are creating special shipping
instructions that are used when shipping those parts. By specifying
container information for a part, you are establishing a relationship
between the customer who is to receive the part, the customer shipping
address, and the type of container to use to ship the part.

To create containers for parts:

1. Select Inventory,
   Part Maintenance.
2. If you are licensed
   to use multiple sites, click the Site ID arrow and select \*TENANT\*.
   If you are licensed to use a single site, this field is unavailable.
3. In the Part ID field,
   click the browse button and select the part whose containers you
   are setting up.
4. Select Maintain,
   Container Information.
5. Click Insert.
6. Specify this information:

Customer ID -
Specify the customer for whom to create carton settings.

Shipto ID - Specify
the customer's ship to location. A Shipto ID is a unique identifier
for a customer shipping address. This is the customer address to which
you are going to ship the part in this container.

Container Part ID
- Specify the part ID of the container. The Container Part ID must
be different than the regular Part ID. For example, if the parent
part has an ID of 1/4PLATE, the Container Part ID cannot be 1/4PLATE.

Container UM -
To change the unit of measure for the container, double-click the
Container UM browse button and select a unit of measure for the disposable
container that you are going to use to ship this Part ID.

If a conversion factor does not exist between
the Container Part IDs stock unit of measure and the unit of measure
you specify here, an error message is returned. To proceed, you must
either specify a unit of measure with an acceptable conversion factor
or leave the field blank.

Container Weight
- Enter a weight, in pounds, for the container you are going to use
to ship this Part ID.

Std Pieces Per Container
- Enter the standard number of pieces the container holds when shipping
the Part ID.

Skid Part ID -
Specify the part ID of the skid.

A skid is another name for a pallet, or
similar platform or area on which you would set material for processing
or transport.

The Skid Part ID must be different than
the regular Part ID and the Container Part ID.

Skid UM - To change
the unit of measure for the skid, double-click the Skid
UM column header and select a unit of measure for the skid
you are going to use to process this Part ID.

If a conversion factor does not exist between
the Skid Part IDs stock unit of measure and the unit of measure you
specify here, VISUAL returns an error message. To proceed, you must
either choose another u/m with an acceptable conversion factor or
leave the field blank.

Skid Weight -
Enter a weight, in pounds, for the skid you are using to handle this
Part ID.

Std Containers per Skid
- Enter the standard number of container holds the skid holds.

Package Types
- When you place your cursor in this field, a arrow appears. Click
the arrow to view a list box, containing two possible choices for
package types.

Select Disposable
if the packaging is disposable.

Select Returnable
if the packaging should be returned for reuse.

Harmonization Code
- Enter a Harmonization code for the part. Codes can be any combination
of alphanumeric identifiers, up to 64 characters in length. An HTS
code is part of the Harmonized System, the global classification system
used to describe most world trade in goods.

Default Container
- Select the Default Container check box if you want the package type
to be the default container for shipping the part.

Create Inv Transaction
 Select the Create Inventory Transaction
check box if you want VISUAL to generate an inventory transaction
record when issuing parts from inventory to a customer order.

Customer Ship Part ID
Specify the customers ID for the part. You can specify up to 30
alphanumeric characters into this field.

Dock Code Specify
the dock designation your customer provides.

The address information for the customer
you select is specified when you save the container information. If
this information is not essential, you can decide to not display these
fields.

* Name
* City
* State
* ZIP Code
* Country

7. Click Save.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Part_Maintenance.md) User-defined Help