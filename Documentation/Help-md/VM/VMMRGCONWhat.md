What is the Contact Merge Utility?




| | What is the Contact Merge Utility? | |
| **Caution:** Using this utility permanently changes the contact information in your database. Make a backup of your database before using this utility.  Business object documents (BODs) require a Contact ID. To comply with this standard, the CONTACT\_ID field was added to the 7.1.0 and higher database schema. When you upgraded your database to 7.1.0 or higher, Contact IDs were created for all contacts with associated transactions. If contact entries were not identical a new contact entry was created. This resulted in multiple Contact IDs for the same contact with minor variations.  Use the Contact Merge Utility to consolidate duplicate contact records, by specifying the Parent Contact ID to replace the duplicate Contact IDs on transactions. After the duplicate contact information is replaced by the parent contact information in transactions, the duplicate contact is removed from the database. Depending on the options you choose in the utility, you can also update transactions with the parent contacts name, position, and phone number. Requirements You must have system administrator privileges to use this utility. You can only use the utility with Infor VISUAL 7.1.2 and higher and Infor VISUAL CRM 7.12 and higher. Consult with your VISUAL ICS staff for recommendations on updating VISUAL and VISUAL CRM.  **Note:** If CRM is not installed then the Contact Merge Utility ignores all variables, validations and functions associated with CRM. |

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMMRGCONfrmContactMrg.htm)
Merging Contacts

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMMRGCONInterfaceOvrvw.htm) Navigating in the Contact Merge Utility

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](VMMRGCONContactTableSort.htm) Sorting the contact table in the Contact
Merge Utility