Imports System.Data
Imports System.Data.OleDb



Public Class SampleListing
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim strSQL As String
        Dim conn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\SedimentSamples.mdb;Persist Security Info=True")
        Dim strListing As String
        Dim intID As Integer

        Dim intWatershed As Integer = Session("Session_WatershedRequest")

        If intWatershed = 63 Then
            lblWaterhsed.Text = "Walnut Gulch"
            SedimentAccessDB.SelectCommand = "SELECT * FROM [tblSedimentSamples] WHERE [FlumeWebID] < '76000' AND [CompleteEntry] = False ORDER BY [FlumeWebID], [RepDate]"
            strSQL = "SELECT ID, FlumeWebID, RepDate, SedFlowCount, SedSampleCount FROM tblSedimentSamples WHERE (FlumeWebID < '76000') AND CompleteEntry = False ORDER BY FlumeWebID, RepDate"
        Else
            lblWaterhsed.Text = "Santa Rita"
            SedimentAccessDB.SelectCommand = "SELECT * FROM [tblSedimentSamples] WHERE [FlumeWebID] > '76000' AND [CompleteEntry] = False ORDER BY [FlumeWebID], [RepDate]"
            strSQL = "SELECT ID, FlumeWebID, RepDate, SedFlowCount, SedSampleCount FROM tblSedimentSamples  WHERE FlumeWebID > '76000' AND CompleteEntry = False ORDER BY FlumeWebID, RepDate"
        End If

        lblError.Text = ""

        conn.Open()

        Dim cmd = New OleDbCommand(strSQL, conn)
        Dim reader As OleDbDataReader

        reader = cmd.ExecuteReader()

        If Not IsPostBack() Then

            While reader.Read()
                intID = reader.Item(0)
                strListing = reader.Item(1).ToString & " | " &
                    reader.Item(2).ToString & " | " &
                    reader.Item(3).ToString & " | " &
                    reader.Item(4).ToString
                dlQuickSelect.Items.Add(New ListItem(strListing, intID))
            End While

        End If

        conn.Close()

    End Sub

    Protected Sub dlQuickSelect_SelectedIndexChanged(sender As Object, e As EventArgs) Handles dlQuickSelect.SelectedIndexChanged
        DetailsView1.SetPageIndex(dlQuickSelect.SelectedIndex)
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim tb As TextBox

        If DetailsView1.Rows.Count > 0 Then
            tb = TryCast(DetailsView1.Rows(8).Controls(1).Controls(0), TextBox)
            tb.Text = "N/A"
            tb = TryCast(DetailsView1.Rows(9).Controls(1).Controls(0), TextBox)
            tb.Text = "0"
            tb = TryCast(DetailsView1.Rows(10).Controls(1).Controls(0), TextBox)
            tb.Text = "Q0"
            tb = TryCast(DetailsView1.Rows(11).Controls(1).Controls(0), TextBox)
            tb.Text = "0"
            tb = TryCast(DetailsView1.Rows(12).Controls(1).Controls(0), TextBox)
            tb.Text = "0"
            tb = TryCast(DetailsView1.Rows(13).Controls(1).Controls(0), TextBox)
            tb.Text = "Not a valid sample"
        End If

    End Sub

    Protected Sub DetailsView1_PageIndexChanged(sender As Object, e As EventArgs) Handles DetailsView1.PageIndexChanged
        dlQuickSelect.SelectedIndex = DetailsView1.PageIndex
    End Sub

    Protected Sub DetailsView1_ItemUpdating(sender As Object, e As DetailsViewUpdateEventArgs) Handles DetailsView1.ItemUpdating
        Dim tbBottleCode As TextBox
        Dim strSQL As String
        Dim conn As New OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\SedimentSamples.mdb;Persist Security Info=True")

        tbBottleCode = TryCast(DetailsView1.Rows(10).Controls(1).Controls(0), TextBox)

        tbBottleCode.Text = Trim(tbBottleCode.Text)

        strSQL = "SELECT * FROM tblTareWeights WHERE BottleCode = '" & tbBottleCode.Text & "'"

        conn.Open()

        Dim cmd = New OleDbCommand(strSQL, conn)
        Dim reader As OleDbDataReader

        reader = cmd.ExecuteReader()

        If Not reader.HasRows Then
            lblError.Text = "BOTTLE CODE DOES NOT EXIST"
            e.Cancel = True
        Else
            lblError.Text = ""
        End If

        conn.Close()

    End Sub
End Class