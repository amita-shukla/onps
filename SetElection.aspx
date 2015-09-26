<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SetElection.aspx.cs" Inherits="SetElection" debug="true"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 56%;
        }
        .style2
        {
            width: 313px;
        }
        .style3
        {
        }
        .style4
        {
            width: 292px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table class="style1">
        <tr>
            <td class="style4">
                <asp:Label ID="Label1" runat="server" Text="Election Date [YYYY-MM-DD]"></asp:Label>
            </td>
            <td class="style2">
                <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
            </td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="Label2" runat="server" Text="Constituency"></asp:Label>
            </td>
            <td class="style2">
                <asp:TextBox ID="ElConsTxtBox" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3" colspan="2">
                <asp:Button ID="SetElectionBtn" runat="server" onclick="SetElectionBtn_Click" 
                    Text="Set Election" />
                <br />
                <br />
                <asp:Label ID="msgLbl" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <div>
    
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AdminPanel.aspx">Go to Admin Panel</asp:HyperLink>
    
    </div>
    </form>
</body>
</html>
