<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ApproveApplicants.aspx.cs" Inherits="ApproveApplicants" Debug="true"%>

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
            ShowFooter="True" DataKeyNames="voterId">
            <Columns>
                <asp:TemplateField>
                    <FooterTemplate>
                        <asp:Button ID="acceptBtn" runat="server" onclick="acceptBtn_Click" 
                            Text="Accept" />
                        &nbsp;&nbsp;
                        <asp:Button ID="rejectBtn" runat="server" Text="Reject" 
                            onclick="rejectBtn_Click" />
                    </FooterTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" />
                </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="dob" HeaderText="dob" SortExpression="dob" />
                <asp:BoundField DataField="sex" HeaderText="sex" SortExpression="sex" />
                <asp:BoundField DataField="fName" HeaderText="fName" SortExpression="fName" />
                <asp:BoundField DataField="pob" HeaderText="pob" SortExpression="pob" />
                <asp:BoundField DataField="address" HeaderText="address" 
                    SortExpression="address" />
                <asp:BoundField DataField="emailId" HeaderText="emailId" 
                    SortExpression="emailId" />
                <asp:BoundField DataField="phoneNo" HeaderText="phoneNo" 
                    SortExpression="phoneNo" />
                
                <asp:TemplateField HeaderText="Photo">
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("photoPath") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ONPSConnectionString %>" 
            SelectCommand="SELECT [name], [dob], [sex], [fName], [pob], [address], [emailId], [phoneNo], [voterId], [photoPath] FROM [Voter] WHERE ([status] = @status)" 
            UpdateCommand="update Voter set status=@status where voterid=@voterid">
            <SelectParameters>
                <asp:Parameter DefaultValue="pending" Name="status" Type="String" />
            </SelectParameters>

            <UpdateParameters>
                <asp:Parameter Name="status" />
                <asp:Parameter Name="voterid" />
            </UpdateParameters>

        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
