Importing and Exporting With the MLT Format




# Importing and Exporting With the MLT Format

VISUAL supports the ASCII (MLT) format. The MLT format is record
oriented. Each record contains this information:

* Part ID
* Part description.
* Starting year
* Starting period number
* Periods per year: Use 12
  for monthly, use 52 for weekly; Default to 12 when zero.
* Periods per cycle (for seasonality;
  usually the same as periods per year)
* Data series (this is the
  actual forecast value for each period.)
* A terminating semicolon

While the first two items in the MLT file can be any identifying
key and description, we recommend using Part ID and Part Description
to avoid confusion.

These limitations apply to the MLT file:

* The Part ID is limited to
  24 characters. VISUAL supports 30. You can export data for part
  number lengths between 25 and 30 characters, but Forecast Pro
  will truncate them to 24. This means that the resulting data cannot
  be put back into VISUAL reliably.
* Part IDs may only contain
  certain characters. They are: ! # $ % & 0-9 ? @ A-Z \_ a-z
  |
* Forecast Pro assigns a special
  meaning to any entry that starts with an underscore character.
  The record is tagged as a helper variable and is not part of a
  forecast.
* MLT format files handle
  up to 12,000 points of data; i.e., the data series can have up
  to 12,000 entries.
* Forecast Pro does not export
  confidence information in the MLT file format. For this information,
  you need to read the ITM file format.