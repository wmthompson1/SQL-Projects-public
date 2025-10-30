select *
from part_site ps
left outer join cycle_count_part ccp
on ccp.part_id = ps.part_id
where ccp.part_id is null

select * from cycle_count_part 

SELECT  p.abc_code, c.part_id, c.warehouse_id, c.count_freq, c.last_count_date  FROM CYCLE_COUNT_PART C, part p where  p.id = c.part_id


What Are The Steps Necessary To Set Up And Perform Cycle Counts?

Visual Enterprise

Physical Inventory Count

VMPHYINV

Initialize Physical Count

Print Tags

Print Tag Lists

Enter Counts

Enter Recounts

Print Tag Comparison

Print Part Comparison

End Physical Count

Part Maintenance

VMPRTMNT

ABC Analysis

Cycle Count Setup For All Parts


Resolution:
1. Parts must be set up correctly in Part Maintenance with warehouses and costs.

2. Using ABC Analysis, within Part Maintenance, assign ABC Codes to the parts and select the parameters to use to Cycle Count; i.e., Projected, Forecast, Usage, Actual, or Planned Usage.

3. Using Cycle Count Setup For All Parts, within Part Maintenance, assign the frequency with which to count your parts.
The frequency field is how often you want the count performed. 30 would mean that every 30th day the same part id would come up for count. The most important thing to get the cycle count to generate is to enter a last count date. This is what Visual uses to determine how long a period has passed between counts. When you initialize the count for the first time on a particular ABC code, all parts listed with that code will appear for counting. Count the number of part id's you want, leave the others alone. When you end the count the counted parts will have the last count date updated to that day's date. So when 30 days have passed when you initialize the count for that code again only those parts with a last count date 30 days ago will appear to be counted. The next day when you initialize the count all parts will appear again minus the ones counted the day before.
You must go through all parts in the count before the last count date is updated with a new count and after that you will not see the entire list come up for count again  Data is stored in cycle_count_part.

4. You are now ready to launch Cycle Counts, using Physical Inventory Count program. Below is a summary of how to use the Physical Inventory Count program.  Use Physical Inventory Count to manage the process of periodic counts of inventoried parts and resulting reconciliations.  Physical Inventory Count provides the following functions:

· Printing of tags and reports to assist in the counting process -
· Entry of actual counts and recounts
· Analysis of discrepancies by quantity and/or value thresholds
· Automatic creation of adjustment transactions to update on-hand balances
 

A VISUAL Physical Inventory Count involves the following steps:
A. Start the count by creating database tags. - Initialize Physical Count program
This process creates a database entry for each part in each location for a specified warehouse. These entries track the counts and recounts performed during the inventory process.

B. Print tags or tag reports - Print Tags/Print Tag Lists program.
You can manage your counts using individual tags, or a checklist-like report. VISUAL prints each tag or report with all information required, and blanks for count and recount.  It is not necessary to print  your tags.

C. Perform physical count and fill in printed tags or reports - Parts are counted, and recounted if necessary, and recorded on the tags or report lists. - Employees are counting the parts in your manufacturing facility.

D. Enter counts and recounts. - Enter Counts/Enter Recounts program

Enter finished counts in the Count and Recount dialog boxes. A count review dialog box allows final entries and adjustments.

E. Analyze results of counts - Print Tag Comparison/Print Part Comparison program

You can print comparison reports by part or by individual tags. A convenient threshold feature lets you search for discrepancies by quantity or value.

F. Close physical count and perform adjustments - End Physical Count program

When you end a physical count, you can choose to generate inventory adjustments to bring on-hand balances in line with physical counts. You can also choose to permanently save the results of the count.
You can also choose not to update the on-hand balances based on the count.

Note:
When performing a cycle count, until you actually update the cycle count, the part is not considered counted.  No count date is posted against the part.