Sample Macro: Set Values of Customizable User Defined Fields




# Sample Macro: Set Values of Customizable User Defined Fields

This sample demonstrates the use of UDFs in the scripts:

'set a udf value

udfString1 = "Macro Sample"

'display a udf value

MsgBox( udfString1 )

'setting line udfs

dim MACROLINES

dim MACROLINE

dim i

Set MACROLINES = LINES.Value

Lcnt = MACROLINES.Count

For i = 0 To (Lcnt - 1)

 Set MACROLINE = MACROLINES(i)

 LineNum = MACROLINE("LINE\_NO")

 MACROLINE("udfStringCol1").VALUE
= "TEST"

 MACROLINE("udfNumberCol1").VALUE
= 99

 MACROLINE("udfBoolCol1").VALUE
= 1

 MACROLINE("udfDateCol1").VALUE
= Now

Next

set MACROLINES = Nothing

Set MACROLINE = Nothing

set i = nothing