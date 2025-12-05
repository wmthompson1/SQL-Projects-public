Sample Macro: Invoke a VB Program




# Sample Macro: Invoke a VB Program

In this sample macro, a VB program that prompts the
user for information to use in a customer order.

If you need a better development environment in which to create
external programs you can use full Visual Basic. You can execute VB
programs by the CreateObject method of VBScript assuming you have
created a VB ActiveX EXE or DLL.

It is very important that you use only Dialog Boxes to interact
with the user. If you use modeless forms you will not be able to get
a response from the user before the script returns to the program,
thus, it will appear that the macro has no affect on the program variables
in Order Entry.

Create a small VB ActiveX program that invokes a dialog box modally
in one of its methods. You can do anything you want on the dialog
since it prevents the method from returning until you close the dialog.
For instance, prompt for some data fields on the order entry form
and perform some unique calculation on the results.

What the VB program does is entirely up to you. You may want to
create a second VB program to act as a test fixture for the class
you develop that runs essentially the code you will give to VBScript
but in a disconnected way.

The example below is being run in the line item context, rather
than the header context in the preceding example.

The code needed to invoke the VB program in VBScript is:

Dim pgm

Set pgm = CreateObject("VBProgram.VBClass")

set some properties in the pgm. You defined these.

pgm.OrderID = ORDER\_ID

pgm.Qty = USER\_ORDER\_QTY

pgm.UnitPrice = UNIT\_PRICE

dialog

pgm.ShowUserTheDialog

get some properties back

USER\_ORDER\_QTY = pgm.Qty

UNIT\_PRICE = pgm.UnitPrice

TRADE\_DISC\_PERCENT = pgm.TradeDiscPercent

. . .

Set pgm = Nothing

Note that VBProgram should be the name of your Project in VB and
VBClass should be the name you assigned to the main class in the Project.

The properties and methods for pgm above should be assumed to be
part of the code written for the VBProgram in question. You are free
to do almost anything you can imagine a VB program can do including
but not limited to connecting to databases, invoking other languages
(as long as forms are modal), calling remote procedures on other computers,
etc.

To cause the calling program, in this case Order Entry, to reload
the current order or the order you have modified in the script, set
the value of ORDER\_ID, or in the case of lines, either ORDER\_ID or
LINE\_NO. In either case, the entire order will be reloaded by the
program on return.