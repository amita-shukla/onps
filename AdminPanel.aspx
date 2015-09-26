<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminPanel.aspx.cs" Inherits="AdminPanel" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="loginStatusLbl" runat="server"></asp:Label>
        <br />
        <asp:Button ID="LogoutBtn" runat="server" onclick="LogoutBtn_Click" 
            Text="Logout" />
        <br />
        <br />
        <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/SetElection.aspx">Set Election</asp:HyperLink>
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" 
            NavigateUrl="~/ApproveApplicants.aspx">Approve Voter Applications</asp:HyperLink>
        <br />
        <asp:HyperLink ID="HyperLink4" runat="server" 
            NavigateUrl="~/ApproveCandidates.aspx">Approve Candidate Applications</asp:HyperLink>
        <br />
        <asp:HyperLink ID="HyperLink2" runat="server" 
            NavigateUrl="~/PartyRegistration.aspx">Register Party</asp:HyperLink>
        <br />
        <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/ResultPanel.aspx">Result Panel</asp:HyperLink>
    </div>
    </form>
</body>
</html>
