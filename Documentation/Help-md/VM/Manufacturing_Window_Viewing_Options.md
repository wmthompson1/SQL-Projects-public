Manufacturing Window Viewing Options




# Manufacturing Window Viewing Options

The Manufacturing Window offers a number of different
viewing modes and options. In all cases, the same internal database
information is displayed the viewing modes give you a variety of
tools for viewing and editing the information. These options are discussed
first so you can select and use the ones you want while building and
editing masters and work orders.

## Selecting Views

There are three fundamental viewing modes for Manufacturing Window
graphical, textual, and grid. Graphical and textual views are described
in this topic. Refer to [Using the
Grid View](Using_the_Grid_View.htm) for more information on the grid.

## Selecting Graphical View

In the graphical view, each object (header, operation, material,
leg) is represented by a rectangular "index card." The card
shows some basic information about the object and its relation to
the other objects, and is used to select and edit all of the objects
contents. The cards sit on a scrollable viewing area, which is always
large enough to hold all the cards. Depending upon your size preference
settings and the size of the master/work order, you may need to use
the scroll bars to access all of the cards. Different colors highlight
the different types of objects. See [Setting
Color Preferences](#setting_color_preferences) for details.

### Setting Graphical View Options

You can specify how to display the various objects in the Graphical
view. To specify settings:

1. Select Options,
   Graphical Display Options.
2. Select from the following
   options:

Top Down Select
this option to position the header card of the master at the top left
of the window. All other legs flow beneath the header card. Clear
this option to position the header card at the bottom left of the
window. All other legs flow above the header card.

Header Cards behind Other
Cards Select this option if you would like the header or
leg card to be under the operation and material requirements information.
If you select this option, most of the information that is displayed
on the header or leg card is hidden behind the operations and material
requirements. Clear this option if you would like the header or leg
card to be on top of the operation and material requirements information.
If you select this option, the information displayed on the header
or leg index card is visible.

3. Click Ok.

## Selecting Text View

The text-viewing mode provides a more traditional view of the work
order/master. Each object is shown as a single line of text, displaying
some basic information about the object.

To select the one-window text mode, select Text
Display Mode (1 Window) from the View
menu.

The header is always the first line of the display. Operations appear
indented beneath the header. Material requirements appear indented
beneath their operations. Note that this is different from graphical
display. Materials in the text mode are do not appear feeding into
their operations, but are instead indented below them.

Legs are also shown indented beneath their operations. Legs are
indented one more character position than material requirements. The
operations for legs are directly beneath the legs, and their materials
are indented beneath them. This presents a traditional indented bill
of materials.

## Selecting Two-Window Views

Both graphical and text modes provide an alternate two-window display.
Header, operations, and legs are shown in one window in their normal
graphical or text display. A separate window is provided for materials.
This is convenient for working with a large number of material requirements
on a single operation. The separate display lets you better manage
the materials. More operations can be viewed in a single window, because
material requirements only take up screen space for one operation
at a time.

### Selecting Two Window Graphical View

In two-window graphical mode, the screen is split into a top and
bottom portion. The graphical display shows in the lower section,
and materials for the selected operation in the upper section. Only
the material requirements for a single operation display at any one
time. You must select the operation to view the materials.

To select the two-window graphical mode:

1. Select Graphic
   Display (2 Window) from the View
   menu.

A dialog box appears, telling you that you
need to refresh the display before you can switch to this mode.

2. Click Yes
   to continue.

VISUAL switches to the two window graphical
mode.

## Selecting Two Window Text View

In two-window text mode, the screen is split into a left and right
portion. The normal text display of header, legs, and operations shows
in the left portion. Materials for the selected operation show in
the right section. Again, you must select the operation to view the
materials.

To select the two-window text mode, select Text
Display Mode (2 Window) from the View
menu.

To select a material in two-window mode, click the material line.
The selected line becomes highlighted. An arrow does not show the
selected material. The materials appear in the right screen if existing
for that operation.

## Selecting Objects

### Selecting Objects in Graphical Viewing Mode

To select any object, click the box. A left-pointing arrow is shown
to the right of the selected box, indicating that it is the current
object.

You can also use all four cursor keys to navigate the structure.
Use up and down keys to move back and forth between operations and
material requirements in a leg. Use left and right keys to move between
legs.

#### Graphical view: card layout details

- Each object (header, operation, material, leg) is represented by an index-card showing key fields such as ID, Quantity, and Status.
- Cards are color-coded by object type; configure colors under Options → Color Preferences.
- Card stacking and overlap are controlled by Size Preferences and the Top Down / Header Cards behind Other Cards settings.
- Navigation: click a card to select, use arrow keys to move, double-click to open the detail dialog; use the context menu for quick actions (Insert, Delete, Copy From).

#### Two-window material panel behavior

- In two-window modes the material pane displays only materials for the currently-selected operation, allowing focused edits.
- Selecting a different operation refreshes the material pane; edits made in the pane affect that operation's material requirements directly.
- Use the material pane to adjust quantities, costs, vendor info, and to add non-inventory specification lines when needed.

### Selecting Objects in Text Viewing Mode

To select any object, click its line. A right-pointing arrow is
shown to the left of the selected line, indicating that it is the
current object. You can also use the up and down, left and right cursor
keys to move around the structure.

## Setting Size Preferences

Size preferences allow you to choose font, font size, attributes,
and graphical card display characteristics for the Manufacturing Window.
You can define six separate size preferences that you can change at
will. You might, for example, set one preference that is useful for
viewing details of objects, and another that displays a maximum number
of objects in the viewing space. You will find that the combination
of preferences allows you to setup an amazingly large number of different
display styles.

To set size preferences:

1. Select Size
   Preference from the Options menu.

The Font and Size Preference dialog box
appears.

2. Select the radio button
   for the preference you wish to modify.
3. Set any of the following
   font and size parameters:

Font - You can
display all text in the Manufacturing Window in any font that is installed
on your PC. Select the desired font from the list.

Font Size - You
can select the size of the font. For True Type fonts, you can select
any size desired. For non-true type fonts, you must select from the
list of sizes offered for the font.

Enhancement -
You can display the selected font in normal or bold style.

Lines of Text
- Choose the number of lines you wish to be visible in graphical mode,
or the number of columns of information to display in text mode. This
controls how much the cards overlap vertically.

Width - Specify
the width of a card in graphical mode, in terms of the number of characters
shown in the selected font and size.

Height - Specify
the height of a card in graphical mode, in terms of the number of
characters shown in the selected font and size.

Offset - Specify
the horizontal distance between edges of successive cards, in terms
of the number of characters shown in the selected font and size.

4. If you want, click the
   Save as Default Sizes check box to indicate
   that you want to save these settings as the permanent defaults
   for this workstation.
5. Click Ok
   to complete the operation, or Cancel to abort the changes.

The display automatically shifts to the
last size preference you selected. If you selected Save
as Defaults, your changes are permanently saved. Otherwise,
any changes you made are only in effect for this use of the Manufacturing
Window.

## Using Size Preferences

To select from the current size preferences:

Select from Size Preference 1 through
Size Preference 6 options in the View
menu.

You can also press Shift and the function key corresponding to the
size. For example, press Shift-F2 to use size preference 2.

## Setting Color Preferences

You can set individual colors for each of the six classes of objects
shown on the manufacturing window. Unlike Size preferences, there
is only one current set of colors.

1. Select Color
   Preferences from the Options
   menu.

The Color Preferences dialog box appears.

You can set the colors for any of the following
classes of objects:

Engineering Master/Work
Order This sets the color for the header line or card. The
default color for the header is white.

Engineering Leg
This sets the color for the leg/detail line or card. The default
color for legs is gray.

Internal Operation
Operations for which the Resource ID is for a workcenter or individual/group
resource. The default color for internal operations is light blue.

Sub-Contracted Operation
Operations for which the Resource ID is for a subcontractor resource.
The default color for subcontracted operations is light blue.

Material Material
requirements with no part ID.

Fabricated Material
Material requirements where the required part is a fabricated part.

Purchased Material
Material requirements where the required part is a purchased part.

Fab and Purc Material
Material requirements where the required part is both fabricated
and purchased.

Alternate Part
All alternate parts. You can use alternate parts when the required
material is unavailable.

Tool/Fixture/Consumable
Part Maintenance allows you to specify a Part ID as a Tool/Fixture/Consumable.
You can create requirements for these materials in the same way that
you make normal inventory requirements. This option allows you to
display the requirement for the Tool/Fixture/Consumable in a different
color. The default color for these requirements is light green.

Borders/Lines
The color of the border lines of the cards appearing in the window.

In-process Borders
The color of the border lines used on operations that have currently
active labor tickets. If the operation is the determinant operation,
then a thick border line is used. If the operation is not the determinant
operation, then a thin border line is used. This border is used in
the graphical display only.

Exception Fade Factor
If you set up and show exceptions, only cards with exceptions are
displayed in the colors you specify. Cards without exceptions are
displayed in a faded color. The faded color is made by combining the
color you specify for the object with the primary background color
you specify. Specify a value to indicate how much of the primary background
to use in the faded color. The default value is 3. The larger the
number you specify, the more of the background color is used to fade
the color.

2. Click the Change
   button next to the object.

The Color dialog box appears. This dialog
box gives you the ability to select any color that you can specify
on the system.

3. Click one of the Basic
   or Custom color boxes.

You can also choose a custom color by dragging
the cross hair around the large box until you find the color you want.
You can also use the slider at the left to control the luminosity
(brightness) of the color. The top of the range corresponds to white,
and the bottom to black. These automatically set Hue/Saturation/Luminosity
or Red/Green/Blue values. You can also enter these directly. The best
thing to do is move the crosshair and the slider around until you
find a color you like.

To add the color to the permanent list of
custom colors, select the box for the color you wish to replace, and
press Add to Custom Colors. To use this color without adding it to
the custom colors, just press OK.

4. Click the Ok
   button to change the color. You can also double click the color
   box.

Click the Cancel
button to close the Color dialog box without making color changes
for this object.

You return to the Color Preferences dialog
box.

5. In the Background section,
   select how you want the window background to appear. You can select
   what you want the Primary color to be
   and if you want the background to fade to another color, you can
   select what you want that to be by selecting the Fade
   To color. If you selected to use a Fade color scheme, you
   can also select how you want the fade to appear:

Fade Edge You
can select horizontal or Vertical.

Fade Diagonal
You can select up or down.

6. If you want to save
   the color changes you made as the permanent ones, select the Save as Default Colors check box. If you do
   not select this box, the colors remain in effect for the current
   session only.
7. Click the Ok
   button to complete the operation, or the Cancel
   button to abort the changes.

The color changes take effect immediately.

## Using the Show/Hide Options

There are various Show/Hide options, all located in the View menu,
which control which objects VISUAL displays and which it hides in
the Manufacturing Window.

### Showing/Hiding Multi-Levels

The Show/Hide Multi-Level option controls how the other Show/Hide
functions operate. If you wish to control the display of all legs
on the master/work order, select Show/Hide Multi-Level
from the View menu. A check mark to the
left of the option indicates that it is active.

If you wish to set display for individual legs, select Show/Hide
Multi-Level from the View menu again.
The check mark disappears.

The remaining options operate on the entire master/work order if
you select Show/Hide Multi-Level. Otherwise,
the Show/Hide commands only apply to the selected leg.

### Showing/Hiding Operations

If you want to focus on material requirements only, select Show/Hide Operations from the View
menu or press Shift-F10. This suppresses the display all of the operations.
Only the header, legs, and material requirements appear. In text mode,
this produces an indented bill of materials.

To redisplay operations select Show/Hide Operations
again, or select Show All.

### Showing/Hiding Materials

If you want to focus on operations only, click the appropriate header
card then select Show/Hide Materials from
the View menu or press Shift-F11. This suppresses
the display of all material requirements. Only the header, legs, and
operations appear. This option does not apply to two-window modes,
because the materials always appear in the second window.

To redisplay materials select Show/Hide Materials
again, or select Show All.

### Hiding All

If you want to focus only on the subassembly structure of the master/work
order, select Hide All from the View menu or press the minus (-) key
on the number keypad of your keyboard. This suppresses the display
of all operations and material requirements, leaving only the header
and leg details.

### Showing All

Select Show All, or press the plus (+)
key on the number keypad of your keyboard to quickly redisplay all
operations, material requirements, and legs.

## Using the Jump Options

These functions control which portion of the master/work order appears
on the available screen space. They help you navigate around a large
structure that you cant view on a single screen. All three Jump options
place an object in the "home position." For graphic display,
home position is the lower left corner of the screen. For text display,
home position is the top line of the screen. These functions are all
located in the View menu.

### Using Jump Home

Select Jump Home from the View
menu to place the master/work order header in the home position.

### Using Jump

Select Jump from the View
menu to place the currently selected object in the home position.
This allows you to pick a starting point from which to work. You can
also use Shift-F8 to activate this function.

### Using Jump Up

Select Jump Up from the View
menu to place the parent leg header or master/work order header of
the selected object in the home position. For example, if you select
the fifth operation on a leg, and select Jump Up, VISUAL places the
leg header for the leg is put into home position. This lets you focus
on a particular leg to work on. You can also use Shift-F9 to activate
this function.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Manufacturing_Window.htm) User-defined Help

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Using_High_Contrast_Mode.htm)
Using High Contrast Mode