Language QRP Forms




# Language QRP Forms

You will need to create QRPs for each language variation
for each form you require. QRPs are identified using the Language
ID as a 2-character suffix. If you denote the Language ID by a xx,
you need to create the following QRPs:

Standard   Language
Variant

Vmordfrm.qrp   ordfrmxx.qrp

Vmordvat.qrp   ordvatxx.qrp

Vmshpfrm.qrp   shpfrmxx.qrp

Vminvfrm.qrp   invfrmxx.qrp

Vminvvat.qrp   invvatxx.qrp

Vfinvfrm.qrp   vfifrmxx.qrp

Vfinvvat.qrp   vfivatxx.qrp

Vfstmfrm.qrp   stmfrmxx.qrp

When producing packlists for a particular language, VISUAL needs
to detect all shipments where the specified language is associated
with the ShipTo address (if one is specified).VISUAL automatically
uses the language QRP and looks up the transalted part description.

Similarly, when producing acknowledgements for a particular language,
VISUAL detects orders for customers with that language. When producing
invoices, VISUAL checks the Bill To language and main Language IDs.

The following programs have been modified to support Language IDs:

* Vmcusmnt Vminvgen
* Vmprtmnt Vfarient
* Vmordent
* Vmshpent

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Customer_Maintenance.md) User-defined Help