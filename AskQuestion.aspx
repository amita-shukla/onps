<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AskQuestion.aspx.cs" Inherits="AskQuestion" Debug="true"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ONPSConnectionString %>" 
            
            SelectCommand="SELECT [name], [candidateID] FROM [candidates] WHERE ([status] = @status)">
            <SelectParameters>
                <asp:Parameter DefaultValue="approved" Name="status" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="candidateID" DataSourceID="SqlDataSource2" 
            EnableModelValidation="True">
            <Columns>
                <asp:TemplateField HeaderText="Ask To">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="name" HeaderText="Candidate Name" 
                    SortExpression="name" />
                <asp:BoundField DataField="partyName" HeaderText="Party" 
                    SortExpression="partyName" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("photopath") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
    
    </div>
    <asp:TextBox ID="QuesTxtBox" runat="server" Rows="5" TextMode="MultiLine" 
        Width="389px"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="PostQuesBtn" runat="server" onclick="PostQuesBtn_Click" 
        Text="Post Your Question" />
    <br />
    <br />
    <asp:Label ID="MsgLbl" runat="server"></asp:Label>
    <br />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/VoterHome.aspx">Go to Home Page</asp:HyperLink>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ONPSConnectionString %>" SelectCommand="SELECT DISTINCT c.candidateID, p.partyName,  c.name, c.photopath
FROM candidates AS c JOIN partyDetails AS p
ON c.partyId=p.partyId
WHERE c.constituency=@constituency and c.status='approved'">
        <SelectParameters>
            <asp:SessionParameter Name="constituency" SessionField="constituency" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
