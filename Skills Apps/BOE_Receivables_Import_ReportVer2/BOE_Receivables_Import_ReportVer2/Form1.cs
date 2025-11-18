using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;
using System.Data.SqlClient;
using System.Threading;
using System.Timers;

namespace Team_App_Winform_3
{
    public partial class Form1 : Form
    {
        string sourcePath2 = "";
        string userMessage = "Get File";
        public Form1()
        {
            InitializeComponent();
        }

        OpenFileDialog ofd = new OpenFileDialog();
        private static System.Timers.Timer aTimer;

        static System.Windows.Forms.Timer myTimer = new System.Windows.Forms.Timer();
        static int alarmCounterX = 1;
        static int alarmCounterXMax = 18;
        static bool exitFlag = false;

        // This is the method to run when the timer is raised.
        private static void TimerEventProcessor(Object myObject,
                                                EventArgs myEventArgs)
        {
            myTimer.Stop();

            // Displays a message box asking whether to continue running the timer.
            //if (MessageBox.Show("Continue running?", "Count is: " + alarmCounterX,
            //   MessageBoxButtons.YesNo) == DialogResult.Yes)

            if (alarmCounterX < alarmCounterXMax)
            {
                // Restarts the timer and increments the counter.
                alarmCounterX += 1;
                myTimer.Enabled = true;
            }
            else
            {
                // Stops the timer.
                exitFlag = true;
            }
        }

        //interimFix2
        public static int interimFix2()
        {
            /* Adds the event and the event handler for the method that will 
               process the timer event to the timer. */
            myTimer.Tick += new EventHandler(TimerEventProcessor);

            // Sets the timer interval to 5 seconds.
            myTimer.Interval = 5000;
            myTimer.Start();

            // Runs the timer, and raises the event.
            while (exitFlag == false)
            {
                // Processes all the events in the queue.
                Application.DoEvents();
            }
            return 0;
        }

        //InterimFix
        public static void InterimFix()
        {
            Console.WriteLine("The interim process started at {0:HH:mm:ss.fff}", DateTime.Now);
            SetTimer();

            //Console.WriteLine("\nPress the Enter key to exit the application...\n");
            Console.WriteLine("The timer started at {0:HH:mm:ss.fff}", DateTime.Now);
            //Console.ReadLine();
            aTimer.Stop();
            aTimer.Dispose();

            Console.WriteLine("continue the application...");
        }

        private static void SetTimer()
        {
            // Create a timer with a two second interval.
            aTimer = new System.Timers.Timer(7000);
            // Hook up the Elapsed event for the timer. 
            aTimer.Elapsed += OnTimedEvent;
            aTimer.AutoReset = true; //true;
            aTimer.Enabled = true;
        }

        private static void OnTimedEvent(Object source, ElapsedEventArgs e)
        {
            Console.WriteLine("The Elapsed event was raised at {0:HH:mm:ss.fff}",
                              e.SignalTime);
        }

        private void btnOpen_Click(object sender, EventArgs e)
        {
            OpenFileDialog open = new OpenFileDialog();

            ofd.DefaultExt = ".xlsx, .xls";
            ofd.Filter = "Excel Files|*.xls;*.xlsx;*.xlsm";
            ofd.Multiselect = false;

            if (ofd.ShowDialog() == DialogResult.OK)
            {

                //StreamReader read = new StreamReader(File.OpenRead(open.FileName));
                textBox1.Text = ofd.FileName;
                textBox2.Text = ofd.SafeFileName;
                sourcePath2 = (string)textBox1.Text;
                setSourcePath(sourcePath2);
                Console.WriteLine("Source:  {0}", getSourcePath());
                button2.Enabled = true;



                //read.dispose();


            }
        }  // button

        public void setSourcePath (string src)
        {
            sourcePath2 = src;
        }

        public string getSourcePath()
        {
            return sourcePath2;
        }

        public void setUserMessage(string msg)
        {
            userMessage = msg;
        }

        private void label1_Click(object sender, EventArgs e)
        {

        } // label

        static void copyFile(string sourcePath)
        {
            string fileName = "BOE.xls";
            // S:\IS\DataTransfer\BOE Receivable\Input
            string targetPath = @"S:\IS\DataTransfer\BOE Receivable\Input";


            // Use Path class to manipulate file and directory paths.
            //string sourceFile = System.IO.Path.Combine(sourcePath, fileName);
            string sourceFile = sourcePath;
            string destFile = System.IO.Path.Combine(targetPath, fileName);

            Console.WriteLine("Source:  {0}", sourceFile);

            System.IO.File.Copy(sourcePath, destFile, true);

        }

        // The timer control that is located on the Components tab can be safely used in any class. This control creates an 
        // instance of the System.Timers.Timer class. If you're using the Visual Studio .NET toolbox, you can safely use this 
        // timer with either the Windows Forms designer or the component class designer.

        static void RunSQLJob(string cnn)
        {
            SqlConnection jobConnection;
            SqlCommand jobCommand;
            SqlParameter jobReturnValue;
            SqlParameter jobParameter;
            int jobResult;
            //string testCnn = "Crunch2018";
            //cnn = testCnn;

            jobConnection = new SqlConnection("Data Source=" + cnn + ";Initial Catalog=msdb;Integrated Security=SSPI");
            jobCommand = new SqlCommand("sp_start_job", jobConnection);
            jobCommand.CommandType = CommandType.StoredProcedure;

            jobReturnValue = new SqlParameter("@RETURN_VALUE", SqlDbType.Int);
            jobReturnValue.Direction = ParameterDirection.ReturnValue;
            jobCommand.Parameters.Add(jobReturnValue);

            jobParameter = new SqlParameter("@job_name", SqlDbType.VarChar);
            jobParameter.Direction = ParameterDirection.Input;
            jobCommand.Parameters.Add(jobParameter);
            jobParameter.Value = "RunSSISPackageBOE";

            jobConnection.Open();

            try
            {

                jobCommand.ExecuteNonQuery();
            }
            catch (Exception)
            {

                Thread.Sleep(30000);
                jobCommand.ExecuteNonQuery();
            }
           
            
            jobResult = (Int32)jobCommand.Parameters["@RETURN_VALUE"].Value;
            jobConnection.Close();

            switch (jobResult)
            {
                case 0:
                    Console.WriteLine("SQL Server Agent job, RunSSISPackageBOE, started successfully.");
                    break;
                default:
                    Console.WriteLine("SQL Server Agent job, RunSSISPackageBOE, failed to start.");
                    break;
            }
            //Console.Read();
        }

        private void button1_Click(object sender, EventArgs e)
        {
        this.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            listBox1.Items.Add("Running...");
            copyFile(sourcePath2);
            
            RunSQLJob("sql-bi-1");
            InterimFix();
            //This timer appears to be workin
            interimFix2();
            userMessage = "Step complete.";
            listBox1.Items.Add("Step complete.");
            Description.Text = userMessage;
            button2.Enabled = false;
            Console.WriteLine("The process completed at {0:HH:mm:ss.fff}", DateTime.Now);
            

        }



        void timer_Elapsed(object sender, ElapsedEventArgs e)
        {
            //throw new NotImplementedException();
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
