Consolidating Pack Lists




# Consolidating Pack Lists

The consolidation feature of Shipping Entry allows
you to consolidate the Pack list ID, ASN ID, and Invoice ID when you
ship a customer order.

To use this feature, you must have the correct VISUAL EDI license
key and the Generate ASN check box must be selected for the customer.
See earlier in this chapter.

1. From the Sales menu,
   select Shipping Entry.

The Shipping Entry window appears.

2. Click the Order
   ID button to select the order you want to ship.

VISUAL auto-fills the necessary fields with
the order information.

3. From the File menu,
   select Print Pack Lists.

The Print Pack List dialog box appears.

4. From the Print section,
   select the Before Shipment option button.
5. To print a pack list
   for just this order, select the Print Current
   Order option button.
6. From the Format section,
   select the Print Form option button.
7. Specify the output format.
   See [Report Output Options](Report_Output_Options.htm).
8. Click the Ok
   button to output the pack list.

After printing or viewing the pack list,
VISUAL displays a dialog box and asks you if the pack list printed
correctly.

The pack list number VISUAL generates appears
in the top line.

If you selected E-Mail,
an E-mail - Send dialog box appears. When you click the OK
button, a send dialog box appears so you can specify to whom you want
to send the report. If you are sending a PDF, VISUAL starts the distiller,
converts the document to PDF, and attaches it to the e-mail.

9. If the pack list printed
   correctly, click the Yes button; if
   it did not, click the No button.

If you answer yes, VISUAL displays a second
dialog box, asking you if you want to consolidate the pack list, ASN,
and invoice number for this order.

10. Click the Yes
    button to consolidate the three into one number.

VISUAL returns you to the Shipping Entry
window, which it has cleared and readied for shipping.

11. Ship the order by clicking
    the Order ID button and selecting the
    customer order or entering it manually in the Order ID field.
12. Adjust order information
    as necessary, and then ship the appropriate quantities by clicking
    the Ship All button or selecting Ship All from the Edit menu. Click here for
    more information on [shipping
    quantities](VMSHPENTfrmShipping.htm).

VISUAL creates a pack list for the order
and assigns the ASN and invoice the same ID.

For example, using consolidation logic,
VISUAL creates a pack list of 50058PK (depending on your auto numbering
preferences), an ASN of 50058PK, and an invoice of 50058PK.

Orders that you choose to consolidate in
this manner are not eligible for invoicing using the Invoice Forms
window. VISUAL automatically generates an A/R invoice for them when
you print the pack list.

To verify the invoice, use the A/R Invoice
Entry window.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Shipping_Entry.htm) User-defined Help