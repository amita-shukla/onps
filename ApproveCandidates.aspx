<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ApproveCandidates.aspx.cs" Inherits="ApproveCandiates" debug="true"%>

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
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AdminPanel.aspx">Go to Admin Panel</asp:HyperLink>
        <br />
    
        <asp:Label ID="PendingRequestLbl" runat="server"></asp:Label>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" EnableModelValidation="True" 
            ShowFooter="True" DataKeyNames="candidateID">
            <Columns>
                <asp:TemplateField>
                    <FooterTemplate>
                        <asp:Button ID="AcceptBtn" runat="server" onclick="AcceptBtn_Click" 
                            Text="Accept" />
                        &nbsp;
                        <asp:Button ID="RejectBtn" runat="server" onclick="RejectBtn_Click" 
                            Text="Reject" />
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="dob" HeaderText="dob" SortExpression="dob" />
                <asp:BoundField DataField="sex" HeaderText="sex" SortExpression="sex" />
                <asp:BoundField DataField="promises" HeaderText="promises" 
                    SortExpression="promises" />
                <asp:BoundField DataField="partyId" HeaderText="partyId" 
                    SortExpression="partyId" />
                
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:TemplateField HeaderText="Photo">
                    <FooterTemplate>
                        &nbsp;&nbsp;
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("photopath") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ONPSConnectionString %>" 
             SelectCommand="SELECT [candidateID], [name], [dob], [sex], [promises], [partyId], [email], [photoPath] FROM [candidates] WHERE ([status] = @status)" 
            UpdateCommand="update candidates set status=@status where candidateID=@candidateID">
            <SelectParameters>
                <asp:Parameter DefaultValue="pending" Name="status" Type="String" />
            </SelectParameters>

            <UpdateParameters>
                <asp:Parameter Name="status" />
                <asp:Parameter Name="candidateID" />
            </UpdateParameters>

        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
