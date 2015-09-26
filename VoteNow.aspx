<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VoteNow.aspx.cs" Inherits="VoteNow" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function CheckOtherIsCheckedByGVID(rb) {
            var isChecked = rb.checked;
            var row = rb.parentNode.parentNode;
            if (isChecked) {
                row.style.backgroundColor = '#B6C4DE';
                row.style.color = 'black';
            }
            var currentRdbID = rb.id;
            parent = document.getElementById("<%= GridView1.ClientID %>");
            var items = parent.getElementsByTagName('input');

            for (i = 0; i < items.length; i++) {
                if (items[i].id != currentRdbID && items[i].type == "radio") {
                    if (items[i].checked) {
                        items[i].checked = false;
                        items[i].parentNode.parentNode.style.backgroundColor = 'white';
                        items[i].parentNode.parentNode.style.color = '#696969';
                    }
                }
            }
        }

        function ValidateRadioButton(sender, args) {
            var gv = document.getElementById("<%= GridView1.ClientID %>");
            var items = gv.getElementsByTagName('input');
            for (var i = 0; i < items.length; i++) {
                if (items[i].type == "radio") {
                    if (items[i].checked) {
                        args.IsValid = true;
                        return;
                    }
                    else {
                        args.IsValid = false;
                    }
                }
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="candidateID,totalVotes" DataSourceID="SqlDataSource1" 
            EnableModelValidation="True" ShowFooter="True" 
            >
            <Columns>
                <asp:TemplateField HeaderText="Select">
                    <FooterTemplate>
                        <asp:Button ID="VoteBtn" runat="server" onclick="VoteBtn_Click" Text="Vote" />
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:RadioButton ID="rb" runat="server" GroupName="SelectCand" 
                            onclick="javascript:CheckOtherIsCheckedByGVID(this);" 
                             />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="partyName" HeaderText="partyName" 
                    SortExpression="partyName" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ONPSConnectionString %>" SelectCommand="SELECT DISTINCT p.partyName, c.candidateID, c.name, c.totalVotes
FROM candidates AS c JOIN partyDetails AS p
ON c.partyId=p.partyId
WHERE c.constituency=@constituency and c.status='approved'" 
            UpdateCommand="update candidates set totalVotes=@totalVotes where candidateID=@candidateID">
            <SelectParameters>
                <asp:SessionParameter Name="constituency" SessionField="constituency" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="totalVotes" />
                <asp:Parameter Name="candidateID" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Please select a candidate" ClientValidationFunction="ValidateRadioButton"></asp:CustomValidator>
        <br />
        <br />
    </div>
    <asp:Label ID="TestLbl" runat="server"></asp:Label>
    </form>
</body>
</html>
