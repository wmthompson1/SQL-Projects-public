Key Functions:
C:\Users\williamt\source\skillsinc\skills-inc-org\SQL-Projects\Utilities\Powershell Utilities\BOEReceivableProcess_document_segmentation.md

Function	Purpose
parse_segmentation_scheme()	Parses CSV data map into DataFrame
excel_range_to_indices()	Converts A3:B5 → (row, col) indices
extract_freeform_block()	Extracts metadata as key-value pairs
extract_tabular_block()	Extracts tables with columns + data rows
segment_document()	Main orchestrator - iterates scheme and extracts blocks