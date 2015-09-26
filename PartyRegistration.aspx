<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PartyRegistration.aspx.cs" Inherits="PartyRegistration" %>

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
        <asp:Label ID="loginStatusLbl" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Panel ID="Panel1" runat="server">
        <table class="style1">
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label1" runat="server" Text="Party Registration"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="PNameLbl" runat="server" Text="Party Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="PNameTxtBox" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="PNameTxtBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Upload Party Symbol"></asp:Label>
                </td>
                <td>
                    <asp:FileUpload ID="UploadSymb" runat="server" />
                    <asp:Label ID="uploadMsg" runat="server"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="UploadSymb" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="registerPartyBtn" runat="server" 
                        onclick="registerPartyBtn_Click" Text="Register" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
        </asp:Panel>
        
    </div>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AdminPanel.aspx">Move to Admin Panel</asp:HyperLink>
    </form>
</body>
</html>
