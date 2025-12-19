What is the BTS Import Utility?




# What is the BTS Import Utility?

This BTS import utility allows you to import data
from an existing legacy system or your own design for a batch system.

You can import the data in one of two formats: Comma Separated Values
(\*.csv) and eXtensible Markup Language (\*.xml). The two formats differ
greatly; here are definitions of each:

## Comma Separated Values (\*.csv)

This file format has the first record (or row) that contains the
field names from the AMTS PENDING TRANS table, followed by records
(or rows) of the data to be inserted into their respective columns.

Here is an example of a Clock In/Clock Out sequence of transactions:

PENDING\_ID, TRANS\_TYPE, USER\_ID, PENDING\_FLAG, TRANSACTION\_DATE,
TRANS\_DATETIME, INDIRECT\_ID

18276,'C','DAVE','P', 25-DEC-2000, 25-DEC-2000 10:40:00, 'BREAK'

18276,'O','DAVE','P', 25-DEC-2000, 25-DEC-2000 11:50:00, ''

## eXtensible Markup Language (\*.xml)

This file format features data located between tags, which are the
actual field names from the AMTS Pending TRANS table.

Here is an example of a Clock In/Clock Out sequence of transactions:

<AMTS\_PENDING\_TRANS>

<PENDING\_ID>18276</PENDING\_ID>

<TRANS\_TYPE>C</TRANS\_TYPE>

<USER\_ID>DAVE</USER\_ID>

<PENDING\_FLAG>P</PENDING\_FLAG>

<TRANSACTION\_DATE>25-DEC-2000</TRANSACTION\_DATE>

<TRANS\_DATETIME>25-DEC-2000 10:40:00</TRANS\_DATETIME>

<INDIRECT\_ID>BREAK</INDIRECT\_ID>

</AMTS\_PENDING\_TRANS>

<AMTS\_PENDING\_TRANS>

<PENDING\_ID>18276</PENDING\_ID>

<TRANS\_TYPE>O</TRANS\_TYPE>

<USER\_ID>DAVE</USER\_ID>

<PENDING\_FLAG>P</PENDING\_FLAG>

<TRANSACTION\_DATE>25-DEC-2000</TRANSACTION\_DATE>

<TRANS\_DATETIME>25-DEC-2000 10:40:00</TRANS\_DATETIME>

</AMTS\_PENDING\_TRANS>

or it can be imported like this:

<AMTS\_PENDING\_TRANS>

<PENDING\_ID>18276</PENDING\_ID><TRANS\_TYPE>C</TRANS\_TYPE><USER\_ID>DAVE</USER\_ID><PENDING\_FLAG>P</PENDING\_FLAG><TRANSACTION\_DATE>25-DEC-2000</TRANSACTION\_DATE><TRANS\_DATETIME>25-DEC-2000
10:40:00</TRANS\_DATETIME><INDIRECT\_ID>BREAK</INDIRECT\_ID>

</AMTS\_PENDING\_TRANS>

<AMTS\_PENDING\_TRANS>

<PENDING\_ID>18276</PENDING\_ID><TRANS\_TYPE>O</TRANS\_TYPE><USER\_ID>DAVE</USER\_ID><PENDING\_FLAG>P</PENDING\_FLAG><TRANSACTION\_DATE>25-DEC-2000</TRANSACTION\_DATE><TRANS\_DATETIME>25-DEC-2000
10:40:00</TRANS\_DATETIME>

</AMTS\_PENDING\_TRANS>

## Transactional Data

The data for each transaction varies and can change depending on
many factors, such as linked orders.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Running_the_BTS_Import_Utility.md) Running the BTS Import Utility