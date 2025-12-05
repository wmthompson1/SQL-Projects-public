Importing Translations




# Importing Translations

You can import translations from a text file. The
text file must meet these criteria:

* The VISUAL string must be
  listed first, followed by the translation
* The VISUAL string must be
  separated from the translation by either a comma or a tab.
* Each text string must be
  enclosed in quotation marks
* Each translation pair must
  be on a separate line
* A header row must not be
  used

For example, your text file could contain these lines:

"Edit qty complete vs. standard","Modifier
qt complte v. standard"

"Edit receiver","dition des
livraisons"

The first text string is the VISUAL string; the second string is
the translation.

Before you can import a translation, you must first create a language
pack. See [Creating Language
Pack IDs](Creating_Language_Pack_IDs.htm).

1. Select Admin,
   Translation Maintenance.
2. Select File,
   Import Translation File.
3. In the Language field,
   specify the language pack to which you are importing the file.
4. Click the Choose
   Translation File button and select the file to import.
5. Select from these processing
   options:

Replace Existing Translations
When you select this check box, these actions occur:

* If a VISUAL
  text string exists in both the language pack and the file, the
  translation in the file overwrites the existing translation in
  the language pack.
* If a VISUAL
  text string exists in the import file but not the language pack,
  the string is imported, unless the string in the file has a null
  value for the translation. Strings with null translations are
  not imported.
* If the
  VISUAL text string exists in the language pack but not the import
  file, the translation in the language pack is retained.

Reject Untranslated Strings
Select this check box to ignore text strings that have null translations.

Delete Existing Translations
Prior to Import Select this check box to delete all translations
from the language pack before importing the translations in the file.

If you do not select any check boxes, the
strings in the text file are added to the strings in the language
pack. If a VISUAL text string exists in both locations, the string
is duplicated. We recommend that you select at least one processing
option unless your language pack is blank.

If you are importing the Differences text
file that contains only the strings that are new to the current version
of VISUAL, then we recommend selecting the Replace
Existing Translations option.

6. Click the Run
   button.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMTRNMNTWhat.htm)
What is Translation Maintenance?

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Concepts_Common_Features.htm) User-defined Help