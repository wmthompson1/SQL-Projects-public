Rate-based Parts and Minimum Move Quantities




# Rate-based Parts and Minimum Move Quantities

If you specify a minimum move quantity on an operation
that uses a rate-based part as a material requirement, the minimum
move quantity determines when the current operation can begin and
when the subsequent operation can begin.

For example, presume that you have a work order with two operations:
operation 10 and operation 20. Operation 10 uses a rate-based part
as a material requirement. If you specify 3 as the minimum move quantity
on operation 10, operation 10 is scheduled to begin when 3 units of
the rate-based material requirement are available. In addition, operation
20 is scheduled to begin when operation 10 produces 3 units.