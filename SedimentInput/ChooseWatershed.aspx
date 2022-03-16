<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ChooseWatershed.aspx.vb" Inherits="SedimentInput.ChooseWatershed" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h2>Sediment Input Program (Web Version)</h2>
    <h3>&nbsp;</h3>
    <h3>Choose Your Watershed:</h3>
    <form id="form1" runat="server">
        <div>
            <asp:RadioButtonList ID="rblWatersheds" runat="server">
                <asp:ListItem Selected="True" Value="63">Walnut Gulch</asp:ListItem>
                <asp:ListItem Value="76">Santa Rita</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <asp:Button ID="Button1" runat="server" style="margin-bottom: 0px" Text="INPUT DATA" />
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" Text="DISPLAY REPORT" />
        </div>
    </form>
</body>
</html>
