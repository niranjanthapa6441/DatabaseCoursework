<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Address.aspx.cs" Inherits="DatabaseCoursework.Address" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" 
                DeleteCommand="DELETE FROM &quot;ADDRESS&quot; WHERE &quot;ID&quot; = :ID" 
                InsertCommand="INSERT INTO &quot;ADDRESS&quot; (&quot;COUNTRY&quot;, &quot;ID&quot;, &quot;STATE&quot;, &quot;CITY&quot;, &quot;STREET&quot;) VALUES (:Country, :ID, :STATE, :CITY, :STREET)" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" 
                SelectCommand="SELECT &quot;COUNTRY&quot;, &quot;ID&quot;, &quot;STATE&quot;, &quot;CITY&quot;, &quot;STREET&quot; FROM &quot;ADDRESS&quot;" 
                UpdateCommand="UPDATE &quot;ADDRESS&quot; SET &quot;COUNTRY&quot; = :COUNTRY, &quot;STATE&quot; = :STATE, &quot;CITY&quot; = :CITY, &quot;STREET&quot; = :STREET WHERE &quot;ID&quot; = :ID">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="COUNTRY" Type="String" />
                    <asp:Parameter Name="ID" Type="String" />
                    <asp:Parameter Name="STATE" Type="String" />
                    <asp:Parameter Name="CITY" Type="String" />
                    <asp:Parameter Name="STREET" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="COUNTRY" Type="String" />
                    <asp:Parameter Name="STATE" Type="String" />
                    <asp:Parameter Name="CITY" Type="String" />
                    <asp:Parameter Name="STREET" Type="String" />
                    <asp:Parameter Name="ID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="COUNTRY" HeaderText="COUNTRY" SortExpression="COUNTRY" />
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="STATE" HeaderText="STATE" SortExpression="STATE" />
                    <asp:BoundField DataField="CITY" HeaderText="CITY" SortExpression="CITY" />
                    <asp:BoundField DataField="STREET" HeaderText="STREET" SortExpression="STREET" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1">
                <InsertItemTemplate>
                    COUNTRY:
                    <asp:TextBox ID="COUNTRYTextBox" runat="server" Text='<%# Bind("COUNTRY") %>' />
                    <br />
                    ID:
                    <asp:TextBox ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />
                    <br />
                    STATE:
                    <asp:TextBox ID="STATETextBox" runat="server" Text='<%# Bind("STATE") %>' />
                    <br />
                    CITY:
                    <asp:TextBox ID="CITYTextBox" runat="server" Text='<%# Bind("CITY") %>' />
                    <br />
                    STREET:
                    <asp:TextBox ID="STREETTextBox" runat="server" Text='<%# Bind("STREET") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" />
                </ItemTemplate>
            </asp:FormView>
        </div>
    </form>
</body>
</html>
