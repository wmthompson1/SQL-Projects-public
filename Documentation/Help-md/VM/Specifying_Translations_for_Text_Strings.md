Specifying Translations for Text Strings




# Specifying Translations for Text Strings

If you translate a term that is used in several areas
of VISUAL, the translation is used in every place that the term is
used. For example, if you specify a translation for the word Save,
your translation is used in every window and dialog where the word
Save is used. The translation is implemented in all windows and dialogs
where the term is used, even if you have not yet gathered text strings
from all of the windows and dialogs.

1. Select Admin,
   Translation Maintenance.
2. In the Language field,
   specify the language pack for which you are providing translations.
   Text strings that have been gathered for the language pack are
   displayed in the table. The default VISUAL text is displayed in
   the Visual column. Translations are displayed in the Foreign column.
3. Optionally, use these
   search filters to help you to locate the string that you want
   to translate:

Visual and Foreign fields.
Use the Visual and Foreign fields to locate strings that contain characters
that you specify. For example, if you specify PART in the Visual field,
all gathered VISUAL strings that include PART, such as Part ID and
Department, are displayed. Wildcards are not supported in the filter
fields.

Show Translated.
Select this check box to display strings that have been translated.
When you select this check box, rows where the value in the Foreign
column do not match the value in the Visual column are displayed.

Show Un-translated.
Select this check box to display strings that have not been translated.
A string is considered untranslated when the value in the Visual column
exactly matches the value in the Foreign column, or when the Foreign
column is blank and the Visual column is populated.

4. In the Foreign column,
   specify the translation to use for each text string.
5. Click the Save
   button. Your translation is saved to the database.

## Manually Adding Translation Strings

You can manually add a line to the Translation Maintenance table.
If you know the VISUAL term that you want to translate, you can manually
specify the term and the translation instead of gathering strings
from the interface.

1. Select Admin,
   Translation Maintenance.
2. In the Language field,
   specify the language pack for which you are providing translations.
3. Click the Insert
   Translation button.
4. In the Visual column,
   specify the string that you want to translate. The string must
   match a string that is used in VISUAL.
5. In the Foreign column,
   specify the translation.
6. Click the Save
   button.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMTRNMNTWhat.htm)
What is Translation Maintenance?

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Concepts_Common_Features.htm) User-defined Help