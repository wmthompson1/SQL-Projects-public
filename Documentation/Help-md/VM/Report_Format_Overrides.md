Report Format Overrides




# Report Format Overrides

Only the SYSADM user can specify report format file
overrides.

Reports are made up of two parts: the report format and the report
data. The report format is determined by a QRP file. Over 700 QRP
files are provided in a typical installation of VISUAL. The report
data are determined by the programs used to generate reports.

You can customize any QRP in these ways:

* Choose which data inputs
  are displayed on the report
* Define the layout, including
  margins, fonts, and pagination
* Add a company logo and other
  static information
* Use formulas to combine
  data inputs into new pieces of information
* Write queries to extract
  information from the database.

To customize QRPs, use a reporting tool that can read the QRP format,
such as Unify Report Builder. Refer to your reporting tool documentation
for complete information on how to use the tool.

When you customize a QRP, you can choose to overwrite the original
QRP. If you overwrite a QRP, make a copy of your customized QRP and
store it in a safe location before you install any VISUAL updates.
Your customized QRP may be overwritten by the update.

You can also set up report format overrides. Rather than changing
the standard files, you specify that an override should be used in
place of the standard file. This makes the process much easier to
manage; when additional software upgrades are performed, your customized
forms will not be over-written. You can also choose to create a report
format override for a single user, a particular site, or a particular
entity.