Specifying Site-specific PLM Access Information in Site Maintenance




# Specifying Site-specific PLM Access Information in Site Maintenance

Use Site Maintenance to specify whether to use the
[default
PLM access information specified in Application Global Maintenance](Specifying_Default_PLM_Access_Information_in_Application_Global_Maintenance.md)
or to override the default information. The information you specify
for a site in Site Maintenance determines how you access PLM when
you are viewing a part in that site.

To specify site information:

1. Select Admin,
   Site Maintenance.
2. In the Site ID field,
   specify the site to set up.
3. Click the Defaults
   tab.
4. In the PLM Integration
   section, specify this information:

Login URL If
this site uses a unique URL to access PLM, specify the external launch
URL for Web PLM in this field. If this site uses the default URL specified
in Application Global Maintenance, leave this field blank.

Enable Specify
whether you can directly access PLM from Part Maintenance when viewing
a part for this site. Specify one of these options:

Default Specify
Default to use the enable setting specified in Application Global
Maintenance. If you specify Default and the Enable check box is selected
in Application Global Maintenance, then you can access PLM from Part
Maintenance when viewing parts for this site. If you specified a URL
in Site Maintenance, then that URL is used to access PLM. If you left
the Login URL in Site Maintenance blank, then the URL specified in
Application Global Maintenance is used to access PLM. If you specify
Default and the Enable check box is cleared in Application Global
Maintenance, then you cannot access PLM when viewing parts for this
site, regardless if you have specified a URL in either Site Maintenance
or Application Global Maintenance.

No Specify No if you cannot access PLM in Part Maintenance
when viewing parts for this site. If you specify this option, you
cannot access PLM when viewing parts for this site even if you specify
a Login URL in Site Maintenance or Application Global Maintenance.

Yes Specify Yes if you can access PLM in Part Maintenance
when viewing parts for this site. If you specify this option and you
specify a login URL in Site Maintenance, then the URL you specify
in Site Maintenance is used to access PLM. If you specify this option
and you leave the Login URL field blank in Site Maintenance, then
the login URL specified in Application Global Maintenance is used
to access PLM.

5. Click Save.