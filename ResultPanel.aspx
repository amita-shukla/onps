<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ResultPanel.aspx.cs" Inherits="ResultPanel" debug="true"%>

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
    <table class="style1">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Select Constituencies:"></asp:Label>
            </td>
            <td>
                <asp:CheckBoxList ID="ConsList" runat="server" DataSourceID="SqlDataSource1" 
                    DataTextField="constituency" DataValueField="constituency">
                </asp:CheckBoxList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ONPSConnectionString %>" 
                    SelectCommand="SELECT [constituency] FROM [electionDetails]">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="CalcResBtn" runat="server" onclick="CalcResBtn_Click" 
                    Text="Calculate Result" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridView1" runat="server">
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ONPSConnectionString %>" 
                    SelectCommand="SELECT date, constituency, winningCandidate, winningParty, numberOfVotes from electionDetails where winningCandidate is not null" 
                    UpdateCommand="update electionDetails set winningCandidate=@wCand, winningParty=@winP, numberOfVotes=@nov where constituency=@cons">
                    <UpdateParameters>
                        <asp:Parameter Name="wCand" />
                        <asp:Parameter Name="winP" />
                        <asp:Parameter Name="nov" />
                        <asp:Parameter Name="cons" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="UploadResBtn" runat="server" Text="Upload Result" 
                    onclick="UploadResBtn_Click" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <div>
    
        <asp:Label ID="MsgLabel" runat="server"></asp:Label>
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AdminPanel.aspx">Go to Admin Panel</asp:HyperLink>
    
    </div>
    </form>
</body>
</html>
