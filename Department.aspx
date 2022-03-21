<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Department.aspx.cs" Inherits="DatabaseCoursework.Department" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Department</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>
    <form id="form1" runat="server">
       <div>
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" 
            DeleteCommand="DELETE FROM &quot;DEPARTMENT&quot; WHERE &quot;ID&quot; = :ID" 
            InsertCommand="INSERT INTO &quot;DEPARTMENT&quot; (&quot;ID&quot;, &quot;DEPARTMENT_NAME&quot;, &quot;DEPARTMENT_CODE&quot;, &quot;STATUS&quot;) VALUES (:ID, :DEPARTMENT_NAME, :DEPARTMENT_CODE, :STATUS)" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" 
            SelectCommand="SELECT &quot;ID&quot;, &quot;DEPARTMENT_NAME&quot;, &quot;DEPARTMENT_CODE&quot;, &quot;STATUS&quot; FROM &quot;DEPARTMENT&quot;" 
            UpdateCommand="UPDATE &quot;DEPARTMENT&quot; SET &quot;DEPARTMENT_NAME&quot; = :DEPARTMENT_NAME, &quot;DEPARTMENT_CODE&quot; = :DEPARTMENT_CODE, &quot;STATUS&quot; = :STATUS WHERE &quot;ID&quot; = :ID">
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
           <br />
           <br />
           <div class="container">
               <asp:GridView CSSClass="table table-striped table-borderless table-hover" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="Id" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="DEPARTMENT_NAME" HeaderText="Department Name" SortExpression="DEPARTMENT_NAME" />
                <asp:BoundField DataField="DEPARTMENT_CODE" HeaderText="Department Code" SortExpression="DEPARTMENT_CODE" />
                <asp:BoundField DataField="STATUS" HeaderText="STATUS" SortExpression="Status" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
        </asp:GridView>
           </div>
        <div class="container">
        <asp:FormView ID="FormView2" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1">
            <InsertItemTemplate>
                Id:
                <asp:TextBox CSSClass="form-control" ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />
                <br />
                Department Name:
                <asp:TextBox CSSClass="form-control" ID="DEPARTMENT_NAMETextBox" runat="server" Text='<%# Bind("DEPARTMENT_NAME") %>' />
                <br />
                Department Code:
                <asp:TextBox CSSClass="form-control"  ID="DEPARTMENT_CODETextBox" runat="server" Text='<%# Bind("DEPARTMENT_CODE") %>' />
                <br />
                Status:
                <asp:TextBox CSSClass="form-control"  ID="STATUSTextBox" runat="server" Text='<%# Bind("STATUS") %>' />
                <br />
                <asp:LinkButton CSSClass="btn btn-success" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton CSSClass="btn btn-success" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:LinkButton CSSClass="btn btn-dark" ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" />
            </ItemTemplate>
        </asp:FormView>
        </div>
       </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>
