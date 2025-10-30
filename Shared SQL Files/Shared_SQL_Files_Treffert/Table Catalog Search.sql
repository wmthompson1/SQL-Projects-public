select CAST(content AS VARCHAR(MAX)) Content_Binary 
	, * 
from catalog
where CAST(content AS VARCHAR(MAX)) like '%customer_reps%'

--select * from catalog