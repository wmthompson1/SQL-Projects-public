About Built-in Leadtime Functionality




# About Built-in Leadtime Functionality

This table shows how the built-in functionality updates the steps
in the leadtime process:

|  |  |  |
| --- | --- | --- |
| Action | Process step | Result |
| Change a quotes status to Won, Lost, or Cancel | Quote | Updates the start date of the quote step to equal the quote date.  Updates the end date to equal the date that the status was changed.  Updates the percent complete for the quote step to 100%.  Subtracts the start date of the quote step from the end date of the quote step to calculate the actual days for the step. |
| Create a sales order | Sales Order | Updates the start date of the sales order step to equal the order date. |
| Quote | If the sales order is associated with a quote and the quote steps end date is null, then updates the end date of the quotes step, updates the percent complete of the quote step to 100%, and calculates the number of days to complete the quote step. |
| Release a sales order | Sales Order | Updates the end date to equal the current date.  Updates the percent complete for the Sales Order step to 100%.  Subtracts the start date of the sales order step from the end date of the sales order step to calculate the actual days for the step. |
| Work Order | If a work order is linked to the sales order and the work order steps start date is null, then the work order steps start date is updated to the current date. |
| Fully ship a line or close a line short on a partial shipment | Shipment | If the shipment step does not have a start date, updates the shipment steps start date to the shipment date. Updates the shipment steps end date to the shipment date.  If the shipment step does have a start date, updates the shipment steps end date to the last shipped date of the sales order line.  Updates the percent complete for the shipment step by dividing the total shipped by the order quantity and multiplying by 100.  Subtracts the start date of the shipment step from the end date of the shipment step to calculate the actual days for the step. |
| Work Order | Updates the work order step end date to the shipment date. Subtracts the start date of the work order step from the end date of the work order step to calculate the actual days for the step.  Updates the percent complete of the work order step to 100%. |
| Invoice | If the invoice step does not have a start date, updates the start date of the invoice step to the shipment date. |
| Partially ship a line and leave the sales order line open. | Shipment | If the shipment step does not have a start date, updates the shipment steps start date to the shipment date. |
| Work Order | Updates the percent complete of the work order step by dividing the total shipped by the order quantity and multiplying by 100. |
| Create an invoice | Invoice | If all lines on a sales order are invoiced and the status of all sales order lines is Closed, then the invoice step end date is set to the date the invoice is created. Subtracts the start date of the invoice step from the end date of the invoice step to calculate the actual days for the step. Updates percent complete to 100%. |
| Payment | If the payment step does not have a start date, updates the payment steps start date with the invoice date. |
| Create a payment | Payment | If the payment step does not have an end date, the customer order line status is Closed, the sales order line is invoiced, and the payment fully pays the invoice for the sales order line, updates the end date of the payment step to the payment date. Subtracts the start date of the invoice step from the end date of the invoice step to calculate the actual days for the step. Updates percent complete to 100%. |