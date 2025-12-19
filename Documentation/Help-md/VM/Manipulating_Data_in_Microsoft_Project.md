Manipulating Data in Microsoft Project




# Manipulating Data in Microsoft Project

The main reason for using Microsoft Projectrather
than Infor VISUAL to schedule your projects is if you have structured
your projects such that tasks from different WBS's are interrelated,
Microsoft Project allows you to link tasks across multiple WBS's.
In addition to linking your tasks, you can also manipulate other task
related information. For example:

* Change the Calendar Duration
  in the Duration Column
* Change the allocation of
  a Cost Category [Resource] to a task
* Add or delete Cost Categories
  [Resource] as long as the Cost Category [Resource] is on the Resource
  Sheet.

You must also make sure that any Cost Category added also has a
valid Department ID [Group] associated with it on the Resource Sheet.

You should not do any of the following:

* Add or
  delete a task to the WBS You must do this in Infor VISUAL.
  Performing this operation in Microsoft Project will result in
  the following error message when you transfer data back to Infor
  VISUAL, "The number of tasks Imported from Microsoft Project
  is unequal to the number of tasks from Visual Manufacturing. Unable
  to save data from Microsoft Project."
* Add a
  new Cost Category You must do this in Infor VISUAL. Performing
  this operation in Microsoft Project will result in the following
  error message when you transfer data back to Infor VISUAL, "Cost
  Category XXXX not found in Visual Manufacturing. Unable to save
  the data from Microsoft Project."

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Project_Summary.md) User-defined Help