<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            border:3px solid black;
            width: 64%;
            height: 200px;
        }
        .style2
        {
            border:3px solid black;
            width: 39%;
        }
        .style3
        {
            border:3px solid black;
            width: 39%;
        }
        .style4
        {
            width: 355px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label1" runat="server" Text="Login"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="ID:"></asp:Label>
                </td>
                <td class="style4">
                    <asp:TextBox ID="IDTxtBox" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="IDTxtBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
                </td>
                <td class="style4">
                    <asp:TextBox ID="PassTxtBox" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="*" ControlToValidate="PassTxtBox"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="ErrMsg" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label10" runat="server" Text="Login As:"></asp:Label>
&nbsp;
                    <asp:RadioButtonList ID="UserTypeList" runat="server" 
                        RepeatDirection="Horizontal">
                        <asp:ListItem>Voter</asp:ListItem>
                        <asp:ListItem>Candidate</asp:ListItem>
                        <asp:ListItem>Admin</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="UserTypeList" ErrorMessage="*"></asp:RequiredFieldValidator>
&nbsp;
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="LoginBtn" runat="server" Text="Login" 
                        onclick="LoginBtn_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:HyperLink ID="HyperLink1" runat="server" 
                        NavigateUrl="~/VoterRegistration.aspx">Register As A Voter</asp:HyperLink>
                </td>
                <td>
                    <asp:HyperLink ID="HyperLink2" runat="server" 
                        NavigateUrl="~/CandidateRegistration.aspx">Register As A Candidate</asp:HyperLink>
                </td>
            </tr>
        </table>
    </div>
    <div>
    
        <br />
        
    
    </div>
    </form>
</body>
</html>
