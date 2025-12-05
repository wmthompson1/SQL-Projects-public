Sites and the DBR Scheduler




# Sites and the DBR Scheduler

These conditions apply when you run the DBR scheduler
in sites:

* Within a site, you can run
  the DBR scheduler for one schedule at a time. If a user attempts
  to run the scheduler in a site where the scheduler is already
  running, a message is displayed. The message shows who is currently
  running the scheduler in the site and when the scheduling process
  began. For example, if you are running the DBR scheduler for your
  production schedule in Site A, a second VISUAL user cannot run
  the DBR scheduler for your what if schedule in Site A. Similarly,
  users cannot run the scheduler in a site if the scheduling service
  is already running the scheduler for the same site.
* The DBR scheduler can be
  run simultaneously in different sites. For example, if you are
  running the DBR scheduler for Site A, a second user can run the
  scheduler for Site B at the same time.
* If you are licensed to use
  a single site, then the scheduler can be run for one schedule
  at a time.