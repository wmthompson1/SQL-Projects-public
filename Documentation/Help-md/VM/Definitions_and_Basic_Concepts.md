Definitions and Basic Concepts




# Definitions and Basic Concepts

A process is a specific combination of machines, tools,
methods, materials and/or people employed to attain specific qualities
in a product or service. A change in any of these results in a new
process. These qualities (a dimension, material property, appearance,
etc.) are quality characteristics.

VISUAL allows you to group quality characteristics into a test suite
called a test. Each quality characteristic in the test is a test step.
Each test step contains test types (variable and attribute test types),
engineering specification limits, sampling frequency, current control
limits, gage reference and other information that collects and manages
data for the associated quality characteristic. You can link tests
to Infor VISUAL operations where quality characteristics and corresponding
parameters apply.

For example, if a test consists of these three test steps:

* The length of a part has
  engineering specifications of 2.25 +/-.03
* The width of a part has
  engineering specifications of 5 +/-.02
* The thickness of a part
  has engineering specifications of 1.25 +/-.02

Wherever these characteristics and specifications apply, the test
can gather data. You should enter the data in production order; the
subgroup sequencing for each test step maintains this order. VISUAL
maintains the order of the data over multiple operations; therefore,
the order of the data always remains in production order. The control
limits for a test step are generated using the data entered for that
test step.

Statistical Process Control (SPC) is the
application of statistical techniques for measuring and analyzing
the variation in processes. A process is in statistical control when
all the variation in the process is classified as inherent (i.e. is
of unknown and insignificant cause). A process that is not in statistical
control has variation due to assignable causes. You should discover
and correct these assignable causes to bring the process under statistical
control.

You can measure the variation of any particular quality characteristic
by sampling the output of the process and plotting the measurements
on a chart or graph as a function of time. When the measurements are
plotted, a zigzag pattern appears. This is a fluctuating pattern,
which can be either natural or unnatural. A natural pattern is the
usual small fluctuations in measurements due to the variation inherent
in the process. When a pattern is normal, it means that there are
no abnormal extraneous causes working in the process.

An unnatural pattern means that outside disturbances (assignable
causes) are present and are affecting the process. When a pattern
is unnatural, you should investigate what the outside disturbances
are.

A control limit is a statistical limit used to determine whether
a pattern is natural or unnatural. A Control chart is a chart or graph
showing a fluctuation pattern together with its control limits. There
are control charts for variables data, which is data that is measured
on a continuous scale or dimension such as length, width, weight,
pH, etc. There are also control charts for attributes data, which
is a count of discrete measurements such as good or bad, pass or fail,
go or no-go, etc. Charts for variables are usually based on a subgroup
size of 4 to 10 individual measurements, while charts for attributes
on a minimum of 50 and often several hundred individual measurements.
The samples, which usually contain more than one individual measurement,
are called subgroups. A number of subgroups, usually 25, are measured
and for variables, each individual measurement, X, of the quality
characteristic is recorded. The average, XBar, and range, R, are calculated
for each subgroup and plotted in order of production on separate charts.
A central line is drawn on each chart at the grand average, XBarBar
or XDoubleBar, and at the average range, RBar. An upper control limit
(UCL) and lower control limit (LCL) are established and the area between
these two limits defines where a natural fluctuating pattern occurs.

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Using_Control_Charts.htm)
Using Control Charts

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Attaining_Statistical_Control.htm) Attaining Statistical Control

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](Steps_in_Setting_Up_Control_Charts.htm) Steps in Setting Up Control Charts

[![btn_mini.gif](btn_mini.gif "btn_mini.gif")](User_defined_Help_Files_Quality_Maintenance.htm) User-defined Help