Special Characters in Text Strings




# Special Characters in Text Strings

Some text strings that you translate include characters that have
a specific function. This table shows the characters, their functions,
and recommended best practices:

|  |  |  |
| --- | --- | --- |
| **Character** | **Function** | **Best practice** |
| & (ampersand) | The keyboard control for the item. The letter after the ampersand is the keyboard control. The ampersand is replaced by an underscore in the interface. | You can retain the keyboard control in your translation. You can use a different letter for the keyboard control than the one used in the default VISUAL translation.    Note: The ampersand is a standard Microsoft Windows function. For more information about the use of ampersands, see [https://support.microsoft.com/en-us/help/261320/how-to-use-an-ampersand-in-a-form-name-menu-or-control.](https://support.microsoft.com/en-us/help/261320/how-to-use-an-ampersand-in-a-form-name-menu-or-control) |
| %1, %2, %3, and so on | A token. A token is made up of the percent sign followed by a number. | If a text string includes a token, also include the token in your translation. The token is replaced by information in your database.  You cannot add a token to a text string that does not already use one. |
| <<< | Line break in a table column header. | You can move or remove the line break. Users can change the location of the line break in the Configure Line Item Table dialog that is available on windows with the tables. |

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMTRNMNTWhat.md)
What is Translation Maintenance?

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Concepts_Common_Features.md) User-defined Help