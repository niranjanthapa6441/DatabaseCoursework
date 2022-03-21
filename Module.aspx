<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Module.aspx.cs" Inherits="DatabaseCoursework.Module" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Module</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container">
                <br />
                <asp:GridView CSSClass="table table-striped table-borderless table-hover" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="Id" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="MODULE_NAME" HeaderText="Module Name" SortExpression="MODULE_NAME" />
                    <asp:BoundField DataField="MODULE_CODE" HeaderText="Module Code" SortExpression="MODULE_CODE" />
                    <asp:BoundField DataField="CREDIT_HOURS" HeaderText="Credit Hours" SortExpression="CREDIT_HOURS" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
            </asp:GridView>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1">
                <InsertItemTemplate>
                    Id:
                    <asp:TextBox CSSClass="form-control" ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />
                    <br />
                    Module Name:
                    <asp:TextBox CSSClass="form-control" ID="MODULE_NAMETextBox" runat="server" Text='<%# Bind("MODULE_NAME") %>' />
                    <br />
                    Module Code:
                    <asp:TextBox CSSClass="form-control" ID="MODULE_CODETextBox" runat="server" Text='<%# Bind("MODULE_CODE") %>' />
                    <br />
                    Credit Hours:
                    <asp:TextBox CSSClass="form-control" ID="CREDIT_HOURSTextBox" runat="server" Text='<%# Bind("CREDIT_HOURS") %>' />
                    <br />
                    <asp:LinkButton CSSClass="btn btn-success" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton CSSClass="btn btn-success" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton CSSClass="btn btn-dark" ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" />
                </ItemTemplate>
            </asp:FormView>
            </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" 
                DeleteCommand="DELETE FROM &quot;MODULE&quot; WHERE &quot;ID&quot; = :ID" 
                InsertCommand="INSERT INTO &quot;MODULE&quot; (&quot;ID&quot;, &quot;MODULE_NAME&quot;, &quot;MODULE_CODE&quot;, &quot;CREDIT_HOURS&quot;) VALUES (:ID, :MODULE_NAME, :MODULE_CODE, :CREDIT_HOURS)" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" 
                SelectCommand="SELECT &quot;ID&quot;, &quot;MODULE_NAME&quot;, &quot;MODULE_CODE&quot;, &quot;CREDIT_HOURS&quot; FROM &quot;MODULE&quot;" 
                UpdateCommand="UPDATE &quot;MODULE&quot; SET &quot;MODULE_NAME&quot; = :MODULE_NAME, &quot;MODULE_CODE&quot; = :MODULE_CODE, &quot;CREDIT_HOURS&quot; = :CREDIT_HOURS WHERE &quot;ID&quot; = :ID">
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
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>
