Integrating VISUAL to PLM




# Using the VE - PLM Integration Utility

This topic covers the actions you can take in the VE - PLM Integration
Utility only. For more detailed information on integrating VISUAL
to PLM, refer to the Infor ERP VISUAL
Enterprise PLM 8.3 Integration Guide. You can download this
guide from Infor Support Portal.

Use the VE - PLM Integration Utility to configure VISUAL to send
and receive data from PLM. Use the utility for the following integration
procedures:

* [Creating
  directories for XML files](PLM2VESRVCWhat.htm#xmlfiles). These files contain data from VISUAL
  and PLM.
* [Specifying
  item default data](PLM2VESRVCWhat.htm#itemdefaultdata)
* [Transferring
  current VISUAL data to PLM in bulk](PLM2VESRVCWhat.htm#bulktransfer)
* [Transferring
  selected current VISUAL data to PLM](PLM2VESRVCWhat.htm#selecttransfer)
* [Transferring
  new data between VISUAL and PLM](PLM2VESRVCWhat.htm#newdata)

## Creating Directories for XML Files

Use the VE PLM Integration utility to set up directories to store
the XML files sent by PLM and VISUAL . These directories must be set
up on the VISUAL server

1. Launch PLM2VESRVC.exe. This executable is located
   in the directory where your executables are installed.
2. Click the Setup tab.
3. Click the VEPlmXmlHome browse button.
4. In the VEPlmXmlHome Name field, specify the name
   you would like to use for this directory.
5. In the VEPlmXmlHome Path field, specify the file
   path where you would like to install the VEPlmXmlHome directory.
6. Click the Create VE-Plm Xlm Home button. The system
   creates the following sub-directories in the directory you specified:

Xml-input The system places the data
to be sent from PLM to VISUAL in this folder.

Xml-output The system places the data
to be sent from VISUAL to PLM in this folder.

Archive\Xml-input The system places
the input data processed by VISUAL in this folder.

## Specifying Item Default Data

During the initial set up of the VISUAL - PLM integration, VISUAL
sends the following Item Type/Item Group pairs:

| Item Type | Item Group |
| Fabricated | Part |
| Purchased | Part |
| Detail | Part |
| Tool or Fixture | Detail |
| Consumable | Consumable |
| Fabricated and Purchased | Part |
| Service | Service |

You can define default data for each pair using the Default Item
Data tab.

1. In the directory where
   your executables are installed, double-click PLM2VESRVC.exe
2. Click the Default Item
   Data tab.
3. Each Item Type/Item
   Group pair is listed in the table. Specify the default values
   for each pair:

Order Policy Select the Order Policy you
would like to use.

Product Type Select the Product Type you
would like to use. Define Product Types in Part Maintenance. If you
choose to send product types, PLM uses them as the type code.

Unit of Measure Select the Unit of Measure
you would like to use.

Unit Set If the Unit of Measure you selected
has an associated Unit of Measure Category, the system inserts the
category in the Unit Set field.

Warehouse Select the default warehouse
you would like to use.

4. Click the Save button.

## Transferring current data in bulk

Use the Bulk Export to PLM tab to transfer the current data in your
VISUAL database to PLM. If you would like to send only portions of
your existing data, refer to the Transferring selected current data
section.

1. From the VE PLM Integration
   window, select the Bulk Export to PLM tab.
2. Select the data you
   would like to send. To select data, highlight the row and click
   the Make Active button. The system places a check box in the Active
   column. To prevent certain data from being sent, select the appropriate
   row and click the Make Non-active button. You can select all rows
   by clicking the Select All button. You can de-select all rows
   by clicking the Deselect All button.
3. Click the Send selected
   active data to PLM button.
4. Click Save to save your
   settings.

### Special conditions for data transferred from VISUAL

The following data are subject to special conditions:

Currency If a currency is mapped to an ISO code in VISUAL Code
Maintenance, then the system uses the ISO code for the Type Code and
Short Description in PLM 8. If a currency is not mapped to an ISO
code, then the system uses the currency ID from Currency Maintenance
for the Type Code. The short description is the concatenation of Currency
Code in Currency Maintenance, a hyphen, and the Name of the currency
in Currency Maintenance.

Product Type The system sends VISUAL Product Codes for PLM Product
Types. For the PLM Product Code Type Short Descriptions, the system
sends the concatenation of the VISUAL Product Code, a hyphen, and
the VISUAL Product Code Description.

Warehouse This option sends the ID and description information
from the VISUAL WAREHOUSE table to PLM as a user-defined type.

Unit of Measure If a unit of measure is mapped to an ISO code
in VISUAL Code Maintenance, then the system uses the ISO code for
the Type Code and Short Description in PLM 8. If a unit of measure
is not mapped to an ISO code, then the system uses the unit of measure
ID from Unit of Measure Maintenance for the Type Code.

Unit Category The system sends VISUAL unit categories as PLM Unit
Sets. The PLM Type Code is equal to the VISUAL unit of measure category.
The short description is a concatenation of the VISUAL unit of measure
category, a hyphen, and the unit of measure category again.

Unit of Measure MASS Category If a unit of measure in VISUAL
has the category of MASS, then the system sends the VISUAL unit of
measure as a PLM Weighted Unit in addition to sending it as a unit
of measure.

## Transferring selected current data

Use the Selective Export to PLM tab to transfer a subset of certain
types of data from VISUAL to PLM.

1. From the VE PLM Integration
   window, select the Selective Export to PLM tab.
2. Click the Export Item
   arrow to select the type of data you would like to send. The system
   inserts the name of the VISUAL database table where the data resides.
3. Click the VE ID list
   to select the specific IDs you would like to send. The system
   opens a browse table. You can select a single ID or multiple IDs.
   Click the Select and Close button after you make your selections.
4. Click the Export File
   button. The system creates a file name for the export file.
5. Click the Generate XML
   button. The system creates the XML and sends it to PLM. The system
   displays the information in the Output/XML box.
6. Click the Save to File
   button to save a copy of the XML.

## Transferring new data between PLM and VISUAL

You can transfer new data between PLM and VISUAL by setting up the
PLM VE Integration utility as a service or by transferring data
manually.

### Setting up the PLM VE Integration utility as a service

When you set up the PLM VE Integration utility as a service, VISUAL
sends and receives data from PLM automatically based on the parameters
you specify. To set up the PLM VE Integration utility as a service:

1. From the PLM VE Integration
   window, click the Setup tab.
2. In the Poll Interval
   field in the Service section, enter how frequently you would like
   the service to check for new incoming or outgoing information.
   The number is expressed in seconds.
3. Click the Install button.
   If the system installs the service successfully, it displays a
   The service was successfully added! message in the Xml/Output
   field.
4. After you install the
   service, configure it in the Services portion of the Windows control
   panel. To access Services in the control panel, click the Windows
   Start button and select Control Panel, Administrative Tools, Services.
5. In the Log On tab, select
   the This account option and specify the user name and password
   for the service. Re-enter the password in the Confirm password
   field.
6. Click Ok.

### Using the PLM VE Integration utility to transfer data

You can use the PLM VE Integration utility to transfer data between
VISUAL and PLM. The utility must be open to transfer data. Use the
Setup tab to specify how often the utility should check for new information
and to start and stop data transfer.

1. From the PLM VE Integration
   utility, click the Setup tab.
2. In the Timer section,
   specify how often you would like the utility to check for new
   data.
3. Click the Start button
   to notify the utility to begin checking for new information.
4. Click the Stop button
   when you would like the utility to stop checking for new information.

### Transferring new data between VISUAL and PLM manually

If you did not set up the PLM - VE Integration Utility to run as
a service, or if you would like to transfer data immediately, you
can to transfer data manually.

Transferring data from VISUAL to PLM
manually

To manually transfer data from VISUAL to PLM, follow the procedures
for transferring current bulk data and transferring selected current
data outlined above. Any new data that fits the parameters you select
is sent to PLM. PLM will import the data based on the load interval
you specified when you set up the Load Server. You can also import
the data into PLM manually. Refer to Manually loading data from VISUAL
to PLM for more information on loading data into PLM manually.

Transferring data from PLM to VISUAL
manually

To manually transfer data from PLM to VISUAL, use the Import from
PLM tab.

1. From the PLM VE Integration
   window, select the Import from PLM tab.
2. Click the Import File
   browse button and select the XML file generated by PLM.
3. If you would like to
   review the data in the XML file, click the Read Xml button. The
   system displays the information in the XML file in the Output/Xml
   box.
4. Click the Import from
   Xml to import the data from PLM to VISUAL.