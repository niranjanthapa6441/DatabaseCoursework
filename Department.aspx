<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Department.aspx.cs" Inherits="DatabaseCoursework.Department" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="ID" HeaderText="Id" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="DEPARTMENT_NAME" HeaderText="Department Name" SortExpression="DEPARTMENT_NAME" />
                <asp:BoundField DataField="DEPARTMENT_CODE" HeaderText="Department Code" SortExpression="DEPARTMENT_CODE" />
                <asp:BoundField DataField="STATUS" HeaderText="STATUS" SortExpression="Status" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" 
            DeleteCommand="DELETE FROM &quot;DEPARTMENTS&quot; WHERE &quot;ID&quot; = :ID" 
            InsertCommand="INSERT INTO &quot;DEPARTMENTS&quot; (&quot;ID&quot;, &quot;DEPARTMENT_NAME&quot;, &quot;DEPARTMENT_CODE&quot;, &quot;STATUS&quot;) VALUES (:ID, :DEPARTMENT_NAME, :DEPARTMENT_CODE, :STATUS)" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" 
            SelectCommand="SELECT &quot;ID&quot;, &quot;DEPARTMENT_NAME&quot;, &quot;DEPARTMENT_CODE&quot;, &quot;STATUS&quot; FROM &quot;DEPARTMENTS&quot;" 
            UpdateCommand="UPDATE &quot;DEPARTMENTS&quot; SET &quot;DEPARTMENT_NAME&quot; = :DEPARTMENT_NAME, &quot;DEPARTMENT_CODE&quot; = :DEPARTMENT_CODE, &quot;STATUS&quot; = :STATUS WHERE &quot;ID&quot; = :ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ID" Type="Decimal" />
                <asp:Parameter Name="DEPARTMENT_NAME" Type="String" />
                <asp:Parameter Name="DEPARTMENT_CODE" Type="String" />
                <asp:Parameter Name="STATUS" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="DEPARTMENT_NAME" Type="String" />
                <asp:Parameter Name="DEPARTMENT_CODE" Type="String" />
                <asp:Parameter Name="STATUS" Type="String" />
                <asp:Parameter Name="ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView2" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1">
            <InsertItemTemplate>
                Id:
                <asp:TextBox ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />
                <br />
                Department Name:
                <asp:TextBox ID="DEPARTMENT_NAMETextBox" runat="server" Text='<%# Bind("DEPARTMENT_NAME") %>' />
                <br />
                Department Code:
                <asp:TextBox ID="DEPARTMENT_CODETextBox" runat="server" Text='<%# Bind("DEPARTMENT_CODE") %>' />
                <br />
                Status:
                <asp:TextBox ID="STATUSTextBox" runat="server" Text='<%# Bind("STATUS") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" />
            </ItemTemplate>
        </asp:FormView>
    </form>
</body>
</html>
