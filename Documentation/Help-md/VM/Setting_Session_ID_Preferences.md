Setting Session ID Preferences




# Setting Session ID Preferences

You can establish exchange log file naming preferences
by using the Session ID option. With this option, you can change the
log numbering sequence, and add a prefix and/or suffix.

1. From the Options menu,
   select Session ID, or click the Session ID button on the main toolbar.
2. The Session ID Settings
   dialog box appears.
3. Select the Use Session
   ID check box if you want to specify a Session ID for VMDI exchange
   logs.

The Next Session Prefix and Suffix data
fields are now active.

4. Enter the number for
   the next session log. VISUAL automatically increments the number
   as you conduct exchanges. If for some reason you want to use a
   different number, enter it in the data field.

Enter a suffix if you want the exchange
log file to have a special ending. For example, a next session log
of 6 and a suffix suffix of VM, the logs produced would be named
CPO6VM instead of CPO0001.

5. Select the prefix KEY
   check box if you want VISUAL to attach the Key of the exchange
   (e.g. CPO, ACK, etc) to the front of the log file. Selecting
   this makes the Prefix field unavailable. For example, setting
   preferences to a next session log of 7, a suffix of VM, and a
   KEY of ACK, leads to VISUAL producing the log ACK7VM.

The log files provide detailed information about your most recent
VMDI Exchange sessions. Log files include:

* VMDI Exchange Session ID
* Session Date and Time
* User who initiated the sessions
  Imported Transactions
* Key, Version and description
  of the VMDI Generate Layout

## For Key PLN

* Customer ID
* Forecast ID
* Forecast Date

## For Key CPO

* Customer ID
* Order ID
* Status: INSERTED or UPDATED

## For Key CSH

* Customer ID
* Payment ID
* Imported Transactions
* Key, Version and description
  of the VMDI Generate Layout
* Total number of transactions/documents
  in the imported file

## For Key INV

* Customer ID and Invoice
  Numbers exported

## For Key ASN

* ASN #, BOL # and Packlist
  #s that were referenced on it

## For Key ACK

* Customer Number being acknowledged
* Status Original acknowledgement
  or Change Acknowledgement

## For Key VPO

* Vendor ID and Vendor Purchase
  Order Number exported

## For Key RCA

* Vendor ID and Vendor Purchase
  Order Number exported

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Data_Interchange.md) User-defined Help