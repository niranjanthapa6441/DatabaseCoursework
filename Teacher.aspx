<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Teacher.aspx.cs" Inherits="DatabaseCoursework.Teacher" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="PERSON_ID">
            <Columns>
                <asp:BoundField DataField="PERSON_ID" HeaderText="PERSON_ID" SortExpression="PERSON_ID" ReadOnly="True" />
                <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                <asp:BoundField DataField="COLLEGE_EMAIL" HeaderText="COLLEGE_EMAIL" SortExpression="COLLEGE_EMAIL" />
                <asp:BoundField DataField="JOINING_DATE" HeaderText="JOINING_DATE" SortExpression="JOINING_DATE" />
                <asp:BoundField DataField="SALARY" HeaderText="SALARY" SortExpression="SALARY" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" 
            SelectCommand="SELECT &quot;PERSON_ID&quot;, &quot;ID&quot;, &quot;COLLEGE_EMAIL&quot;, &quot;JOINING_DATE&quot;, &quot;SALARY&quot; FROM &quot;TEACHER&quot;"></asp:SqlDataSource>
        <br />
        <br />
        <asp:FormView ID="FormView2" runat="server" DataKeyNames="PERSON_ID" DataSourceID="SqlDataSource3">
            <EditItemTemplate>
                PERSON_ID:
                <asp:Label ID="PERSON_IDLabel1" runat="server" Text='<%# Eval("PERSON_ID") %>' />
                <br/>
                ID:
                <asp:TextBox ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />
                <br />
                COLLEGE_EMAIL:
                <asp:TextBox ID="COLLEGE_EMAILTextBox" runat="server" Text='<%# Bind("COLLEGE_EMAIL") %>' />
                <br />
                JOINING_DATE:
                <asp:TextBox ID="JOINING_DATETextBox" runat="server" Text='<%# Bind("JOINING_DATE") %>' />
                <br />
                SALARY:
                <asp:TextBox ID="SALARYTextBox" runat="server" Text='<%# Bind("SALARY") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                PERSON_ID:
                <asp:TextBox ID="PERSON_IDTextBox" runat="server" Text='<%# Bind("PERSON_ID") %>' />
                <br />
                ID:
                <asp:TextBox ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />
                <br />
                COLLEGE_EMAIL:
                <asp:TextBox ID="COLLEGE_EMAILTextBox" runat="server" Text='<%# Bind("COLLEGE_EMAIL") %>' />
                <br />
                JOINING_DATE:
                <asp:TextBox ID="JOINING_DATETextBox" runat="server" Text='<%# Bind("JOINING_DATE") %>' />
                <br />
                SALARY:
                <asp:TextBox ID="SALARYTextBox" runat="server" Text='<%# Bind("SALARY") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                PERSON_ID:
                <asp:Label ID="PERSON_IDLabel" runat="server" Text='<%# Eval("PERSON_ID") %>' />
                <br />
                ID:
                <asp:Label ID="IDLabel" runat="server" Text='<%# Bind("ID") %>' />
                <br />
                COLLEGE_EMAIL:
                <asp:Label ID="COLLEGE_EMAILLabel" runat="server" Text='<%# Bind("COLLEGE_EMAIL") %>' />
                <br />
                JOINING_DATE:
                <asp:Label ID="JOINING_DATELabel" runat="server" Text='<%# Bind("JOINING_DATE") %>' />
                <br />
                SALARY:
                <asp:Label ID="SALARYLabel" runat="server" Text='<%# Bind("SALARY") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" 
            DeleteCommand="DELETE FROM &quot;TEACHERS&quot; WHERE &quot;PERSONS_ID&quot; = :ID" 
            InsertCommand="INSERT INTO &quot;TEACHER&quot; (&quot;PERSON_ID&quot;, &quot;ID&quot;, &quot;COLLEGE_EMAIL&quot;, &quot;JOINING_DATE&quot;, &quot;SALARY&quot;) VALUES (:PERSON_ID, :ID, :COLLEGE_EMAIL, :JOINING_DATE, :SALARY)" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" 
            SelectCommand="SELECT &quot;PERSON_ID&quot;, &quot;ID&quot;, &quot;COLLEGE_EMAIL&quot;, &quot;JOINING_DATE&quot;, &quot;SALARY&quot; FROM &quot;TEACHER&quot;" 
            UpdateCommand="UPDATE &quot;TEACHER&quot; SET &quot;ID&quot; = :ID, &quot;COLLEGE_EMAIL&quot; = :COLLEGE_EMAIL, &quot;JOINING_DATE&quot; = :JOINING_DATE, &quot;SALARY&quot; = :SALARY WHERE &quot;PERSONS_ID&quot; = :PERSONS_ID">
            <DeleteParameters>
                <asp:Parameter Name="PERSONS_ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="PERSONS_ID" Type="String" />
                <asp:Parameter Name="ID" Type="String" />
                <asp:Parameter Name="COLLEGE_EMAIL" Type="String" />
                <asp:Parameter Name="JOINING_DATE" Type="DateTime" />
                <asp:Parameter Name="SALARY" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ID" Type="String" />
                <asp:Parameter Name="COLLEGE_EMAIL" Type="String" />
                <asp:Parameter Name="JOINING_DATE" Type="DateTime" />
                <asp:Parameter Name="SALARY" Type="Decimal" />
                <asp:Parameter Name="PERSONS_ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:FormView ID="FormView3" runat="server" DataKeyNames="PERSON_ID,ADDRESS_ID" DataSourceID="SqlDataSource4">
            <EditItemTemplate>
                PERSON_ID:
                <asp:Label ID="PERSON_IDLabel1" runat="server" Text='<%# Eval("PERSON_ID") %>' />
                <br />
                ADDRESS_ID:
                <asp:Label ID="ADDRESS_IDLabel1" runat="server" Text='<%# Eval("ADDRESS_ID") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                PERSON_ID:
                <asp:TextBox ID="PERSON_IDTextBox" runat="server" Text='<%# Bind("PERSON_ID") %>' />
                <br />
                ADDRESS_ID:
                <asp:TextBox ID="ADDRESS_IDTextBox" runat="server" Text='<%# Bind("ADDRESS_ID") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                PERSON_ID:
                <asp:Label ID="PERSON_IDLabel" runat="server" Text='<%# Eval("PERSON_ID") %>' />
                <br />
                ADDRESS_ID:
                <asp:Label ID="ADDRESS_IDLabel" runat="server" Text='<%# Eval("ADDRESS_ID") %>' />
                <br />
                <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" 
            DeleteCommand="DELETE FROM &quot;PERSON_ADDRESS&quot; WHERE &quot;PERSON_ID&quot; = ? AND &quot;ADDRESS_ID&quot; = :ADDRESS_ID" 
            InsertCommand="INSERT INTO &quot;PERSON_ADDRESS&quot; (&quot;PERSON_ID&quot;, &quot;ADDRESS_ID&quot;) VALUES (?, ?)" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT &quot;PERSON_ID&quot;, &quot;ADDRESS_ID&quot; FROM &quot;PERSON_ADDRESS&quot;">
            <InsertParameters>
                <asp:Parameter Name="PERSONS_ID" Type="String" />
                <asp:Parameter Name="ADDRESS_ID" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
