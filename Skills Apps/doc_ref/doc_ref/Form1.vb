Imports System.Windows.Forms.VisualStyles.VisualStyleElement
Imports Microsoft.Data
Imports Microsoft.Data.SqlClient


Public Class Form1
    'Dim conec1 As String = "Server=SQL-Lab-1.skillsinc.local;Database=LIVE;User ID=sa;Password=********"
    Dim conec1 As String = "Data Source=SQL-Lab-2.skillsinc.local;Initial Catalog=Live;Integrated Security=True"
    Dim conexion As New SqlConnection(conec1)
    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        'CargarDatos()
        CargarDatosDp()
    End Sub
    Private Sub CargarDatosDp()
        Dim conn4 As New SqlConnection
        'conn4.ConnectionString = "Server=SQL-Lab-1.skillsinc.local;Database=LIVE;User Id=sa;Password=********;"
        conn4.ConnectionString = "Data Source=SQL-Lab-2.skillsinc.local;Initial Catalog=Live;Integrated Security=True"
        Dim cmd4 As New SqlCommand("SELECT BASE_ID, LOT_ID, SPLIT_ID, PART_ID FROM WORK_ORDER WHERE STATUS NOT IN ('C', 'X') AND TYPE = 'W' AND SUB_ID = 0 ", conn4)
        conn4.Open()
        Dim sdr As SqlDataReader = cmd4.ExecuteReader()
        While sdr.Read()
            Try
                cbbWo.Items.Add(sdr("BASE_ID").ToString())

            Catch ex1 As Exception
            End Try
        End While
        sdr.Close()

    End Sub
    Private Sub CargarDatos()
        DataGridView1.DataSource = Nothing
        Dim YEARa, YEARb, MONTH1a, MONTH1b, MONTH2 As Integer
        Dim WO, CB1 As String
        Dim conn4 As New SqlConnection
        'conn4.ConnectionString = "Server=SQL-Lab-1.skillsinc.local;Database=LIVE;User Id=sa;Password=********;"
        conn4.ConnectionString = "Data Source=SQL-Lab-2.skillsinc.local;Initial Catalog=Live;Integrated Security=True"
        Dim cmd4 As New SqlCommand("SELECT ID_01, ID_02,ID_03, (SELECT WO FROM SK_DOC_REF_WO) AS 'WO' FROM APP_CONFIG_CKSK", conn4)
        conn4.Open()
        Dim sdr As SqlDataReader = cmd4.ExecuteReader()
        While sdr.Read()
            Try
                YEARa = sdr.Item("ID_01").ToString
                MONTH1a = sdr.Item("ID_02").ToString
                MONTH1b = sdr.Item("ID_03").ToString
                WO = sdr.Item("WO").ToString
            Catch ex1 As Exception
            End Try
        End While
        sdr.Close()

        YEARb = Date.Today.Year
        MONTH2 = Date.Today.Month
        CB1 = cbbWo.Text

        If YEARa = YEARb Then
            If MONTH1a = MONTH2 Or MONTH1b = MONTH2 Then
                Try
                    conexion.Open()
                    Dim consulta As String = " SELECT W.BASE_ID AS 'WO', ME.SUB_ID, ME.SEQUENCE_NO AS 'SEQ_NO', 
	                        ME.RESOURCE_ID, DR.DOCUMENT_ID AS 'DOCUMENT ID', D.DOC_FILE_PATH
                        FROM DOCUMENT_REF_WO DR WITH (NOLOCK) 
                        INNER JOIN DOCUMENT D WITH (NOLOCK) ON DR.DOCUMENT_ID = D.ID
                        INNER JOIN (
	                        SELECT WORKORDER_BASE_ID AS BASE_ID, WORKORDER_LOT_ID AS LOT_ID, WORKORDER_SPLIT_ID AS SPLIT_ID, 
		                        WORKORDER_SUB_ID AS SUB_ID, SEQUENCE_NO, RESOURCE_ID 
	                        FROM OPERATION WHERE WORKORDER_TYPE = 'M'
                        ) ME ON DR.WORKORDER_BASE_ID =  ME.BASE_ID AND DR.WORKORDER_LOT_ID = ME.LOT_ID AND 
	                        DR.WORKORDER_SPLIT_ID = ME.SPLIT_ID AND DR.WORKORDER_SUB_ID = ME.SUB_ID AND DR.SEQUENCE_NO = ME.SEQUENCE_NO

                        INNER JOIN (
	                        SELECT BASE_ID, LOT_ID, SPLIT_ID, PART_ID
	                        FROM WORK_ORDER WHERE SUB_ID = 0 AND TYPE = 'W' 
                        ) W ON ME.BASE_ID = W.PART_ID 

                        WHERE W.BASE_ID = '" & CB1 & "'
                        ORDER BY ME.SUB_ID, ME.SEQUENCE_NO, ME.RESOURCE_ID ASC "
                    Dim adaptador As New SqlDataAdapter(consulta, conexion)
                    Dim tabla As New DataTable()
                    adaptador.Fill(tabla)
                    DataGridView1.DataSource = tabla
                Catch ex As Exception
                    MessageBox.Show("The data cannot be loaded (ln_55): " & ex.Message)
                    'conexion.Close()
                End Try
                conexion.Close()

                Dim colIndex As Integer = DataGridView1.Columns("DOC_FILE_PATH").Index
                Dim linkColumn As New DataGridViewLinkColumn()

                With linkColumn
                    .HeaderText = "Document Path"
                    .Name = "DOC_FILE_PATH"
                    .DataPropertyName = "DOC_FILE_PATH"
                    .LinkBehavior = LinkBehavior.HoverUnderline
                    .UseColumnTextForLinkValue = False
                End With

                DataGridView1.Columns.RemoveAt(colIndex)
                DataGridView1.Columns.Insert(colIndex, linkColumn)
                DataGridView1.Columns("WO").AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells
                DataGridView1.Columns("SUB_ID").Width = 60
                DataGridView1.Columns("SEQ_NO").Width = 60
                DataGridView1.Columns("RESOURCE_ID").AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells
                DataGridView1.Columns("DOCUMENT ID").AutoSizeMode = DataGridViewAutoSizeColumnMode.AllCells
                DataGridView1.Columns("DOC_FILE_PATH").Width = 350
            Else
                MessageBox.Show("Unexpected error, consult IT (ln_80)")
                'EL MES ACTUAL Y EL SIGUIENTE (ID02, ID03) DEBE SER ACTUALIZADO EN LA TABLA [SQL-Lab-1].[LIVE].dbo.[APP_CONFIG_CKSK] 
                Me.Close()
            End If
        Else
            MessageBox.Show("Unexpected error, consult IT (ln_85)")
            'EL AÑO (ID01) DEBE SER ACTUALIZADO EN LA TABLA [SQL-Lab-1].[LIVE].dbo.[APP_CONFIG_CKSK]
            Me.Close()
        End If

    End Sub
    Private Sub DataGridView1_CellContentClick(sender As Object, e As DataGridViewCellEventArgs) Handles DataGridView1.CellContentClick
        If e.ColumnIndex = DataGridView1.Columns("DOC_FILE_PATH").Index AndAlso e.RowIndex >= 0 Then
            Dim url As String = DataGridView1.Rows(e.RowIndex).Cells("DOC_FILE_PATH").Value.ToString()
            Try
                Process.Start(New ProcessStartInfo(url) With {.UseShellExecute = True})
            Catch ex As Exception
                MessageBox.Show("The file cannot be opened or does not exist in the path: " & ex.Message)
            End Try
        End If
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        CargarDatos()
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        DataGridView1.DataSource = Nothing
        DataGridView1.Rows.Clear()
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Me.Close()
    End Sub


End Class
