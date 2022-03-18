<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="DatabaseCoursework.Student" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="COLLEGE_ID" HeaderText="COLLEGE_ID" SortExpression="COLLEGE_ID" />
                    <asp:BoundField DataField="NAME" HeaderText="NAME" ReadOnly="True" SortExpression="NAME" />
                    <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
                    <asp:BoundField DataField="PHONE_NUMBER" HeaderText="PHONE_NUMBER" SortExpression="PHONE_NUMBER" />
                    <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                    <asp:BoundField DataField="COLLEGE_EMAIL" HeaderText="COLLEGE_EMAIL" SortExpression="COLLEGE_EMAIL" />
                    <asp:BoundField DataField="JOINING_DATE" HeaderText="JOINING_DATE" SortExpression="JOINING_DATE" />
                    <asp:BoundField DataField="ADDRESS" HeaderText="ADDRESS" ReadOnly="True" SortExpression="ADDRESS" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT STUDENTS.ID AS COLLEGE_ID, PERSONS.FIRST_NAME || ' '||PERSONS.MIDDLE_NAME || ' '|| PERSONS.LAST_NAME AS NAME, PERSONS.EMAIL, PERSONS.PHONE_NUMBER, PERSONS.DATE_OF_BIRTH AS DOB, STUDENTS.COLLEGE_EMAIL, STUDENTS.JOINING_DATE, ADDRESS.STREET || ','||  ADDRESS.CITY|| ','||  ADDRESS.STATE || ','|| ADDRESS.COUNTRY  AS ADDRESS  FROM COURSEWORK.STUDENTS 
INNER JOIN COURSEWORK.PERSONS ON STUDENTS.PERSONS_ID = PERSONS.ID
JOIN COURSEWORK.PERSON_ADDRESS ON PERSONS.ID=PERSON_ADDRESS.PERSONS_ID
JOIN COURSEWORK.ADDRESS ON PERSON_ADDRESS.ADDRESS_ID = ADDRESS.ID"></asp:SqlDataSource>
            <br />
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource2">                    
                <InsertItemTemplate>
                    Id:
                    <asp:TextBox ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />
                    <br />
                    First Name:
                    <asp:TextBox ID="FIRST_NAMETextBox" runat="server" Text='<%# Bind("FIRST_NAME") %>' />
                    <br />
                    Middle Name:
                    <asp:TextBox ID="MIDDLE_NAMETextBox" runat="server" Text='<%# Bind("MIDDLE_NAME") %>' />
                    <br />
                    Last Name:
                    <asp:TextBox ID="LAST_NAMETextBox" runat="server" Text='<%# Bind("LAST_NAME") %>' />
                    <br />
                    Email:
                    <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' />
                    <br />
                    Phone Number:
                    <asp:TextBox ID="PHONE_NUMBERTextBox" runat="server" Text='<%# Bind("PHONE_NUMBER") %>' />
                    <br />
                    Date of Birth:
                    <asp:TextBox ID="DATE_OF_BIRTHTextBox" runat="server" Text='<%# Bind("DATE_OF_BIRTH") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert Person Details" />
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" 
                DeleteCommand="DELETE FROM &quot;PERSONS&quot; WHERE &quot;ID&quot; = :ID" 
                InsertCommand="INSERT INTO &quot;PERSONS&quot; (&quot;ID&quot;, &quot;FIRST_NAME&quot;, &quot;MIDDLE_NAME&quot;, &quot;LAST_NAME&quot;, &quot;EMAIL&quot;, &quot;PHONE_NUMBER&quot;, &quot;DATE_OF_BIRTH&quot;) VALUES (:ID, :FIRST_NAME, :MIDDLE_NAME, :LAST_NAME, :EMAIL, :PHONE_NUMBER, :DATE_OF_BIRTH)" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT &quot;ID&quot;, &quot;FIRST_NAME&quot;, &quot;MIDDLE_NAME&quot;, &quot;LAST_NAME&quot;, &quot;EMAIL&quot;, &quot;PHONE_NUMBER&quot;, &quot;DATE_OF_BIRTH&quot; FROM &quot;PERSONS&quot;" UpdateCommand="UPDATE &quot;PERSONS&quot; SET &quot;FIRST_NAME&quot; = ?, &quot;MIDDLE_NAME&quot; = ?, &quot;LAST_NAME&quot; = ?, &quot;EMAIL&quot; = ?, &quot;PHONE_NUMBER&quot; = ?, &quot;DATE_OF_BIRTH&quot; = ? WHERE &quot;ID&quot; = ?">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID" Type="String" />
                    <asp:Parameter Name="FIRST_NAME" Type="String" />
                    <asp:Parameter Name="MIDDLE_NAME" Type="String" />
                    <asp:Parameter Name="LAST_NAME" Type="String" />
                    <asp:Parameter Name="EMAIL" Type="String" />
                    <asp:Parameter Name="PHONE_NUMBER" Type="String" />
                    <asp:Parameter Name="DATE_OF_BIRTH" Type="DateTime" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="FIRST_NAME" Type="String" />
                    <asp:Parameter Name="MIDDLE_NAME" Type="String" />
                    <asp:Parameter Name="LAST_NAME" Type="String" />
                    <asp:Parameter Name="EMAIL" Type="String" />
                    <asp:Parameter Name="PHONE_NUMBER" Type="String" />
                    <asp:Parameter Name="DATE_OF_BIRTH" Type="DateTime" />
                    <asp:Parameter Name="ID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:FormView ID="FormView2" runat="server" DataKeyNames="PERSONS_ID" DataSourceID="SqlDataSource3" OnPageIndexChanging="FormView2_PageIndexChanging">
                <EditItemTemplate>
                    Id:
                    <asp:TextBox ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />
                    <br />
                    College Email:
                    <asp:TextBox ID="COLLEGE_EMAILTextBox" runat="server" Text='<%# Bind("COLLEGE_EMAIL") %>' />
                    <br />
                    JOINING_DATE:
                    <asp:TextBox ID="JOINING_DATETextBox" runat="server" Text='<%# Bind("JOINING_DATE") %>' />
                    <br />
                    PERSONS_ID:
                    <asp:Label ID="PERSONS_IDLabel1" runat="server" Text='<%# Eval("PERSONS_ID") %>' />
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
                    PERSONS_ID:
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource5" DataTextField="EMAIL" DataValueField="ID" Text='<%# Bind("PERSONS_ID") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT P.ID ,P.EMAIL FROM PERSONS P"></asp:SqlDataSource>
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    College Id:
                    <asp:Label ID="IDLabel" runat="server" Text='<%# Bind("ID") %>' />
                    <br />
                    College Email:
                    <asp:Label ID="COLLEGE_EMAILLabel" runat="server" Text='<%# Bind("COLLEGE_EMAIL") %>' />
                    <br />
                    Joining Date:
                    <asp:Label ID="JOINING_DATELabel" runat="server" Text='<%# Bind("JOINING_DATE") %>' />
                    <br />
                    Email:
                    <asp:Label ID="PERSONS_IDLabel" runat="server" Text='<%# Eval("PERSONS_ID") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" 
                DeleteCommand="DELETE FROM &quot;STUDENTS&quot; WHERE &quot;ID&quot; = :ID" 
                InsertCommand="INSERT INTO &quot;STUDENTS&quot; (&quot;ID&quot;, &quot;COLLEGE_EMAIL&quot;, &quot;JOINING_DATE&quot;, &quot;PERSONS_ID&quot;) VALUES (:ID, :COLLEGE_EMAIL, :JOINING_DATE, :PERSONS_ID)" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT &quot;ID&quot;, &quot;COLLEGE_EMAIL&quot;, &quot;JOINING_DATE&quot;, &quot;PERSONS_ID&quot; FROM &quot;STUDENTS&quot;" UpdateCommand="UPDATE &quot;STUDENTS&quot; SET &quot;COLLEGE_EMAIL&quot; = ?, &quot;JOINING_DATE&quot; = ?, &quot;PERSONS_ID&quot; = ? WHERE &quot;ID&quot; = ?">
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
            <asp:FormView ID="FormView3" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource4">
                <EditItemTemplate>
                    ID:
                    <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                    <br />
                    COUNTRY:
                    <asp:TextBox ID="COUNTRYTextBox" runat="server" Text='<%# Bind("COUNTRY") %>' />
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
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    ID:
                    <asp:TextBox ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />
                    <br />
                    COUNTRY:
                    <asp:TextBox ID="COUNTRYTextBox" runat="server" Text='<%# Bind("COUNTRY") %>' />
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
                    ID:
                    <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                    <br />
                    COUNTRY:
                    <asp:Label ID="COUNTRYLabel" runat="server" Text='<%# Bind("COUNTRY") %>' />
                    <br />
                    STATE:
                    <asp:Label ID="STATELabel" runat="server" Text='<%# Bind("STATE") %>' />
                    <br />
                    CITY:
                    <asp:Label ID="CITYLabel" runat="server" Text='<%# Bind("CITY") %>' />
                    <br />
                    STREET:
                    <asp:Label ID="STREETLabel" runat="server" Text='<%# Bind("STREET") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" DeleteCommand="DELETE FROM &quot;ADDRESS&quot; WHERE &quot;ID&quot; = ?" InsertCommand="INSERT INTO &quot;ADDRESS&quot; (&quot;ID&quot;, &quot;COUNTRY&quot;, &quot;STATE&quot;, &quot;CITY&quot;, &quot;STREET&quot;) VALUES (?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT &quot;ID&quot;, &quot;COUNTRY&quot;, &quot;STATE&quot;, &quot;CITY&quot;, &quot;STREET&quot; FROM &quot;ADDRESS&quot;" UpdateCommand="UPDATE &quot;ADDRESS&quot; SET &quot;COUNTRY&quot; = ?, &quot;STATE&quot; = ?, &quot;CITY&quot; = ?, &quot;STREET&quot; = ? WHERE &quot;ID&quot; = ?">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID" Type="String" />
                    <asp:Parameter Name="COUNTRY" Type="String" />
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
            <asp:FormView ID="FormView4" runat="server" DataKeyNames="PERSONS_ID,ADDRESS_ID" DataSourceID="SqlDataSource6">
                <EditItemTemplate>
                    PERSONS_ID:
                    <asp:Label ID="PERSONS_IDLabel1" runat="server" Text='<%# Eval("PERSONS_ID") %>' />
                    <br />
                    ADDRESS_ID:
                    <asp:Label ID="ADDRESS_IDLabel1" runat="server" Text='<%# Eval("ADDRESS_ID") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    PERSONS_ID:
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource7" DataTextField="EMAIL" DataValueField="ID" Text='<%# Bind("PERSONS_ID") %>' OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT &quot;ID&quot;, &quot;EMAIL&quot; FROM &quot;PERSONS&quot;"></asp:SqlDataSource>
                    <br />
                    ADDRESS_ID:
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource8" DataTextField="ADDRESS" DataValueField="ID" Text='<%# Bind("ADDRESS_ID") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT A.ID, A.COUNTRY|| A.STATE|| A.CITY||A.STREET AS ADDRESS FROM ADDRESS A "></asp:SqlDataSource>
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    PERSONS_ID:
                    <asp:Label ID="PERSONS_IDLabel" runat="server" Text='<%# Eval("PERSONS_ID") %>' />
                    <br />
                    ADDRESS_ID:
                    <asp:Label ID="ADDRESS_IDLabel" runat="server" Text='<%# Eval("ADDRESS_ID") %>' />
                    <br />
                    <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" 
                DeleteCommand="DELETE FROM &quot;PERSON_ADDRESS&quot; WHERE &quot;PERSONS_ID&quot; = ? AND &quot;ADDRESS_ID&quot; = ?" 
                InsertCommand="INSERT INTO &quot;PERSON_ADDRESS&quot; (&quot;PERSONS_ID&quot;, &quot;ADDRESS_ID&quot;) VALUES (:PERSONS_ID, :ADDRESS_ID)" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT &quot;PERSONS_ID&quot;, &quot;ADDRESS_ID&quot; FROM &quot;PERSON_ADDRESS&quot;">
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
        </div>
    </form>
</body>
</html>
