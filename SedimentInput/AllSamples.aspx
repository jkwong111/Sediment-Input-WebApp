<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AllSamples.aspx.vb" Inherits="SedimentInput.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblWatershed2" runat="server" Text="Label"></asp:Label>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="ID" DataSourceID="SedimentSamples">
                <Columns>
                    <asp:BoundField DataField="FlumeWebID" HeaderText="FlumeWebID" ReadOnly="True" SortExpression="FlumeWebID" />
                    <asp:BoundField DataField="RepDate" HeaderText="RepDate" ReadOnly="True" SortExpression="RepDate" />
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
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
                </Columns>
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#003399" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />
            </asp:GridView>
            <asp:SqlDataSource ID="SedimentSamples" runat="server" ConnectionString="<%$ ConnectionStrings:AccessConnectionString %>" DeleteCommand="DELETE FROM [tblSedimentSamples] WHERE [ID] = ?" InsertCommand="INSERT INTO [tblSedimentSamples] ([FlumeWebID], [RepDate], [FillTime], [SedFlowCount], [SedSampleCount], [FlowDepth], [PossibleError], [LabTechInitials], [BarCode], [BottleCode], [WetWeight], [DryWeight], [Comments], [ID]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:AccessConnectionString.ProviderName %>" SelectCommand="SELECT [FlumeWebID], [RepDate], [FillTime], [SedFlowCount], [SedSampleCount], [FlowDepth], [PossibleError], [LabTechInitials], [BarCode], [BottleCode], [WetWeight], [DryWeight], [Comments], [ID] FROM [tblSedimentSamples]" UpdateCommand="UPDATE [tblSedimentSamples] SET [FlumeWebID] = ?, [RepDate] = ?, [FillTime] = ?, [SedFlowCount] = ?, [SedSampleCount] = ?, [FlowDepth] = ?, [PossibleError] = ?, [LabTechInitials] = ?, [BarCode] = ?, [BottleCode] = ?, [WetWeight] = ?, [DryWeight] = ?, [Comments] = ? WHERE [ID] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
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
                    <asp:Parameter Name="ID" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
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
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
