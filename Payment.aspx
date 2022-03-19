<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="DatabaseCoursework.Payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="NAME" DataValueField="COLLEGE_ID">
            </asp:DropDownList>
            <br />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT S.ID AS COLLEGE_ID,P.FIRST_NAME ||' '|| P.MIDDLE_NAME ||' ' ||P.LAST_NAME  AS NAME,P.PHONE_NUMBER,P.EMAIL,P.DATE_OF_BIRTH,S.COLLEGE_EMAIL,S.JOINING_DATE,
A.COUNTRY||' '|| A.STATE||' '||A.CITY||' '||A.STREET AS ADDRESS   FROM STUDENTS S
JOIN PERSONS P ON P.ID=S.PERSONS_ID
JOIN PERSON_ADDRESS PA ON PA.PERSONS_ID=P.ID
JOIN ADDRESS A ON A.ID=PA.ADDRESS_ID"></asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:BoundField DataField="COLLEGE_ID" HeaderText="College Id" SortExpression="COLLEGE_ID" />
                    <asp:BoundField DataField="NAME" HeaderText="Full Name" ReadOnly="True" SortExpression="NAME" />
                    <asp:BoundField DataField="COLLEGE_EMAIL" HeaderText="College Email" SortExpression="COLLEGE_EMAIL" />
                    <asp:BoundField DataField="PAYMENT_DATE" HeaderText="Payment Date" SortExpression="PAYMENT_DATE" />
                    <asp:BoundField DataField="PAYMENT_METHOD" HeaderText="Payment Method" SortExpression="PAYMENT_METHOD" />
                    <asp:BoundField DataField="PAID_AMOUNT" HeaderText="Paid Amount" SortExpression="PAID_AMOUNT" />
                    <asp:BoundField DataField="DEPARTMENT_NAME" HeaderText="Department Name" SortExpression="DEPARTMENT_NAME" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT S.ID AS COLLEGE_ID,P.FIRST_NAME ||' '|| P.MIDDLE_NAME ||' ' ||P.LAST_NAME  AS NAME,S.COLLEGE_EMAIL,PMT.PAYMENT_DATE,PMT.PAYMENT_METHOD,PMT.PAID_AMOUNT,D.DEPARTMENT_NAME FROM PAYMENTS PMT
JOIN STUDENTS S ON S.PERSONS_ID=PMT.STUDENTS_PERSONS_ID
JOIN PERSONS P ON P.ID=S.PERSONS_ID
JOIN DEPARTMENTS D ON D.ID=PMT.DEPARTMENTS_ID"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
