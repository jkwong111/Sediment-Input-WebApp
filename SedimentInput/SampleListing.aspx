<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="SampleListing.aspx.vb" Inherits="SedimentInput.SampleListing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body onkeydown = "return (event.keyCode!=13)">
    <form id="form1" runat="server">
        <p>
            <asp:Label ID="lblWaterhsed" runat="server" Font-Bold="True" Font-Names="Roboto" Font-Size="Large" Text="Label"></asp:Label>
        </p>
        <p>
            <strong>Quick Select:</strong></p>
        <p>
            <asp:DropDownList ID="dlQuickSelect" runat="server" AutoPostBack="True">
            </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" Text="Bad Sample" />
            <br />
        </p>
        <div>
            <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateEditButton="True" AutoGenerateRows="False" CellPadding="4" DataKeyNames="ID" DataSourceID="SedimentAccessDB" DefaultMode="Edit" ForeColor="#333333" GridLines="None" Height="50px" Width="489px">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                <EditRowStyle BackColor="#999999" />
                <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" SortExpression="ID" Visible="False" ReadOnly="True" />
                    <asp:BoundField DataField="FlumeWebID" HeaderText="FlumeWebID" SortExpression="FlumeWebID" ReadOnly="True" />
                    <asp:BoundField DataField="RepDate" HeaderText="RepDate" SortExpression="RepDate" ReadOnly="True" />
                    <asp:BoundField DataField="FillTime" HeaderText="FillTime" ReadOnly="True" SortExpression="FillTime" />
                    <asp:BoundField DataField="SedFlowCount" HeaderText="SedFlowCount" ReadOnly="True" SortExpression="SedFlowCount" />
                    <asp:BoundField DataField="SedSampleCount" HeaderText="SedSampleCount" ReadOnly="True" SortExpression="SedSampleCount" />
                    <asp:BoundField DataField="FlowDepth" HeaderText="FlowDepth" ReadOnly="True" SortExpression="FlowDepth" />
                    <asp:CheckBoxField DataField="PossibleError" HeaderText="PossibleError" ReadOnly="True" SortExpression="PossibleError" />
                    <asp:BoundField DataField="LabTechInitials" HeaderText="LabTechInitials" SortExpression="LabTechInitials" />
                    <asp:BoundField DataField="BarCode" HeaderText="BarCode" SortExpression="BarCode" />
                    <asp:BoundField DataField="BottleCode" HeaderText="BottleCode" SortExpression="BottleCode" />
                    <asp:BoundField DataField="WetWeight" HeaderText="WetWeight" SortExpression="WetWeight" />
                    <asp:BoundField DataField="DryWeight" HeaderText="DryWeight" SortExpression="DryWeight" />
                    <asp:BoundField DataField="Comments" HeaderText="Comments" SortExpression="Comments" />
                    <asp:CheckBoxField DataField="Exclude" HeaderText="Exclude" SortExpression="Exclude" Visible="False" />
                    <asp:BoundField DataField="QAQC_Comments" HeaderText="QAQC_Comments" SortExpression="QAQC_Comments" Visible="False" />
                </Fields>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerSettings FirstPageText="[First]" LastPageText="[Last]" Mode="NextPreviousFirstLast" NextPageText="[Next]" PreviousPageText="[Prev]" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            </asp:DetailsView>
            <br />
            <asp:Label ID="lblError" runat="server" ForeColor="Red" Text="Label"></asp:Label>
            <asp:SqlDataSource ID="SedimentAccessDB" runat="server" ConnectionString="<%$ ConnectionStrings:AccessConnectionString %>" OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:AccessConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [tblSedimentSamples]" UpdateCommand="UPDATE [tblSedimentSamples] SET [LabTechInitials] = ?, [BarCode] = ?, [BottleCode] = ?, [WetWeight] = ?, [DryWeight] = ?, [Comments] = ? WHERE [ID] = ?" DeleteCommand="DELETE FROM [tblSedimentSamples] WHERE [ID] = ?" InsertCommand="INSERT INTO [tblSedimentSamples] ([ID], [FlumeWebID], [RepDate], [FillTime], [SedFlowCount], [SedSampleCount], [FlowDepth], [PossibleError], [LabTechInitials], [BarCode], [BottleCode], [WetWeight], [DryWeight], [Comments], [Exclude], [QAQC_Comments]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)">
                <DeleteParameters>
                    <asp:Parameter Name="original_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                    <asp:Parameter Name="FlumeWebID" Type="String" />
                    <asp:Parameter Name="RepDate" Type="DateTime" />
                    <asp:Parameter Name="FillTime" Type="Single" />
                    <asp:Parameter Name="SedFlowCount" Type="Int16" />
                    <asp:Parameter Name="SedSampleCount" Type="Int16" />
                    <asp:Parameter Name="FlowDepth" Type="Single" />
                    <asp:Parameter Name="PossibleError" Type="Boolean" />
                    <asp:Parameter Name="LabTechInitials" Type="String" />
                    <asp:Parameter Name="BarCode" Type="String" />
                    <asp:Parameter Name="BottleCode" Type="String" />
                    <asp:Parameter Name="WetWeight" Type="Single" />
                    <asp:Parameter Name="DryWeight" Type="Single" />
                    <asp:Parameter Name="Comments" Type="String" />
                    <asp:Parameter Name="Exclude" Type="Boolean" />
                    <asp:Parameter Name="QAQC_Comments" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="LabTechInitials" Type="String" />
                    <asp:Parameter Name="BarCode" Type="String" />
                    <asp:Parameter Name="BottleCode" Type="String" />
                    <asp:Parameter Name="WetWeight" Type="Single" />
                    <asp:Parameter Name="DryWeight" Type="Single" />
                    <asp:Parameter Name="Comments" Type="String" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
