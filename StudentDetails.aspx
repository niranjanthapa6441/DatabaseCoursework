﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentDetails.aspx.cs" Inherits="DatabaseCoursework.StudentDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Student Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <br />
            <asp:GridView CSSClass="table table-striped table-borderless table-hover" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="COLLEGE_ID" HeaderText="COLLEGE_ID" SortExpression="COLLEGE_ID" />
                <asp:BoundField DataField="NAME" HeaderText="NAME" ReadOnly="True" SortExpression="NAME" />
                <asp:BoundField DataField="PHONE_NUMBER" HeaderText="PHONE_NUMBER" SortExpression="PHONE_NUMBER" />
                <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
                <asp:BoundField DataField="DATE_OF_BIRTH" HeaderText="DATE_OF_BIRTH" SortExpression="DATE_OF_BIRTH" />
                <asp:BoundField DataField="COLLEGE_EMAIL" HeaderText="COLLEGE_EMAIL" SortExpression="COLLEGE_EMAIL" />
                <asp:BoundField DataField="JOINING_DATE" HeaderText="JOINING_DATE" SortExpression="JOINING_DATE" />
                <asp:BoundField DataField="ADDRESS" HeaderText="ADDRESS" ReadOnly="True" SortExpression="ADDRESS" />
            </Columns>
        </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT S.ID AS COLLEGE_ID,P.FIRST_NAME ||' '|| P.MIDDLE_NAME ||' ' ||P.LAST_NAME  AS NAME,P.PHONE_NUMBER,P.EMAIL,P.DATE_OF_BIRTH,S.COLLEGE_EMAIL,S.JOINING_DATE,
A.COUNTRY||' '|| A.STATE||' '||A.CITY||' '||A.STREET AS ADDRESS   FROM STUDENT S
JOIN PERSON P ON P.ID=S.PERSON_ID
JOIN PERSON_ADDRESS PA ON PA.PERSON_ID=P.ID
JOIN ADDRESS A ON A.ID=PA.ADDRESS_ID"></asp:SqlDataSource>
    </form>
     <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>
