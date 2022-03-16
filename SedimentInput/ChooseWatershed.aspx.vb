Imports System.Data
Imports System.Data.OleDb
Imports System.Data.SqlClient

Public Class ChooseWatershed
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim strSQL As String
        Dim strConnectionString As String = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\SedimentSamples.mdb;Persist Security Info=True"
        Dim strDAPConnString As String = "Data Source=landslide;Initial Catalog=DAP;Persist Security Info=True;User ID=dapReader;Password=SpiderMan2004"
        Dim strLatestDate As String
        Dim intThisYear As Integer = Today.Year

        Session("Session_WatershedRequest") = rblWatersheds.SelectedValue

        Dim conn As New OleDbConnection(strConnectionString)

        'GET THE LATEST SAMPLE DATE
        strSQL = "SELECT RepDate FROM tblSedimentSamples ORDER BY RepDate DESC"

        conn.Open()

        Dim cmd = New OleDbCommand(strSQL, conn)
        Dim reader As OleDbDataReader

        reader = cmd.ExecuteReader()

        If reader.HasRows Then
            reader.Read()
            strLatestDate = reader.Item(0).ToString
        Else
            strLatestDate = "12/31/" & intThisYear - 1
        End If

        Session("Session_LatestDate") = strLatestDate

        'GET SAMPLES FROM SQL SERVER LATER THAN THIS DATE
        Dim conDAP As New SqlConnection(strDAPConnString)
        Dim adpMyAdapter As SqlClient.SqlDataAdapter
        Dim myDataset As New DataSet()
        Dim i As Integer
        strSQL = "SELECT flume.webID, array25.repDate, array25.sedFlowCnt, array25.sedSampleCnt, array25.bottleFillTime, array25.flowDepth FROM array25 CROSS JOIN flume " &
            "WHERE array25.repDate > '" & strLatestDate & "' And (flume.id = array25.sensorID) UNION SELECT weir.webID, array35.repDate, array35.sedFlowCnt, array35.sedSampleCnt, array35.bottleFillTime, array35.flowDepth FROM array35 CROSS JOIN weir " &
            "WHERE array35.repDate > '" & strLatestDate & "' AND (weir.id = array35.sensorID)"
        adpMyAdapter = New SqlClient.SqlDataAdapter(strSQL, conDAP)
        adpMyAdapter.Fill(myDataset, "SamplesFromDAP")
        adpMyAdapter.Dispose()

        Dim strWebID As String
        Dim strRepDate As String
        Dim strSedFlowCnt As String
        Dim strSedSampleCnt As String
        Dim strBottleFillTime As String
        Dim strFlowDepth As String
        With myDataset.Tables("SamplesFromDAP")
            For i = 0 To .Rows.Count - 1
                strWebID = .Rows(i)("webID").ToString
                strRepDate = .Rows(i)("repDate").ToString
                strSedFlowCnt = .Rows(i)("sedFlowCnt").ToString
                strSedSampleCnt = .Rows(i)("sedSampleCnt").ToString
                strBottleFillTime = .Rows(i)("bottleFillTime").ToString
                strFlowDepth = .Rows(i)("flowDepth").ToString

                strSQL = "INSERT INTO tblSedimentSamples (FlumeWebID, RepDate, FillTime, SedFlowCount, SedSampleCount, FlowDepth) VALUES ("
                strSQL &= "'" & strWebID & "', "
                strSQL &= "#" & strRepDate & "#, "
                strSQL &= strBottleFillTime & ", "
                strSQL &= strSedFlowCnt & ", "
                strSQL &= strSedSampleCnt & ", "
                strSQL &= strFlowDepth & ")"

                cmd = New OleDbCommand(strSQL, conn)
                cmd.ExecuteNonQuery()
            Next
        End With

        'SEE WHICH ENTRIES ARE COMPLETED
        strSQL = "UPDATE tblSedimentSamples SET CompleteEntry = True WHERE ((BarCode IS NOT NULL) AND (BottleCode IS NOT NULL) AND (WetWeight IS NOT NULL) AND (DryWeight IS NOT NULL))"
        cmd = New OleDbCommand(strSQL, conn)
        cmd.ExecuteNonQuery()

        'PRELIMINARY QA/QC
        strSQL = "UPDATE tblSedimentSamples SET PossibleError = True WHERE ((FillTime < 0) OR (SedFlowCount < 1) OR (SedSampleCount < 1) OR (FlowDepth < 0))"
        cmd = New OleDbCommand(strSQL, conn)
        cmd.ExecuteNonQuery()

        conn.Close()
        Response.Redirect("SampleListing.aspx")
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Session("Session_WatershedRequest") = rblWatersheds.SelectedValue
        Response.Redirect("AllSamples.aspx")
    End Sub
End Class