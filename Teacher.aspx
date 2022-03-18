<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Teacher.aspx.cs" Inherits="DatabaseCoursework.Teacher" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="COLLEGE_ID" HeaderText="COLLEGE_ID" SortExpression="COLLEGE_ID" />
                <asp:BoundField DataField="NAME" HeaderText="NAME" ReadOnly="True" SortExpression="NAME" />
                <asp:BoundField DataField="PHONE_NUMBER" HeaderText="PHONE_NUMBER" SortExpression="PHONE_NUMBER" />
                <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
                <asp:BoundField DataField="DATE_OF_BIRTH" HeaderText="DATE_OF_BIRTH" SortExpression="DATE_OF_BIRTH" />
                <asp:BoundField DataField="COLLEGE_EMAIL" HeaderText="COLLEGE_EMAIL" SortExpression="COLLEGE_EMAIL" />
                <asp:BoundField DataField="SALARY" HeaderText="SALARY" SortExpression="SALARY" />
                <asp:BoundField DataField="JOINING_DATE" HeaderText="JOINING_DATE" SortExpression="JOINING_DATE" />
                <asp:BoundField DataField="ADDRESS" HeaderText="ADDRESS" ReadOnly="True" SortExpression="ADDRESS" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" 
            SelectCommand="SELECT T.ID AS COLLEGE_ID,P.FIRST_NAME ||' '|| P.MIDDLE_NAME ||' ' ||P.LAST_NAME  AS NAME,P.PHONE_NUMBER,P.EMAIL,P.DATE_OF_BIRTH,T.COLLEGE_EMAIL,T.SALARY,T.JOINING_DATE,
A.COUNTRY||' '|| A.STATE||' '||A.CITY||' '||A.STREET AS ADDRESS   FROM TEACHERS T
JOIN PERSONS P ON P.ID=T.PERSONS_ID
JOIN PERSON_ADDRESS PA ON PA.PERSONS_ID=P.ID
JOIN ADDRESS A ON A.ID=PA.ADDRESS_ID"></asp:SqlDataSource>
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
            InsertCommand="INSERT INTO &quot;PERSONS&quot; (&quot;ID&quot;, &quot;FIRST_NAME&quot;, &quot;MIDDLE_NAME&quot;, &quot;LAST_NAME&quot;, &quot;EMAIL&quot;, &quot;PHONE_NUMBER&quot;, &quot;DATE_OF_BIRTH&quot;) VALUES (:ID, :FIRST_NAME, :MIDDLE_NAME, :LAST_NAME, :EMAIL, :PHONE_NUMBER, :DATE_OF_BIRTH)" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" 
            SelectCommand="SELECT &quot;ID&quot;, &quot;FIRST_NAME&quot;, &quot;MIDDLE_NAME&quot;, &quot;LAST_NAME&quot;, &quot;EMAIL&quot;, &quot;PHONE_NUMBER&quot;, &quot;DATE_OF_BIRTH&quot; FROM &quot;PERSONS&quot;" 
            UpdateCommand="UPDATE &quot;PERSONS&quot; SET &quot;FIRST_NAME&quot; = :FIRST_NAME, &quot;MIDDLE_NAME&quot; = :MIDDLE_NAME, &quot;LAST_NAME&quot; = :LAST_NAME, &quot;EMAIL&quot; = :EMAIL, &quot;PHONE_NUMBER&quot; = :PHONE_NUMBER, &quot;DATE_OF_BIRTH&quot; = :DATE_OF_BIRTH WHERE &quot;ID&quot; = ?">
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
        <asp:FormView ID="FormView2" runat="server" DataKeyNames="PERSONS_ID" DataSourceID="SqlDataSource3">
            <EditItemTemplate>
                Person Email:
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource7" DataTextField="EMAIL" DataValueField="ID" Text='<%# Bind("PERSONS_ID") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT &quot;ID&quot;, &quot;EMAIL&quot; FROM &quot;PERSONS&quot;"></asp:SqlDataSource>
                <br/>
                Id:
                <asp:TextBox ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />
                <br />
                College Email:
                <asp:TextBox ID="COLLEGE_EMAILTextBox" runat="server" Text='<%# Bind("COLLEGE_EMAIL") %>' />
                <br />
                Joining Date:
                <asp:TextBox ID="JOINING_DATETextBox" runat="server" Text='<%# Bind("JOINING_DATE") %>' />
                <br />
                Salary:
                <asp:TextBox ID="SALARYTextBox" runat="server" Text='<%# Bind("SALARY") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                Person Email:
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource7" DataTextField="EMAIL" DataValueField="ID" Text='<%# Bind("PERSONS_ID") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT &quot;ID&quot;, &quot;EMAIL&quot; FROM &quot;PERSONS&quot;"></asp:SqlDataSource>
                <br />
                Id:
                <asp:TextBox ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />
                <br />
                College Email:
                <asp:TextBox ID="COLLEGE_EMAILTextBox" runat="server" Text='<%# Bind("COLLEGE_EMAIL") %>' />
                <br />
                Joining Date:
                <asp:TextBox ID="JOINING_DATETextBox" runat="server" Text='<%# Bind("JOINING_DATE") %>' />
                <br />
                Salary:
                <asp:TextBox ID="SALARYTextBox" runat="server" Text='<%# Bind("SALARY") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add New Teaxher" />
            </ItemTemplate>
        </asp:FormView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" 
            DeleteCommand="DELETE FROM &quot;TEACHERS&quot; WHERE &quot;PERSONS_ID&quot; = :ID" 
            InsertCommand="INSERT INTO &quot;TEACHERS&quot; (&quot;PERSONS_ID&quot;, &quot;ID&quot;, &quot;COLLEGE_EMAIL&quot;, &quot;JOINING_DATE&quot;, &quot;SALARY&quot;) VALUES (:PERSONS_ID, :ID, :COLLEGE_EMAIL, :JOINING_DATE, :SALARY)" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" 
            SelectCommand="SELECT &quot;PERSONS_ID&quot;, &quot;ID&quot;, &quot;COLLEGE_EMAIL&quot;, &quot;JOINING_DATE&quot;, &quot;SALARY&quot; FROM &quot;TEACHERS&quot;" 
            UpdateCommand="UPDATE &quot;TEACHERS&quot; SET &quot;ID&quot; = :ID, &quot;COLLEGE_EMAIL&quot; = :COLLEGE_EMAIL, &quot;JOINING_DATE&quot; = :JOINING_DATE, &quot;SALARY&quot; = :SALARY WHERE &quot;PERSONS_ID&quot; = :PERSONS_ID">
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
        <asp:FormView ID="FormView4" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource5">
            <EditItemTemplate>
                Id:
                <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                <br />
                Country:
                <asp:TextBox ID="COUNTRYTextBox" runat="server" Text='<%# Bind("COUNTRY") %>' />
                <br />
                State:
                <asp:TextBox ID="STATETextBox" runat="server" Text='<%# Bind("STATE") %>' />
                <br />
                City:
                <asp:TextBox ID="CITYTextBox" runat="server" Text='<%# Bind("CITY") %>' />
                <br />
                Street:
                <asp:TextBox ID="STREETTextBox" runat="server" Text='<%# Bind("STREET") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                Id:
                <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                <br />
                Country:
                <asp:TextBox ID="COUNTRYTextBox" runat="server" Text='<%# Bind("COUNTRY") %>' />
                <br />
                State:
                <asp:TextBox ID="STATETextBox" runat="server" Text='<%# Bind("STATE") %>' />
                <br />
                City:
                <asp:TextBox ID="CITYTextBox" runat="server" Text='<%# Bind("CITY") %>' />
                <br />
                Street:
                <asp:TextBox ID="STREETTextBox" runat="server" Text='<%# Bind("STREET") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add Address" />
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" 
            InsertCommand="INSERT INTO &quot;ADDRESS&quot; (&quot;ID&quot;, &quot;COUNTRY&quot;, &quot;STATE&quot;, &quot;CITY&quot;, &quot;STREET&quot;) VALUES (:ID, :COUNTRY, :STATE, :CITY, :STREET)" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" 
            SelectCommand="SELECT &quot;ID&quot;, &quot;COUNTRY&quot;, &quot;STATE&quot;, &quot;CITY&quot;, &quot;STREET&quot; FROM &quot;ADDRESS&quot;" >
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
        <br />
        <asp:FormView ID="FormView3" runat="server" DataKeyNames="PERSONS_ID,ADDRESS_ID" DataSourceID="SqlDataSource4">
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
                Teacher Email:
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource5" DataTextField="EMAIL" DataValueField="ID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT PERSONS.ID, PERSONS.EMAIL FROM COURSEWORK.TEACHERS
INNER JOIN COURSEWORK.PERSONS ON TEACHERS.PERSONS_ID = PERSONS.ID
"></asp:SqlDataSource>
                <br />
                Address:
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource6" DataTextField="ADDRESS" DataValueField="ID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT A.ID,A.COUNTRY||','||A.STATE||','||A.CITY||','||A.STREET AS ADDRESS FROM ADDRESS A"></asp:SqlDataSource>
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add Teacher Address" />
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" 
            DeleteCommand="DELETE FROM &quot;PERSON_ADDRESS&quot; WHERE &quot;PERSONS_ID&quot; = ? AND &quot;ADDRESS_ID&quot; = :ADDRESS_ID" 
            InsertCommand="INSERT INTO &quot;PERSON_ADDRESS&quot; (&quot;PERSONS_ID&quot;, &quot;ADDRESS_ID&quot;) VALUES (?, ?)" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT &quot;PERSONS_ID&quot;, &quot;ADDRESS_ID&quot; FROM &quot;PERSON_ADDRESS&quot;">
            <InsertParameters>
                <asp:Parameter Name="PERSONS_ID" Type="String" />
                <asp:Parameter Name="ADDRESS_ID" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
