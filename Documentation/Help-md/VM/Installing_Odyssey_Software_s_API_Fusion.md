Installing Odyssey Software's API Fusion




# Installing Odyssey Software's API Fusion

For Odyssey Softwares (www.odysseysoftware.com) API-Fusion,
you will want to download apifnsetup.exe
at

[http://www.odysseysoftware.com/products\_apifusion.aspl](http://www.odysseysoftware.com/download.htm).

You will need the following demo keys to unlock the ComServer /
ODBC Agent temporarily. The keys last 3 months and it takes a week
to get new keys after they run out. This prevents anyone from trying
to use the demo keys in a production environment.

1QR0-1QQW-GW3B-NX6G-BARE-Y2AE -> CommunicationsServer

GC44-1R91-S01P-FFM8-499X-T2BE -> OdbcAgent

Install API-Fusion on an NT workstation or NT Server which has an
ODBC link to Infor VISUAL Database depending on how you want to test.
There is virtually no difference, except you can assemble a complete
testing setup on an NT workstation, whereas with NT server you will
need a client to verify with.

1. In Start,
   Programs, API Fusion,
   Configuration, Communications
   Server, configure the keys as provided by Odyssey Software.
2. In Start,
   Programs, API Fusion,
   Configuration, ODBC
   Agent, configure the keys as provided by Odyssey Software.
3. In Start,
   Settings, Control
   Panel, 32Bit ODBC, add an ODBC
   DSN through the 32bit ODBC setup for a connection to your VISUAL
   Database. This will vary and is dependent on your database brand
   (SQLBase, Oracle, SQL Server, DB2, etc) and type of ODBC connection.
4. 4. In Start,
   Programs, API-Fusion,
   Configuration, ODBC
   Agent, add an ODBC alias, the alias will need to be directed
   to the Infor VISUAL Database that you defined in the 32Bit ODBC
   Control Panel setup.
5. Once you have these
   installed, execute the ComServer and ODBC Agent services in Debug
   mode. This allows you to check the progress of each transaction
   as it is executed. (In a standard customer installation you will
   add these as NT services on automatic start.)
6. Finally, open a DOS
   command window on any PC on the same LAN as the API-Fusion server/workstation
   and execute the following programs in this order:

afnb.exe (..\Program Files\APIfusion\Clients\afnb.exe)
(or aftcp.exe\*)

amtsbi.exe (..(vdev)zip\amtsbi.zip)

afnb.exe /u (unloads afnb.exe and frees
up the protocol connection)

At this point you can follow the prompts
for amtsbi.exe and scan or type information into the DOS
command window. You must realize that every prompt has to be
validated, so incomplete or invalid data will not be allowed.

![btn_mini.gif](btn_mini.gif "btn_mini.gif") Odyssey
Softwares API Fusion User Defined Information