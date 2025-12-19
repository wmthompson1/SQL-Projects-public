Planning Leadtime Processes Steps




# Planning Leadtime Processes Steps

You can use built-in functionality, macros, or a combination of
the two to create the steps in your leadtime process. This table describes
each option:

|  |  |  |  |
| --- | --- | --- | --- |
| **Option** | **How it works** | **Notes** | **UpdateProcessActivity Preference Setting** |
| Built-in functionality only | Updates the start date, end date, percent complete, and actual days at predefined stages of the sales process, such as releasing a sales order, shipping a sales order, and creating a payment. | Functions out-of-the-box  Functionality cannot be customized  One process step per document type is allowed | Y |
| SaveProcess macro only | Updates the start date, end date, and percent complete at stages that you define in the macro. | Multiple steps per document type are allowed. For example, you can create one step for preparing the quote and a second step for receiving approval from the customer.  Multiple stages in a single step is allowed. For example, you can use a macro to update the quote step to 50% complete when the quote has a status of ready and to 100% complete when the quote has a status of Won. | N |
| Built-in functionality and macros | Updates the start date, end date, and percent complete at predefined stages.  Also updates the start date, end date, and percent complete at stages that you define in the macro. | One process step per document type is allowed.  Multiple stages in a single step are allowed. For example, you can use a macro to update the quote step 50% complete when the quote has a status of ready. When the quote has a status of Won or Lost, the built-in functionality updates the percent complete to 100% | Y |

After you decide which option to use to create leadtime process
steps, [use Preferences
Maintenance to specify your choice](Specifying_Leadtime_Process_Preferences.md).

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Customer_Order_Entry.md) User-defined Help