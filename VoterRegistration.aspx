<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VoterRegistration.aspx.cs" Inherits="VoterRegistration" Debug="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 26px;
        }
        .style3
        {
            height: 30px;
        }
    </style>
</head>
<body>
    <asp:Panel ID="Panel1" runat="server">
    <form id="form1" runat="server" >
    <div>
        <table class="style1">
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label1" runat="server" Text="Registration Form"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="margin-left: 80px">
                    <asp:Label ID="Label2" runat="server" Text="Full Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="nameTxtBox" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="*" ControlToValidate="nameTxtBox"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:Label ID="Label3" runat="server" Text="Date Of Birth [YYYY-MM-DD]"></asp:Label>
                </td>
                <td class="style3">
                    <asp:TextBox ID="dobTxtBox" runat="server" ToolTip="YYYY-MM-DD"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="*" ControlToValidate="dobTxtBox">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Sex"></asp:Label>
                </td>
                <td>
                    <asp:RadioButtonList ID="sexRadBtnList" runat="server" Height="51px">
                        <asp:ListItem>Female</asp:ListItem>
                        <asp:ListItem>Male</asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="*" ControlToValidate="sexRadBtnList"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Father's Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="fnameTxtBox" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ErrorMessage="*" ControlToValidate="fnameTxtBox"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Constituency"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="consList" runat="server" DataSourceID="SqlDataSource1" 
                        DataTextField="constituency" DataValueField="constituency">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ErrorMessage="*" ControlToValidate="consList"></asp:RequiredFieldValidator>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ONPSConnectionString %>" 
                        SelectCommand="SELECT [constituency] FROM [electionDetails]">
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="Address"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="addressTxtBox" runat="server" Rows="3" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ErrorMessage="*" ControlToValidate="addressTxtBox"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="E-Mail Id"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="emailTxtBox" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="emailTxtBox" ErrorMessage="Invalid e-mail id" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label9" runat="server" Text="Phone Number"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="phnoTxtBox" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style2" >
                    <asp:Label ID="Label10" runat="server" Text="Upload Photo"></asp:Label>
                </td>
                    <td class="style2">
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                            ErrorMessage="*" ControlToValidate="FileUpload1"></asp:RequiredFieldValidator>
                        <asp:Label ID="uploadMsg" runat="server"></asp:Label>
                    </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="SubmitBtn" runat="server" Text="Submit" onclick="SubmitBtn_Click" 
                        />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
    </asp:Panel>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Move to Login Page</asp:HyperLink>
    <br />
    <asp:Label ID="VoterIdLbl" runat="server"></asp:Label>
    <br />
    <asp:Label ID="PasswordLbl" runat="server"></asp:Label>
    <br />
    <asp:Label ID="SuccessfulRegMsg" runat="server"></asp:Label>   
   
</body>
</html>
