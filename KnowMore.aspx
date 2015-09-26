<%@ Page Language="C#" AutoEventWireup="true" CodeFile="KnowMore.aspx.cs" Inherits="KnowMore" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 50%;
        }
        .style2
        {
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ONPSConnectionString %>" SelectCommand="SELECT DISTINCT p.partyName, p.partySymbol, c.candidateID, c.name, c.promises, c.sex, c.dob, c.email, c.photopath, c.constituency
FROM candidates AS c
    JOIN partyDetails AS p 
    ON c.partyId = p.partyId
WHERE c.candidateID=@candId">
            <SelectParameters>
                <asp:QueryStringParameter Name="candId" QueryStringField="candId" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    <table border="5px" class="style1" rules="all" title="About Me">
        <tr>
            <td class="style2" colspan="2">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label8" runat="server" Text="About Me"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label1" runat="server" Text="My Name: "></asp:Label>
            </td>
            <td>
                <asp:Label ID="NameLbl" runat="server"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Image ID="photoImg" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label2" runat="server" Text="Party"></asp:Label>
            </td>
            <td>
                <asp:Label ID="PartyLbl" runat="server"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Image ID="PartySymbLbl" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label3" runat="server" Text="Sex:"></asp:Label>
            </td>
            <td>
                <asp:Label ID="SexLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label4" runat="server" Text="Age"></asp:Label>
            </td>
            <td>
                <asp:Label ID="AgeLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label5" runat="server" Text="Email"></asp:Label>
            </td>
            <td>
                <asp:Label ID="EmailLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label6" runat="server" Text="Constituency"></asp:Label>
            </td>
            <td>
                <asp:Label ID="ConsLbl" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label7" runat="server" Text="My Promises"></asp:Label>
            </td>
            <td>
                <asp:BulletedList ID="PromiseList" runat="server">
                </asp:BulletedList>
            </td>
        </tr>
    </table>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/VoterHome.aspx">Go to Home Page</asp:HyperLink>
    </form>
</body>
</html>
