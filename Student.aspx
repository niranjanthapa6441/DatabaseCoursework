<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="DatabaseCoursework.Student" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Studen</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames="PERSON_ID">
                <Columns>
                    <asp:BoundField DataField="PERSON_ID" HeaderText="PERSON_ID" SortExpression="PERSON_ID" ReadOnly="True" />
                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                    <asp:BoundField DataField="COLLEGE_EMAIL" HeaderText="COLLEGE_EMAIL" SortExpression="COLLEGE_EMAIL" />
                    <asp:BoundField DataField="JOINING_DATE" HeaderText="JOINING_DATE" SortExpression="JOINING_DATE" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT &quot;PERSON_ID&quot;, &quot;ID&quot;, &quot;COLLEGE_EMAIL&quot;, &quot;JOINING_DATE&quot; FROM &quot;STUDENT&quot;"></asp:SqlDataSource>
            <br />
            <br />
            <asp:FormView ID="FormView2" runat="server" DataKeyNames="PERSON_ID" DataSourceID="SqlDataSource3" OnPageIndexChanging="FormView2_PageIndexChanging">
                <EditItemTemplate>
                    ID:
                    <asp:TextBox ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />
                    <br />
                    COLLEGE_EMAIL:
                    <asp:TextBox ID="COLLEGE_EMAILTextBox" runat="server" Text='<%# Bind("COLLEGE_EMAIL") %>' />
                    <br />
                    JOINING_DATE:
                    <asp:TextBox ID="JOINING_DATETextBox" runat="server" Text='<%# Bind("JOINING_DATE") %>' />
                    <br />
                    PERSON_ID:
                    <asp:Label ID="PERSON_IDLabel1" runat="server" Text='<%# Eval("PERSON_ID") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    ID:
                    <asp:TextBox ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />
                    <br />
                    COLLEGE_EMAIL:
                    <asp:TextBox ID="COLLEGE_EMAILTextBox" runat="server" Text='<%# Bind("COLLEGE_EMAIL") %>' />
                    <br />
                    JOINING_DATE:
                    <asp:TextBox ID="JOINING_DATETextBox" runat="server" Text='<%# Bind("JOINING_DATE") %>' />
                    <br />
                    PERSON_ID:
                    <asp:TextBox ID="PERSON_IDTextBox" runat="server" Text='<%# Bind("PERSON_ID") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    ID:
                    <asp:Label ID="IDLabel" runat="server" Text='<%# Bind("ID") %>' />
                    <br />
                    COLLEGE_EMAIL:
                    <asp:Label ID="COLLEGE_EMAILLabel" runat="server" Text='<%# Bind("COLLEGE_EMAIL") %>' />
                    <br />
                    JOINING_DATE:
                    <asp:Label ID="JOINING_DATELabel" runat="server" Text='<%# Bind("JOINING_DATE") %>' />
                    <br />
                    PERSON_ID:
                    <asp:Label ID="PERSON_IDLabel" runat="server" Text='<%# Eval("PERSON_ID") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" 
                DeleteCommand="DELETE FROM &quot;STUDENT&quot; WHERE &quot;ID&quot; = :ID" 
                InsertCommand="INSERT INTO &quot;STUDENT&quot; (&quot;ID&quot;, &quot;COLLEGE_EMAIL&quot;, &quot;JOINING_DATE&quot;, &quot;PERSON_ID&quot;) VALUES (:ID, :COLLEGE_EMAIL, :JOINING_DATE, :PERSON_ID)" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT &quot;ID&quot;, &quot;COLLEGE_EMAIL&quot;, &quot;JOINING_DATE&quot;, &quot;PERSON_ID&quot; FROM &quot;STUDENT&quot;" UpdateCommand="UPDATE &quot;STUDENT&quot; SET &quot;COLLEGE_EMAIL&quot; = ?, &quot;JOINING_DATE&quot; = ?, &quot;PERSON_ID&quot; = ? WHERE &quot;ID&quot; = ?">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID" Type="String" />
                    <asp:Parameter Name="COLLEGE_EMAIL" Type="String" />
                    <asp:Parameter Name="JOINING_DATE" Type="DateTime" />
                    <asp:Parameter Name="PERSONS_ID" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="COLLEGE_EMAIL" Type="String" />
                    <asp:Parameter Name="JOINING_DATE" Type="DateTime" />
                    <asp:Parameter Name="PERSONS_ID" Type="String" />
                    <asp:Parameter Name="ID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <asp:FormView ID="FormView4" runat="server" DataKeyNames="PERSON_ID,ADDRESS_ID" DataSourceID="SqlDataSource6">
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
            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" 
                DeleteCommand="DELETE FROM &quot;PERSON_ADDRESS&quot; WHERE &quot;PERSON_ID&quot; = ? AND &quot;ADDRESS_ID&quot; = ?" 
                InsertCommand="INSERT INTO &quot;PERSON_ADDRESS&quot; (&quot;PERSON_ID&quot;, &quot;ADDRESS_ID&quot;) VALUES (:PERSONS_ID, :ADDRESS_ID)" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT &quot;PERSON_ID&quot;, &quot;ADDRESS_ID&quot; FROM &quot;PERSON_ADDRESS&quot;">
                <DeleteParameters>
                    <asp:Parameter Name="PERSONS_ID" Type="String" />
                    <asp:Parameter Name="ADDRESS_ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="PERSONS_ID" Type="String" />
                    <asp:Parameter Name="ADDRESS_ID" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
            <br />
            <asp:FormView ID="FormView5" runat="server" DataKeyNames="STUDENT_PERSON_ID,MODULE_ID" DataSourceID="SqlDataSource5">
                <EditItemTemplate>
                    STUDENT_PERSON_ID:
                    <asp:Label ID="STUDENT_PERSON_IDLabel1" runat="server" Text='<%# Eval("STUDENT_PERSON_ID") %>' />
                    <br />
                    MODULE_ID:
                    <asp:Label ID="MODULE_IDLabel1" runat="server" Text='<%# Eval("MODULE_ID") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    STUDENT_PERSON_ID:
                    <asp:TextBox ID="STUDENT_PERSON_IDTextBox" runat="server" Text='<%# Bind("STUDENT_PERSON_ID") %>' />
                    <br />
                    MODULE_ID:
                    <asp:TextBox ID="MODULE_IDTextBox" runat="server" Text='<%# Bind("MODULE_ID") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    STUDENT_PERSON_ID:
                    <asp:Label ID="STUDENT_PERSON_IDLabel" runat="server" Text='<%# Eval("STUDENT_PERSON_ID") %>' />
                    <br />
                    MODULE_ID:
                    <asp:Label ID="MODULE_IDLabel" runat="server" Text='<%# Eval("MODULE_ID") %>' />
                    <br />
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" 
                InsertCommand="INSERT INTO &quot;STUDENT_MODULE&quot; ( &quot;STUDENT_PERSON_ID&quot;, &quot;MODULE_ID&quot;) VALUES (:STUDENT_PERSON_ID, :MODULE_ID)" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_PERSON_ID&quot;, &quot;MODULE_ID&quot; FROM &quot;STUDENT_MODULE&quot;">
                <InsertParameters>
                    <asp:Parameter Name="ID" Type="Decimal" />
                    <asp:Parameter Name="STUDENTS_PERSONS_ID" Type="String" />
                    <asp:Parameter Name="MODULES_ID" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
            <br />
        </div>
    </form>
</body>
</html>
