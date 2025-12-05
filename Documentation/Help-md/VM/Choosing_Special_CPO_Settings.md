Choosing Special CPO Settings




# Choosing Special CPO Settings

1. With a CPO key specified
   in the VMDI Generate window, select Special
   Settings from the Options menu or click the Special
   Settings button on the main toolbar

The Special Settings dialog box appears.
The CPO tab has the default position. You cannot select the other
two tabs.

2. Select the appropriate
   options:

Select the Auto Generate
CO ID check box if you want VISUAL to generate the Customer
Order ID for you. After selecting this checkbox, you must enter a
Prefix Token for use in your VDI file.

During the exchange of EDI data, VISUAL
replaces the token with the actual generated Customer Order ID.

With the Autogenerate CO ID check box selected,
VISUAL generates unique Customer Order IDs for incoming EDI customer
orders. You cannot, however, use this feature if order details may
change, because VISUAL has no way of matching the original order with
the incoming changes to the order. Use this feature for unique, discrete
customer orders that you are sure will not change.

3. Enter a prefix token
   in the Prefix Token field.

During the exchange of EDI data, VISUAL
looks for this token in the 4th column on each header, line, and subline
in your VDI import file.

4. Click the Ok
   button to commit the special settings.