Setting Up Scheduling Preferences




# Setting Up Scheduling Preferences

If you are licensed to use multiple sites, the SYSADM user can set
up scheduling preferences at the tenant level, for each site, and
for each schedule.

You can also set up [schedule
preferences](Setting_Concurrent_Scheduler_Preferences.md) in the Concurrent Scheduler window.

To set up scheduling preferences:

1. Select Admin,
   Preferences Maintenance.
2. Click the User ID arrow
   and select one of these options:

SYSADM~ Select
this option to specify tenant-level scheduler settings. Ensure that
you select the SYSADM~, not SYSADM. If you create a new site, the
settings you specify for the tenant level are applied to schedules
in the new site.

SYSADM~[Site ID]
Select this option to specify site-level scheduler settings. [Site
ID] is replaced with the ID of your site. If you create a new schedule
for the site, the settings you specify for the site are applied to
the schedule.

SYSADM~[Schedule ID]
Select this option to specify schedule-specific settings.

3. Click the Insert
   button.
4. In the Section column,
   specify Scheduler.
5. Click the Entry
   browse button and select the preference to set up.
6. In the Value column,
   specify the appropriate preference value.
7. Click Save.