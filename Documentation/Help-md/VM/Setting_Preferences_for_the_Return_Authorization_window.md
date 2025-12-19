Setting Preferences for the Return Authorization window




# Setting Preferences for the Return Authorization window

You can set some of the defaults and the processing behavior of
the Return Authorization window. See [Using
Preference Maintenance](VMPRFMNTfrmPreferenceMaintenance.md).

This table lists the entries in the RMA section of Preferences Maintenance
and possible values:

| Entry | Value | Notes |
| DefaultType | C = Credit RMA Type  F = Repair RMA Type  R = Replace RMA Type  E = Evaluation RMA Type |  |
| DefaultReturnReasonCode | A valid code from the RMA Reason table in Application Global Maintenance, which can be a string of up to 15 characters. |  |
| ClearNewOrderPORef | Y = Clear the purchase order reference when creating a new order.  N = Keep the purchase order reference when creating a new order. |  |
| NewOrderStatus | C = Closed  F = Firmed  H = Hold  R = Released  X = Canceled | This entry is used when converting an evaluation RMA to a repair RMA and you have opted to create a new customer order to ship the repaired parts.  The status is used on the order header. |
| UseNewLineNumbers | Y = Uses new line numbers for RMA lines instead of the order line numbers.  N = Uses the order lines numbers. |  |
| CreateEvaluationQuotes | Y = Creates quotes by default for evaluation RMAs.  N = No quote is created for an evaluation RMA.  P = Prompts you to create or not create a quote for an evaluation RMA. |  |
| CreateEvaluationWorkorders | Y = Creates work orders by default for evaluation RMAs.  N = Does not create a work order for an evaluation RMA.  C = Copies the evaluation RMA as a work order.  R = Reuses the evaluation RMA as a work order.  P = Prompts for the evaluation RMA to be used as a work order. |  |
| CreateRepairWorkorders | Y = Creates work orders by default for repair RMAs.  N = Does not create a work order for an repair RMA.  P = Prompts for the repair RMA to be used as a work order. | This entry is used when you change an evaluation RMA to a repair RMA. This is where the C and R preferences should be. |