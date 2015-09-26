<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VoterHome.aspx.cs" Inherits="VoterHome" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Panel ID="PendingStatusPanel" runat="server" Visible="False">
            <asp:Label ID="pendingStatusLbl" runat="server"></asp:Label>
            <br />
        </asp:Panel>
    
    </div>
    <asp:Panel ID="ApprovedStatusPanel" runat="server" Visible="False">
        <asp:Label ID="approvedStatusLbl" runat="server"></asp:Label>
        <br />
        <asp:Label ID="msgLbl" runat="server"></asp:Label>
        <br />
        <asp:HyperLink ID="HyperLink2" runat="server" 
            NavigateUrl="~/ChangePassword.aspx">Change Password</asp:HyperLink>
        <br />
        <asp:Button ID="voteBtn" runat="server" Text="Cast Vote" Visible="False" 
            onclick="voteBtn_Click" />
        <br />
        <asp:Label ID="VoteMsg" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Panel ID="BeforeElectionPanel" runat="server" Visible="False">
            <asp:DataList ID="CandList" runat="server" Caption="Know Your Candidates" 
                DataKeyField="partyID" DataSourceID="SqlDataSource1" GridLines="Both" 
                RepeatColumns="4">
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("photopath") %>' />
                    <br />
                    My Name:
                    <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                    <br />
                    &nbsp;<asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("partySymbol") %>' />
                    <br />
                    Party:
                    <asp:Label ID="partyNameLabel" runat="server" Text='<%# Eval("partyName") %>' />
                    <br />
                    Standing from
                    <asp:Label ID="constituencyLabel" runat="server" 
                        Text='<%# Eval("constituency") %>' />
                    <br />
                    Was Born On:
                    <asp:Label ID="dobLabel" runat="server" Text='<%# Eval("dob") %>' />
                    <br />
                    Mail me at:
                    <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                    <br />
                    <asp:Button ID="KnowMoreBtn" runat="server" onclick="KnowMoreBtn_Click1" CommandArgument='<%# Eval("CandidateID") %>' 
                        Text="Know More About Me&gt;&gt;" />
                    <br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ONPSConnectionString %>" SelectCommand="SELECT DISTINCT p.partyName, p.partySymbol, p.partyId AS partyID, c.candidateID, c.name, c.sex, c.dob, c.email, c.photopath, c.constituency
FROM candidates AS c
    JOIN partyDetails AS p 
    ON c.partyId = p.partyId
WHERE c.constituency = @constituency and c.status='approved'">
                <SelectParameters>
                    <asp:SessionParameter Name="constituency" SessionField="constituency" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                Caption="Question Asked To the Candidates" DataSourceID="SqlDataSource2" 
                EnableModelValidation="True">
                <Columns>
                    <asp:BoundField DataField="name" HeaderText="Asked To" SortExpression="name" />
                    <asp:BoundField DataField="question" HeaderText="Question" 
                        SortExpression="question" />
                    <asp:BoundField DataField="answer" HeaderText="Answer" 
                        SortExpression="answer" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ONPSConnectionString %>" SelectCommand="SELECT c.name , q.question , q.answer
FROM candidates as c JOIN questions as q
ON c.candidateID = q.askedTo"></asp:SqlDataSource>
            <br />
            <asp:Button ID="AskQuesBtn" runat="server" onclick="Button1_Click" 
                Text="Ask A Question" />
        </asp:Panel>
        <asp:Panel ID="AfterElectionPanel" runat="server" Visible="False">
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                Caption="Election Results" DataSourceID="SqlDataSource3" 
                EnableModelValidation="True">
                <Columns>
                    <asp:BoundField DataField="Election Date" HeaderText="Election Date" 
                        SortExpression="Election Date" />
                    <asp:BoundField DataField="By" HeaderText="By" 
                        SortExpression="By" />
                    <asp:BoundField DataField="Winner Party" HeaderText="Winner Party" 
                        SortExpression="Winner Party" />
                    <asp:BoundField DataField="Winner Candidate" HeaderText="Winner Candidate" 
                        SortExpression="Winner Candidate" />
                    <asp:BoundField DataField="From Constituency" HeaderText="From Constituency" 
                        SortExpression="From Constituency" />
                    
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ONPSConnectionString %>" 
                
                SelectCommand="SELECT [date] as 'Election Date', [numberOfVotes] as 'By', [winningParty] as 'Winner Party', [winningCandidate] as 'Winner Candidate', [constituency] as 'From Constituency'  FROM [electionDetails] WHERE ([upload] = @upload and [winningCandidate] is not null)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="yes" Name="upload" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:Panel>
    </asp:Panel>
    <asp:Button ID="LogoutBtn" runat="server" Text="Logout" 
        onclick="LogoutBtn_Click" />
    </form>
</body>
</html>
