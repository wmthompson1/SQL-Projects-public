Generating the Common Materials Report




# Generating the Common Materials Report

Use the common materials report to identify materials used as requirements
in more than one released order.

If you are licensed to use multiple sites, you can run this report
on a site-by-site basis. The site used for the report is the site
associated with the schedule you select before you access the report
dialog box.

To generate the report:

1. Perform one of these
   steps.

* In the DBR
  Scheduler window, select the schedule to use. Then, select File, Print Common Materials
  Report.
* In the Buffer
  Management window, select the site to use. Then, select File, Print Common Materials
  Report.
* In the DBR
  Dashboard, select the site to use. Then, select File,
  Print Common Materials Report.

2. Select the information
   for the report. Specify this information:

Starting Part ID
Specify the first part alphanumerically to view in the report.

Ending Part ID
Specify the last part alphanumerically to view in the report.

3. To view a single part
   in the report, specify the same ID in both the Starting Part ID
   and Ending Part ID field. To view all parts, leave both fields
   blank.
4. Specify how to sort
   the information in the report. The part is first sorted by Part
   ID. Specify the secondary sort order for the report. Select Work
   Order ID to sort the report by work order. Select Do Not Use Before
   Date to sort the report by the do not use before date. The do
   not use before date is calculated differently depending on the
   buffer the common part feeds. These calculations are used:

CCR buffer 
If the part feeds the CCR buffer, then the do not use before time
is the CCR schedule minus the CCR buffer, which is equal to the release
date.

Shipping buffer after
a CCR operation  If the part feeds the shipping buffer
after the CCR, then the do not use before time is the starting time
of the CCR schedule or the due date minus the shipping buffer, which
ever time is later.

Assembly buffer 
If the part feeds the assembly buffer, then the do not use before
time is equal to the release date, calculated as the due date minus
the shipping buffer minus the assembly buffer.

Free W/O 
If the work order is a free work order, then the time is the due date
minus the shipping buffer.

5. Specify how to output
   the report. Specify one of these options:

Print Specify
this option to send the report to a printer.

View Specify
this option to view the report in the report viewer.

File Specify
this option to save the report as a file.

E-mail Specify
this option to generate the report and e-mail it. Select the PDF check
box to e-mail the report as a PDF. Clear the PDF check box to e-mail
the report as a comma-separated file.

6. Click Ok
   to generate the report.