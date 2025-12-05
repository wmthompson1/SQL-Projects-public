Maintaining Revision Numbering




# Maintaining Revision Numbering

Use Revision Numbering Maintenance in Application
Global Maintenance to control revision-numbering profiles for parts
and other revision-controlled object.

VISUAL offers you three possible numbering profiles: Manual, User
Numbering, and None.

1. Select Admin,
   Application Global Maintenance.
2. Select Maintain,
   Revision Numbering. By default, VISUAL
   supplies a series of four predefined revision stages.
3. Click the Insert
   button to add a new revision stage.
4. Specify this information:

Stage Enter
a name for the revision stage into the Stage field.

Using the predefined stages as an example,
create a stage for each phase of new product development, such as
Design, Manual,
Pilot, and Release.

Profile From
the Profile drop-down list, select a numbering profile for this stage.
Choices include

User Numbering
If you want VISUAL to assign each revision number based on your numbering
preferences, which you can define using the controls in the lower
half of this dialog box, select User Numbering.

If you specified User Numbering as the profile
type, VISUAL activates the fields in the lower half of the dialog
box.

Manual If you want
to manually assign each revision number, select Manual.

None If you dont
want to use a revision-numbering scheme at all, select None.

| IMPORTNT.gif | You cannot change the profile of a revision stage with a history. |

Description
Enter a description for the revision stage into the Description field.

5. If you select the User
   Numbering profile option, specify the revision numbers to use.
   You can manually enter revision numbers or specify basic information
   and generate the revision numbers.

To manually enter revision numbers, click
Insert and specify the revision number to
use. To specify a second number after the first revision number, click
Insert again. To specify a second number
before the first revision number, click Insert
Before.

To generate revision IDs, use the fields
in the Generate Revision IDs section. You can generate number-based
IDs or letter-based IDs. To generate IDs:

Starting Number
To generate number-based IDs, specify the first revision number
to use.

Ending Number
To generate number-based IDs, specify the last revision number.
When you generate the revision IDs, revisions IDs between the starting
number and ending number you specify are created.

Alphanumeric Prefix/Starting
Letters The label for this field changes depending on whether
you are generating number-based revision IDs or letter-based revision
IDs.

If you are generating number-based IDs,
the label for this field is Alphanumeric Prefix. To attach a prefix
to the revision, specify the characters in this field.

If you are generating letter-based IDs,
the label for this field is Starting Letters. Specify the first letter
or letters to use.

Alphanumeric Suffix/Ending
Letter(s) The label for this field changes depending on whether
you are generating number-based revision IDs or letter-based revision
IDs.

If you are generating number-based IDs,
the label for this field is Alphanumeric Suffix. To attach a suffix
to the revision, specify the characters in this field.

If you are generating letter-based IDs,
the label for this field is Ending Letters. Specify the last letter
or letters to use. When you generate the revision IDs, revisions IDs
between the starting letters and ending letters you specify are created.

If you enter more than one letter in the
Starting Letters and Ending Letters fields, the first letter you enter
is treated like a prefix. For example, if you enter AA in the Starting
Letters field and BZ in the Ending Letters field, the IDs AA, AB,
AC, and so on are generated through ID BZ.

Omit Letters
If you are generating letter-based IDs, you can specify letters to
omit from the IDS you generate. Specify the letters to omit. Use a
comma to separate lists of letters.

This field is not available if you are generating
numbers-based IDs.

6. Click Generate.
   The number of revision IDs to be created is displayed. Click Yes
   to generate the IDs. The IDs are inserted in the table. You can
   edit the generated IDs as necessary.
7. Click Save.

If you are using generated IDs, the revision IDs are entered in
order when you create a revision. If you have used all of the generated
revision IDs, you are warned when you try to create a revision.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Application_Global_Maintenance.htm) User-defined Help