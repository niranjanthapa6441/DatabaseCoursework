<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="DatabaseCoursework.Result" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT S.ID AS COLLEGE_ID,P.FIRST_NAME ||' '|| P.MIDDLE_NAME ||' ' ||P.LAST_NAME  AS NAME,P.PHONE_NUMBER,P.EMAIL,P.DATE_OF_BIRTH,S.COLLEGE_EMAIL,S.JOINING_DATE,
A.COUNTRY||' '|| A.STATE||' '||A.CITY||' '||A.STREET AS ADDRESS   FROM STUDENTS S
JOIN PERSONS P ON P.ID=S.PERSONS_ID
JOIN PERSON_ADDRESS PA ON PA.PERSONS_ID=P.ID
JOIN ADDRESS A ON A.ID=PA.ADDRESS_ID"></asp:SqlDataSource>
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="NAME" DataValueField="COLLEGE_ID">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT S.ID AS COLLEGE_ID,P.FIRST_NAME ||' '|| P.MIDDLE_NAME ||' ' ||P.LAST_NAME  AS NAME,P.PHONE_NUMBER,P.EMAIL,P.DATE_OF_BIRTH,S.COLLEGE_EMAIL,S.JOINING_DATE,
A.COUNTRY||' '|| A.STATE||' '||A.CITY||' '||A.STREET AS ADDRESS   FROM STUDENTS S
JOIN PERSONS P ON P.ID=S.PERSONS_ID
JOIN PERSON_ADDRESS PA ON PA.PERSONS_ID=P.ID
JOIN ADDRESS A ON A.ID=PA.ADDRESS_ID"></asp:SqlDataSource>
        </div>
        <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource1" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="COLLEGE_ID" HeaderText="College Id:" SortExpression="COLLEGE_ID" />
                <asp:BoundField DataField="NAME" HeaderText="Full Name:" ReadOnly="True" SortExpression="NAME" />
                <asp:BoundField DataField="PHONE_NUMBER" HeaderText="Phone Number:" SortExpression="PHONE_NUMBER" />
                <asp:BoundField DataField="EMAIL" HeaderText="Email:" SortExpression="EMAIL" />
                <asp:BoundField DataField="DATE_OF_BIRTH" HeaderText="Date Of Birth" SortExpression="DATE_OF_BIRTH" />
                <asp:BoundField DataField="COLLEGE_EMAIL" HeaderText="College Email" SortExpression="COLLEGE_EMAIL" />
                <asp:BoundField DataField="JOINING_DATE" HeaderText="Joining Date" SortExpression="JOINING_DATE" />
                <asp:BoundField DataField="ADDRESS" HeaderText="Address" ReadOnly="True" SortExpression="ADDRESS" />
            </Fields>
        </asp:DetailsView>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
            <Columns>
                <asp:BoundField DataField="COLLEGE_ID" HeaderText="College Id" SortExpression="COLLEGE_ID" />
                <asp:BoundField DataField="NAME" HeaderText="Full Name" ReadOnly="True" SortExpression="NAME" />
                <asp:BoundField DataField="COLLEGE_EMAIL" HeaderText="College Email" SortExpression="COLLEGE_EMAIL" />
                <asp:BoundField DataField="MODULE_CODE" HeaderText="Module Code" SortExpression="MODULE_CODE" />
                <asp:BoundField DataField="MODULE_NAME" HeaderText="Module Name" SortExpression="MODULE_NAME" />
                <asp:BoundField DataField="CREDIT_HOURS" HeaderText="Credit Hours" SortExpression="CREDIT_HOURS" />
                <asp:BoundField DataField="ASSIGNMENT_TYPE" HeaderText="Assignment Type" SortExpression="ASSIGNMENT_TYPE" />
                <asp:BoundField DataField="GRADE" HeaderText="Grade" SortExpression="GRADE" />
                <asp:BoundField DataField="STATUS" HeaderText="Status" SortExpression="STATUS" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT S.ID AS COLLEGE_ID,P.FIRST_NAME ||' '|| P.MIDDLE_NAME ||' ' ||P.LAST_NAME  AS NAME,S.COLLEGE_EMAIL,M.MODULE_CODE,M.MODULE_NAME,M.CREDIT_HOURS,A.Assignment_Type,G.GRADE,G.STATUS FROM RESULT R
JOIN ASSIGNMENTS A ON A.ID=R.ASSIGNMENTS_ID
JOIN GRADES G ON G.ID = R.GRADES_ID
JOIN STUDENTS_MODULES SM ON SM.ID=R.STUDENTS_MODULES_ID
JOIN MODULES M ON M.ID=SM.MODULES_ID
JOIN STUDENTS S ON S.PERSONS_ID=SM.STUDENTS_PERSONS_ID
JOIN PERSONS P ON P.ID=S.PERSONS_ID"></asp:SqlDataSource>
    </form>
</body>
</html>
