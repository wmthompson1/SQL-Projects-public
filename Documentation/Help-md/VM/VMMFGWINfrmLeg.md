Adding Legs




# Adding Legs

Adding a leg is similar in many respects to adding
a standard material requirement. The same window is used for both
functions. Legs are always associated with operations, just as material
requirements are.

1. Select the operation
   to which you want to add the leg. You can also select any other
   existing material requirement on the same operation.
2. Select Add
   Leg/Detail from the Edit menu. You can also press the CTRL+L
   keys.

The New Leg window appears.

Notice the two radio buttons Material
and Leg/Detail. The Leg/Detail button is
selected. You should leave this selection as is if you choose Material,
you will create a material requirement instead of a leg.

3. Adjust Piece Number,
   if necessary.

Legs also have a piece number. You can manipulate
this identifier in the same way as for a material requirement.

4. Adjust the Sub ID, if
   necessary.

Sub ID identifies a leg uniquely within
a master/work order. VISUAL automatically assigns this ID, and the
main leg is always 0. You can change this ID if you want, but you
must not use an existing Sub ID. It is best to allow VISUAL to assign
this number.

5. Specify a Part ID for
   a leg.

This indicates that the assembly corresponds
to a part that is also a separate inventory part. However, you must
still enter the engineering structure here, and you must maintain
any separate structure independently.

This field is not required.

6. Specify the following
   Quantity Information: Quantity Per, Fixed Qty, Scrap %, Qty Per
   Start or End, Dimensions, Reference # and Usage U/M.

Specify all of this information in the exact
same way as for materials. You are indicating the amount of the fabricated
assembly needed, rather than an inventory part.

7. Click the Specifications
   tab and enter specifications and engineering information for the
   following fields:

Specifications
- Enter any material/leg specifications here.

Drawing Number
- If there is an engineering drawing associated with the leg, enter
the drawing number here.

Rev - Enter any
revision number for an engineering drawing here.

Effective Date/Discontinue
Date - These are the same as for material requirements. You
can also select Effective Date and Discontinue Date from the VISUAL
Calendar.

8. Click the Engineering
   tab to designate this master as [eligible
   for updating](Designating_Legs_and_Engineering_Masters_as_Eligible_for_Updating.htm) with the Master Updater function. This tab also
   displays [information
   about when the master was last updated](Viewing_Update_Information.htm). This tab is available
   on Engineering masters and Legs only.
9. Click the Save
   button to save the new information.

VISUAL creates the leg and adds it to the
structure. You can now add an operation to this leg, and add additional
operations, material requirements, and other legs.

After clicking on the Save
button, the Leg/Detail window clears. It is now ready to add another
leg to the same operation.

|  |  |
| --- | --- |
| POSTIT.gif | Cost overrides do not apply to legs. Costs from legs come from the operations and materials you specify on the leg. |

|  |  |
| --- | --- |
| POSTIT.gif | If you want to quickly add a leg with minimal details, clear the Leg Edit Form option on the Views menu.  When you add a leg, a list of parts appears, select the part you want to use for the leg.  VISUAL creates a leg using the information from the part record.  If you have opened the Leg child window, you can use the Show/Hide Edit Leg Detail Form toolbar button to hide or show the Leg window. |

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Manufacturing_Window.htm) User-defined Help