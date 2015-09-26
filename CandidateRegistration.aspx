<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CandidateRegistration.aspx.cs" Inherits="CandidateRegistration" debug="true"%>

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
        <asp:Panel ID="Panel1" runat="server">
        <table class="style1">
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label1" runat="server" Text="Candidate Registration"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Full Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="nameTxtBox" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="nameTxtBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Constituency"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ConsList" runat="server" DataSourceID="SqlDataSource2" 
                        DataTextField="constituency" DataValueField="constituency">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ONPSConnectionString %>" 
                        SelectCommand="SELECT [constituency] FROM [electionDetails]">
                    </asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="ConsList" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
            <td>
            
                <asp:Label ID="Label7" runat="server" Text=" Date Of Birth [YYYY-MM-DD]"></asp:Label>
            
            </td>
            <td>
            
                <asp:TextBox ID="dobTxtBox" runat="server"></asp:TextBox>
            
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="dobTxtBox" ErrorMessage="*"></asp:RequiredFieldValidator>
            
            </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Sex"></asp:Label>
                </td>
                <td>
                    <asp:RadioButtonList ID="sexRdBtnLst" runat="server">
                        <asp:ListItem>Female</asp:ListItem>
                        <asp:ListItem>Male</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="sexRdBtnLst" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Party"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="partyList" runat="server" 
                        DataSourceID="SqlDataSource1" DataTextField="partyName" 
                        DataValueField="partyId">
                        <asp:ListItem Value="0">--Select--</asp:ListItem>
                    </asp:DropDownList>
                    <asp:CustomValidator ID="partyListValidator" runat="server" 
                        ErrorMessage="Please select party" ControlToValidate="partyList" 
                        onservervalidate="partyListValidator_ServerValidate"></asp:CustomValidator>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ONPSConnectionString %>" 
                        SelectCommand="SELECT * FROM [partyDetails]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
            <td>
                <asp:Label ID="Label9" runat="server" Text="Email id"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="emailTxtBox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="emailTxtBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="emailTxtBox" ErrorMessage="Invalid Email Id" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Promises"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="promiseTxtBox" runat="server" Rows="5"></asp:TextBox>
                    <asp:Button ID="AddPromiseBtn" runat="server" Text="Add" 
                        onclick="AddPromiseBtn_Click" CausesValidation="False" 
                         />
&nbsp;
                    <asp:BulletedList ID="PromiseList" runat="server">
                    </asp:BulletedList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="Upload Photo"></asp:Label>
                </td>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <asp:Label ID="uploadMsg" runat="server"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="FileUpload1" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="RegisterBtn" runat="server" Text="Register" 
                        onclick="RegisterBtn_Click" />
                    <asp:Label ID="successfulRegMsg" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    &nbsp;</td>
            </tr>
        </table>
        </asp:Panel>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Move To Login Page</asp:HyperLink>
    </div>
    </form>
</body>
</html>
