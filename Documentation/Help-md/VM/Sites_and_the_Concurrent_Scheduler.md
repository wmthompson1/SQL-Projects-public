Sites and the Concurrent Scheduler




# Sites and the Concurrent Scheduler

These conditions apply when you run the concurrent
scheduler in sites:

* Within
  a site, you can run the concurrent scheduler for one schedule at a
  time. If a user attempts to run the scheduler in a site where the
  scheduler is already running, a message is displayed. The message
  shows who is currently running the scheduler in the site and when
  the scheduling process began. For example, if you are running the
  concurrent scheduler for your production schedule in Site A, a second
  VISUAL user cannot run the concurrent scheduler for your what if
  schedule in Site A or try to schedule a work order for Site A from
  the Manufacturing Window. Similarly, users cannot run the scheduler
  in a site if the scheduling service is already running the scheduler
  for the same site.
* The concurrent
  scheduler can be run simultaneously in different sites. For example,
  if you are running the concurrent scheduler for Site A, a second user
  can run the scheduler for Site B at the same time.
* If you
  are licensed to use a single site, then the scheduler can be run for
  one schedule at a time.