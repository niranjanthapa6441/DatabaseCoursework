<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Module.aspx.cs" Inherits="DatabaseCoursework.Module" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="ID" HeaderText="Id" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="MODULE_NAME" HeaderText="Module Name" SortExpression="MODULE_NAME" />
                    <asp:BoundField DataField="MODULE_CODE" HeaderText="Module Code" SortExpression="MODULE_CODE" />
                    <asp:BoundField DataField="CREDIT_HOURS" HeaderText="Credit Hours" SortExpression="CREDIT_HOURS" />
                </Columns>
            </asp:GridView>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1">
                <InsertItemTemplate>
                    Id:
                    <asp:TextBox ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />
                    <br />
                    Module Name:
                    <asp:TextBox ID="MODULE_NAMETextBox" runat="server" Text='<%# Bind("MODULE_NAME") %>' />
                    <br />
                    Module Code:
                    <asp:TextBox ID="MODULE_CODETextBox" runat="server" Text='<%# Bind("MODULE_CODE") %>' />
                    <br />
                    Credit Hours:
                    <asp:TextBox ID="CREDIT_HOURSTextBox" runat="server" Text='<%# Bind("CREDIT_HOURS") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" />
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" 
                DeleteCommand="DELETE FROM &quot;MODULES&quot; WHERE &quot;ID&quot; = :ID" 
                InsertCommand="INSERT INTO &quot;MODULES&quot; (&quot;ID&quot;, &quot;MODULE_NAME&quot;, &quot;MODULE_CODE&quot;, &quot;CREDIT_HOURS&quot;) VALUES (:ID, :MODULE_NAME, :MODULE_CODE, :CREDIT_HOURS)" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" 
                SelectCommand="SELECT &quot;ID&quot;, &quot;MODULE_NAME&quot;, &quot;MODULE_CODE&quot;, &quot;CREDIT_HOURS&quot; FROM &quot;MODULES&quot;" 
                UpdateCommand="UPDATE &quot;MODULES&quot; SET &quot;MODULE_NAME&quot; = :MODULE_NAME, &quot;MODULE_CODE&quot; = :MODULE_CODE, &quot;CREDIT_HOURS&quot; = :CREDIT_HOURS WHERE &quot;ID&quot; = :ID">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID" Type="String" />
                    <asp:Parameter Name="MODULE_NAME" Type="String" />
                    <asp:Parameter Name="MODULE_CODE" Type="String" />
                    <asp:Parameter Name="CREDIT_HOURS" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="MODULE_NAME" Type="String" />
                    <asp:Parameter Name="MODULE_CODE" Type="String" />
                    <asp:Parameter Name="CREDIT_HOURS" Type="String" />
                    <asp:Parameter Name="ID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
