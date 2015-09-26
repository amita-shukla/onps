<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label1" runat="server" Text="Change Password"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Enter Old Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="OldPassTxtBox" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Enter New Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="NewPassTxtBox" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="ChangePassBtn" runat="server" onclick="ChangePassBtn_Click" 
                        Text="Change Password" />
                    <br />
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/VoterHome.aspx">Go to Home Page</asp:HyperLink>
                    <br />
                    <asp:Label ID="MsgLbl" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
