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
                    Id:
                    <asp:TextBox ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />
                    <br />
                    College Email:
                    <asp:TextBox ID="COLLEGE_EMAILTextBox" runat="server" Text='<%# Bind("COLLEGE_EMAIL") %>' />
                    <br />
                    Joining Date:
                    <asp:TextBox ID="JOINING_DATETextBox" runat="server" Text='<%# Bind("JOINING_DATE") %>' />
                    <br />
                    Email:
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource5" DataTextField="EMAIL" DataValueField="ID" Text='<%# Bind("PERSONS_ID") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT P.ID ,P.EMAIL FROM PERSONS P"></asp:SqlDataSource>
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add New Student" />
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
            <asp:FormView ID="FormView6" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource4">
                <EditItemTemplate>
                    ID:
                    <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                    <br />
                    COUNTRY:
                    <asp:TextBox ID="COUNTRYTextBox" runat="server" Text='<%# Bind("COUNTRY") %>' />
                    <br />
                    CITY:
                    <asp:TextBox ID="CITYTextBox" runat="server" Text='<%# Bind("CITY") %>' />
                    <br />
                    STATE:
                    <asp:TextBox ID="STATETextBox" runat="server" Text='<%# Bind("STATE") %>' />
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
                    CITY:
                    <asp:TextBox ID="CITYTextBox" runat="server" Text='<%# Bind("CITY") %>' />
                    <br />
                    STATE:
                    <asp:TextBox ID="STATETextBox" runat="server" Text='<%# Bind("STATE") %>' />
                    <br />
                    STREET:
                    <asp:TextBox ID="STREETTextBox" runat="server" Text='<%# Bind("STREET") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Provide Student Address" />
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" 
                DeleteCommand="DELETE FROM &quot;ADDRESS&quot; WHERE &quot;ID&quot; = ?" 
                InsertCommand="INSERT INTO &quot;ADDRESS&quot; (&quot;ID&quot;, &quot;COUNTRY&quot;, &quot;CITY&quot;, &quot;STATE&quot;, &quot;STREET&quot;) VALUES (:ID, :COUNTRY, :STATE, :CITY, :STREET)" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" 
                SelectCommand="SELECT &quot;ID&quot;, &quot;COUNTRY&quot;, &quot;CITY&quot;, &quot;STATE&quot;, &quot;STREET&quot; FROM &quot;ADDRESS&quot;" UpdateCommand="UPDATE &quot;ADDRESS&quot; SET &quot;COUNTRY&quot; = ?, &quot;CITY&quot; = ?, &quot;STATE&quot; = ?, &quot;STREET&quot; = ? WHERE &quot;ID&quot; = ?">
                <InsertParameters>
                    <asp:Parameter Name="ID" Type="String" />
                    <asp:Parameter Name="COUNTRY" Type="String" />
                    <asp:Parameter Name="CITY" Type="String" />
                    <asp:Parameter Name="STATE" Type="String" />
                    <asp:Parameter Name="STREET" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
            <br />
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
                    Email:
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource7" DataTextField="EMAIL" DataValueField="ID" Text='<%# Bind("PERSONS_ID") %>' OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT &quot;ID&quot;, &quot;EMAIL&quot; FROM &quot;PERSONS&quot;"></asp:SqlDataSource>
                    <br />
                    Address:
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource8" DataTextField="ADDRESS" DataValueField="ID" Text='<%# Bind("ADDRESS_ID") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT A.ID, A.COUNTRY|| A.STATE|| A.CITY||A.STREET AS ADDRESS FROM ADDRESS A "></asp:SqlDataSource>
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                   <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add Student Address" />
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
            <asp:FormView ID="FormView5" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource5">
                <EditItemTemplate>
                    Id:
                    <asp:TextBox ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />
                    <br />
                    Email:
                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource8" DataTextField="COLLEGE_EMAIL" DataValueField="ID" Text='<%# Bind("STUDENTS_PERSONS_ID") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT P.ID,S.ID AS COLLEGE_ID,P.FIRST_NAME ||' '|| P.MIDDLE_NAME ||' ' ||P.LAST_NAME  AS NAME,P.PHONE_NUMBER,P.EMAIL,P.DATE_OF_BIRTH,S.COLLEGE_EMAIL,S.JOINING_DATE,
A.COUNTRY||' '|| A.STATE||' '||A.CITY||' '||A.STREET AS ADDRESS   FROM STUDENTS S
JOIN PERSONS P ON P.ID=S.PERSONS_ID
JOIN PERSON_ADDRESS PA ON PA.PERSONS_ID=P.ID
JOIN ADDRESS A ON A.ID=PA.ADDRESS_ID"></asp:SqlDataSource>
                    <br />
                    Module Name:
                    <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource7" DataTextField="MODULE_NAME" DataValueField="ID" Text='<%# Bind("MODULES_ID") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT &quot;ID&quot;, &quot;MODULE_NAME&quot; FROM &quot;MODULES&quot;"></asp:SqlDataSource>
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    Id:
                    <asp:TextBox ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />
                    <br />
                    Email:
                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource8" DataTextField="COLLEGE_EMAIL" DataValueField="ID" Text='<%# Bind("STUDENTS_PERSONS_ID") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT P.ID,S.ID AS COLLEGE_ID,P.FIRST_NAME ||' '|| P.MIDDLE_NAME ||' ' ||P.LAST_NAME  AS NAME,P.PHONE_NUMBER,P.EMAIL,P.DATE_OF_BIRTH,S.COLLEGE_EMAIL,S.JOINING_DATE,
A.COUNTRY||' '|| A.STATE||' '||A.CITY||' '||A.STREET AS ADDRESS   FROM STUDENTS S
JOIN PERSONS P ON P.ID=S.PERSONS_ID
JOIN PERSON_ADDRESS PA ON PA.PERSONS_ID=P.ID
JOIN ADDRESS A ON A.ID=PA.ADDRESS_ID"></asp:SqlDataSource>
                    <br />
                    Module Name:
                    <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource7" DataTextField="MODULE_NAME" DataValueField="ID" Text='<%# Bind("MODULES_ID") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT &quot;ID&quot;, &quot;MODULE_NAME&quot; FROM &quot;MODULES&quot;"></asp:SqlDataSource>
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add Module to Student" />
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" DeleteCommand="DELETE FROM &quot;STUDENTS_MODULES&quot; WHERE &quot;ID&quot; = ?" 
                InsertCommand="INSERT INTO &quot;STUDENTS_MODULES&quot; (&quot;ID&quot;, &quot;STUDENTS_PERSONS_ID&quot;, &quot;MODULES_ID&quot;) VALUES (:ID, :STUDENTS_PERSONS_ID, :MODULES_ID)" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT &quot;ID&quot;, &quot;STUDENTS_PERSONS_ID&quot;, &quot;MODULES_ID&quot; FROM &quot;STUDENTS_MODULES&quot;" UpdateCommand="UPDATE &quot;STUDENTS_MODULES&quot; SET &quot;STUDENTS_PERSONS_ID&quot; = ?, &quot;MODULES_ID&quot; = ? WHERE &quot;ID&quot; = ?">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ID" Type="Decimal" />
                    <asp:Parameter Name="STUDENTS_PERSONS_ID" Type="String" />
                    <asp:Parameter Name="MODULES_ID" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="STUDENTS_PERSONS_ID" Type="String" />
                    <asp:Parameter Name="MODULES_ID" Type="String" />
                    <asp:Parameter Name="ID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
        </div>
    </form>
</body>
</html>
