Configuring the Infor Support Assistant




# Configuring the Infor Support Assistant

Infor Support Assistant (ISA) gathers information about your operating
environment and your installation of VISUAL via two xml files. These
files provide information so that Infor Xtreme Support can better
assist you. The ISA Manager generates one XML file that lists information
about your server environment. VISUAL generates the other XML file
that lists information about your VISUAL installation, such as the
database patch level.

To install the ISA Manager, see Getting
Started with ISA for ISA 3, which is available on Infor Xtreme
in the Knowledge Base.

To configure the Infor Support Assistant Manager for use with VISUAL:

1. Sign in to the VISUAL
   database for which you want to collect data.
2. Select Admin
   > ISA Configuration.
3. Specify this information:

ISA Hot Folder directory
Specify the path for the ISA Hot Folder directory that you created
when you installed the ISA Manager. When the ISA data file is generated
for VISUAL, it is stored in this directory.

Collect data on First
Sign-in of Day Select this check box to automatically generate
the data file when the first user of the day signs into VISUAL. Clear
this check box if you do not want to automatically generate the data
file.

4. Click Ok.

To generate the data file manually, click Send
Now. Use this function if you do not automatically generate
the file daily or if you want to generate a new version of the file.