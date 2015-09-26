<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddPromises.aspx.cs" Inherits="AddPromises" debug="true"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="Add Promise:"></asp:Label>
        <br />
        <asp:TextBox ID="PromiseTxtBox" runat="server" Rows="2" TextMode="MultiLine"></asp:TextBox>
    
        <br />
        <asp:Button ID="AddPromise" runat="server" onclick="AddPromise_Click" 
            Text="ADD" />
    
    </div>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/CandHome.aspx">Go To Home Page</asp:HyperLink>
    </form>
</body>
</html>
