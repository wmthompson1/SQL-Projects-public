Calculating Standard Unit Hours




# Calculating Standard Unit Hours

Use the Implode Hours dialog box to calculate these values for fabricated
parts:

* Setup
  Standard Hours The total number of setup hours per unit
  based on the operations in the default engineering master specified
  for the part in Part Maintenance.
* Run Standard
  Hours The total number of run hours per unit based on
  the operations in the default engineering master specified for
  the part in Part Maintenance.
* Multi-level
  Setup Standard Hours The total number of setup hours
  per unit based on the operations on all engineering masters that
  comprise the part. If material requirements in the default engineering
  master are also fabricated parts, then the setup hours on the
  engineering masters for the material requirements and the setup
  hours on the default engineering master are included in the multi-level
  setup calculation. Engineering masters for material requirements
  are examined until only purchased material requirements are found.

For example, PARENT PART has a fabricated
material requirement called PART A, PART A has a fabricated material
requirement called PART B, and PART B has a purchased material requirement
for PART C, then the setup time for the PARENT PART, PART A, and PART
B is added to determine the multi-level setup standard hours.

* Multi-level
  Run Standard Hours The total number of run hours per
  unit based on the operations on all engineering masters that comprise
  the part. If material requirements in the default engineering
  master are also fabricated parts, then the run hours on the engineering
  masters for the material requirements and the run hours on the
  default engineering master are included in the multi-level run
  calculation. Engineering masters for material requirements are
  examined until only purchased material requirements are found.

For example, PARENT PART has a fabricated
material requirement called PART A, PART A has a fabricated material
requirement called PART B, and PART B has a purchased material requirement
for PART C, then the run time for the PARENT PART, PART A, and PART
B is added to determine the multi-level run standard hours.

System administrators can control access to the Calculating Standard
Unit Hours dialog.

To calculate standard hours:

1. Select Inventory,
   Part Maintenance.
2. If you are licensed
   to use multiple sites, click the Site ID
   arrow and select the site where you are imploding hours. If you
   are licensed to use a single site, this field is unavailable.
3. Optionally, click the
   Part ID browse button and select the part.
4. Select Maintain,
   Implode Hours.
5. Select the parts to
   implode

Current Part only
Click this option to implode hours only for the current part in
the Part Maintenance window.

Selected Parts
When you click this option, the Selected Parts
browse button becomes active. Click this button to select fabricated
parts from a table. You can select a single part or multiple parts.
If you are licensed to use multiple sites, only the parts found in
the site you selected in the Part Maintenance window are displayed.

All top-level parts
Click this option to implode hours for all parts that have a value
in the Eng Master Eng ID field in Part Maintenance. If you are licensed
to use multiple sites, only the top-level parts in the site you selected
in the Part Maintenance window are imploded.

6. Click OK.
7. You are notified that
   quantities on engineering masters will be recalculated. Click
   Yes to continue.

Hours for the selected parts are imploded.