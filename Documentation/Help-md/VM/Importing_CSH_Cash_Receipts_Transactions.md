Importing CSH (Cash Receipts) Transactions




# Importing CSH (Cash Receipts) Transactions

1. In Cash, Bank Account
   Maintenance, create a bank account record and be sure to assign
   the Account No. and Routing No. fields that you will be importing.
2. In Ledger, Currency
   Exchange Rate Maintenance, Edit, Currency Maintenance, enter an
   ISO Code for your Currency ID.
3. In Ledger, Currency
   Exchange Rate Maintenance, Edit, Currency Maintenance, enter a
   Rounding account for your Currency ID.
4. As a verification step
   (optional), you can go into Receivables>Cash Application and
   select your customer via the Customer ID button - you should see
   your invoices listed with the correct invoice amounts.
5. Now it is time to create
   the VMDI Layout. You will have to do this once per database for
   each customer (or customers). If you have more than one customer
   sending you a layout containing the exact same fields, then you
   may use the same layout for those customers. However, if a customer
   is using one different field, then we recommend that you create
   a separate layout for that customer.
6. Your EDI Trading Partner
   (i.e. the company that will be sending you 820 Remittance Advice
   Cash Receipts via EDI) should have provided your EDI Mapper with
   a list of fields that they will be transmitting to you. The Mapper
   would then have gone into VMDI Generate and created a VMDI layout.
   The field locations listed in the layout would have been used
   by the Mapper to create an EDI translation map that will be used
   to translate the inbound 820 EDI data into a file that can be
   imported into VISUAL.

A sample 820 EDI document looks something
like this:

ISA~00~EDS33-EFT
~00~EDS33-EFT ~ZZ~EDS33-EFT ~ZZ~189999806 ~000317~0134~U~00200~000000129~0~P~@\*

GS~RA~EDS33-EFT~189999806~000317~013446~129~X~003030\*

ST~820~000000001\*

BPR~I~970~C~ZZZ~~~~~~9GM-DELUSD~~01~099000261~~1554754~000317\*

TRN~1~ACS030314787\*

CUR~PR~USD\*

REF~IT~00189999806\*

N1~PE~DOWTY
ORINGS NORTH AMERIC\*

N2~ATTN:
ACCOUNTS RECEIVABLE\*

N3~AKA
DOWTY POLYMERS INC~ 4275 ARCO LN\*

N4~NORTH
CHARLESTON~SC~29418\*

N1~PR~DELPHI
AUTOMOTIVE SYSTEMS\*

ENT~1\*

RMR~BM~P04277~~970~970\*

REF~OI~P04277I38992371\*

REF~PO~~P04277
SAG90I1564\*

REF~PE~K9~DELPHI
SAGINAW HQTRS\*

DTM~003~000105\*

IT1~00000000001~50000~PC~.0194~~PU~26001594
001\*

SE~18~000000001\*

GE~1~129\*

IEA~1~000000129\*

An example VMDI CSH layout contains the
following (Note: Please read the sections in the VMDI Users Manual
concerning the VMDI Generate and Exchange programs prior to first
use):

Key: CSH

Version: 0001

Description: CSH Test

File Type: Single

File Style: Fixed

Direction: Inbound

Header fields:

RECTYPE, CUSTOMER\_ID, CHECK\_ID, ACCOUNT\_NO,
ROUTING\_NO, CHECK\_DATE, ISO\_CURRENCY\_CD, ENTITY\_ID, AMOUNT

Line Item fields:

RECTYPE, CUSTOMER\_ID, CHECK\_ID, LINE\_NO,
INVOICE\_ID, AMOUNT

7. Create Customer Orders
   in Customer Order Entry, ship them via Shipping Entry, and then
   invoice them via Receivables>Invoice Forms
8. Create your VMDI layout
   by launching EDI> VMDI Generate and creating the layout per
   the fields provided to you by your EDI Mapper

Now you are ready to use VMDI. First, you
will need to receive 820 EDI transactions into your EDI Mapping Translation
software and translate the data into a CSH0001.VDI file (in our example
here). Make note of the directory to which the map is writing the
file you will need that knowledge when running VMDI Exchange.

9. Once you have you CSH0001.VDI
   file (a text file), and have created your VMDI layout in VMDI
   Generate as in the example layout above, you are ready to run
   the file through the VMDI Exchange program.
10. Launch EDI>VMDI Exchange,
    select your key and version, type in the Directory where the CSH0001.VDI
    file (in our example) is stored, and click the Exchange button.
11. The Exchange performed
    in step 10 should have produced a Result Dialog at the end telling
    you how many headers and records were inserted or updated and
    if any errors were encountered. Logs are produced in the directory
    where your VDI file is stored with the same name as your file,
    for instance:

CSH0001.XML is your error log and CSH0001G.XML
lists the details of all records inserted, updated, or rejected

12. When running VMDI Exchange
    for a CSH import, the program does not actually update the VISUAL
    database directly but instead writes to the temporary database
    tables: VMDI\_CSH\_HDR and VMDI\_CSH\_LINE. The transactions are written
    to these tables with a Pending flag set to "P" indicating
    that the transactions have not yet been imported into VISUAL.
    To import them into VISUAL, you will need to run the VMDI Cash
    Applications Processor. Note: Prior to your VMDI Exchange import,
    you have the ability to go into VMDI Exchange>Options>Flush
    Temporary Cash Tables to wipe clean those two tables of previously
    imported transactions. After each transaction is processed into
    VISUAL, the pending flag is changed and the program will not import
    it again. As such older transactions in the tables should not
    interfere with future imports. However, since some users will
    be processing large volumes of transactions, users may want flush
    out these two tables on a regular basis.
13. The VMDI Cash Applications
    Processor (Processor) is accessed from the EDI menu. The processor
    allows the user to either process all transactions in the VMDI\_CSH\_HDR
    and VMDI\_CSH\_LINE tables based on a timer setting, or individually.
    Timer options are set via Timer Options>Set Timer Period. You
    are able to enter a process interval, select to have the program
    started automatically with the timer on, or have the program create
    logs (Recommended). The program will create one log per pending
    record (i.e. per Header record from your VDI file). With the Timer
    Off, you can process individual records from the menu by highlighting
    the header (and its associated line items) and selecting File>Process
    Selected Row.
14. The VMDI Cash Applications
    Processor will launch the VISUAL Cash Application program for
    each record processed. The processed records are viewable from
    the Completed Transactions tab of the Processor. You are now able
    to launch Receivables>Cash Application, select your Payment
    ID and you should see that the payments were applied to your invoices.
15. As long as you have
    chosen to have the program create logs (recommended), then in
    the event that the Processor encounters an error, it will write
    that information to an error log to let user know what it did
    the log is named VFCSHERROR.LOG and is stored in the directory
    where your ini files are located. You should make it part of your
    normal procedures to Always look at that error log after each
    import run with the Processor. The Processor will also create
    one log per pending record (Header record from your VDI file),
    so you may also want to monitor the size of these files and take
    appropriate action (i.e. copy them to backup tape, and delete
    them from here).

Example from the VFCSHERROR.LOG are listed below:

CSH Transaction Error Record generated on 6/11/01-4.28.18 PM

Database=SS862, User ID=SYSADM, Application ID=VFDICSH, Version=6.2.5.016,
DB: MS SQLSERVER

Pending ID= 1

Header Amount not equal to Sum of Line Amounts, for Customer: FINMAN,
Check ID: 507654350 with Amount: 800.00

CSH Transaction Error Record generated on 6/14/01-3.25.35 PM

Database=SS862, User ID=SYSADM, Application ID=VFDICSH, Version=6.2.5.016,
DB: MS SQLSERVER

Pending ID= 3

Customer ID: FINMAN; Invoice ID: IV-06509AR;
Available Invoice Amount: 254.36; Payment Amount: 300.00; Reason Code:
Unallocated for Overpayment condition.

|  |  |
| --- | --- |
| POSTIT.gif | If the Amount listed in the HDR record of your CSH VDI file does not match the sum of the amounts in the LIN records associated with that HDR, then that transaction is not processed into VISUAL. The user needs to diagnose the reason for the discrepancy.  If the LIN amount in the VDI file is greater than the payment balance of the invoice amount in VISUAL , then the transaction the Amount from the LIN is created as an unapplied credit memo for the customer. The user needs to diagnose the reason for the discrepancy and manually apply as necessary.  All processed transactions will appear in the Cash Application program with a payment method of "Export" but will be otherwise indistinguishable from manually entered transactions. |

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Data_Interchange.htm) User-defined Help