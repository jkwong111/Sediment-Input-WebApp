Public Class WebForm1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim intWatershed As Integer = Session("Session_WatershedRequest")

        If intWatershed = 63 Then
            lblWatershed2.Text = "Walnut Gulch"
            SedimentSamples.SelectCommand = "SELECT * FROM [tblSedimentSamples] WHERE [FlumeWebID] < '76000' AND [CompleteEntry] = True ORDER BY [FlumeWebID], [RepDate]"
        Else
            lblWatershed2.Text = "Santa Rita"
            SedimentSamples.SelectCommand = "SELECT * FROM [tblSedimentSamples] WHERE [FlumeWebID] > '76000' AND [CompleteEntry] = True ORDER BY [FlumeWebID], [RepDate]"
        End If

    End Sub

End Class