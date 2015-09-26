<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AnswerQuestions.aspx.cs" Inherits="AnswerQuestions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            AutoGenerateEditButton="True" DataKeyNames="questionId" 
            DataSourceID="SqlDataSource1" EnableModelValidation="True">
            <Columns>
                <asp:BoundField DataField="question" HeaderText="question" 
                    SortExpression="question" ReadOnly="true" />
                <asp:BoundField DataField="answer" HeaderText="answer" 
                    SortExpression="answer" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ONPSConnectionString %>" 
            SelectCommand="SELECT * FROM [questions] WHERE ([askedTo] = @askedTo)" 
            UpdateCommand="update questions set answer=@answer where questionId=@questionId ">
            <SelectParameters>
                <asp:SessionParameter Name="askedTo" SessionField="CandidateId" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="answer" />
                <asp:Parameter Name="questionId" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/CandHome.aspx">Go to Home Page</asp:HyperLink>
    </form>
</body>
</html>
