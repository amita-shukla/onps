<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CandHome.aspx.cs" Inherits="CandHome" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:HyperLink ID="HyperLink1" runat="server">Change Password</asp:HyperLink>
        <br />
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/AddPromises.aspx">Add Promises</asp:HyperLink>
    
    </div>
    <asp:HyperLink ID="HyperLink3" runat="server" 
        NavigateUrl="~/AnswerQuestions.aspx">Answer the Questions asked by public</asp:HyperLink>
    <br />
    <br />
    <asp:Button ID="LogoutBtn" runat="server" onclick="LogoutBtn_Click" 
        Text="Logout" />
    </form>
</body>
</html>
