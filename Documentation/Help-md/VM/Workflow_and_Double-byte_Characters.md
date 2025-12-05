Workflow and Double-byte Characters




# Workflow and Double-byte Characters

You must use single-byte characters with workflows.
This includes all aspects of the workflow itself, such as rules and
properties, and the VISUAL records on which the workflow is run. For
example, if you set up a workflow to run on parts in Part Maintenance,
then all Part IDs must use single-byte characters. Otherwise, the
workflow will not be triggered.