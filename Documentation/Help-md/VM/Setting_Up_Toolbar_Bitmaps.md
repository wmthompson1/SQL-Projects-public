Setting Up Toolbar Bitmaps




# Setting Up Toolbar Bitmaps

Toolbar buttons have three modes: the active mode, the inactive
mode, and the hover mode. To display properly, your bitmap must meet
these conditions:

* Overall, the image must
  have a width of 22 pixels and a height of 69 pixels.
* The image must be divided
  into three 22-by-22 pixel images. Each image must be followed
  by a 1-pixel line to separate the image. This 1-pixel line is
  not displayed in the interface. The 1-pixel line can be any color
  of your choosing.
* The first 22-by-22 pixel
  image must be used for the active mode.
* The second 22-by-22 pixel
  image must be used for the inactive mode.
* The third 22-by-22 pixel
  image must be used for the hover mode.

This example shows the three modes separated by the divider line.
Note that the example is magnified to show detail. It is not shown
at its actual size.

![](Graphics/User%20Toolbar%20-%20custom%20bmp.png)

You can use an existing VISUAL toolbar bitmap as a guide, such as
TBUSRINF.BMP. These images are stored in the same directory as your
VISUAL executables. Make sure you make a copy of the bitmap. Do not
overwrite the bitmap.

VISUAL tool bar buttons use these colors as the background colors:

Active Mode Hex code: #EFEFEF; RGB:
239, 239, 239

Inactive Mode Hex code: #EFEFEF; RGB:
239, 239, 239

Hover Mode Hex code: #DFDFDF; RGB: 223,
223, 223

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_Toolbars.htm)
User Toolbars

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Displaying_User_Toolbars.htm)
Activating the User Toolbar Function

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Using_Toolbar_Buttons_to_Pass_Information_to_Custom_Applications.htm) Using Toolbar Buttons to Pass Information
to Custom Executables

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Setting_Up_User_Toolbars.htm)
Setting Up User Toolbars

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Concepts_Common_Features.htm) User-defined Help