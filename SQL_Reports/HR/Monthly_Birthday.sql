Select
E.[Birth Date]
,E.[Location Code]
,E.[Preferred Name]
,E.[First Name]
,E.[Last Name]
,E.[Position Status]
,Max(L.[In Date]) as 'Last Day Worked'
,E.[File Number]

From ADP_Emp E
Left Outer JOin ADP_Labor L
on E.[File Number] = L.[File Number]

Where
E.[Position Status] in ('Active', 'Leave')
and Month(E.[Birth Date]) = Month(Getdate())

Group by
E.[Birth Date]
,E.[Location Code]
,E.[Preferred Name]
,E.[First Name]
,E.[Last Name]
,E.[Position Status]
,E.[File Number]
