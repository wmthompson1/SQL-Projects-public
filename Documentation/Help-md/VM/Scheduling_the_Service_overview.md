Scheduling the Service




# Scheduling the Service

After the service is installed, schedule the times when the service
is run. This table shows where to schedule the services, who can schedule
the service, and how often the services can be run:

|  |  |  |  |
| --- | --- | --- | --- |
| **Service EXE** | **Where do I schedule this service?** | **Who can schedule this service?** | **How many times per day can I run this service?** |
| VRDTASVC.EXE | Application Global Maintenance. Select **Maintain**, **Visual Reporting Data.** | SYSADM user only | Six. You can also set up this service to continually check for updates based on the polling interval. |
| VMSCHSVC.EXE | Concurrent Scheduler. Select **File**, **Set as Scheduled**. | Any user can schedule the service. One service schedule can be created for each of the sites schedules. | Six times per schedule. |
| VRPTSVC.EXE | Work Order Traveller Window. Select **File**, **Save as Scheduled.** | Any user. Each user can set up one schedule per allowable site. | Six times per user schedule. |
| VMCSTSVC.EXE | Costing Utilities. Select **File**, **Costing Service Schedule**. | Any user can schedule the service. One service schedule can be created for each of site. | Six for inventory transaction costing, and six for journal preparation. You can set up a different schedule for inventory transactions and journal preparation. |
| VMMRPSVC.EXE | Material Planning Window Select **File**, **Set Material Requirements Planning Service Schedule**. | Any user can schedule the service. One service schedule can be created for each of site. | Six times per user schedule. |