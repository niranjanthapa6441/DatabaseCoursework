<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TeacherModule.aspx.cs" Inherits="DatabaseCoursework.TeacherModule" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="NAME" DataValueField="ID">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT T.ID ,P.FIRST_NAME ||' '|| P.MIDDLE_NAME ||' ' ||P.LAST_NAME  AS NAME FROM TEACHERS T
JOIN PERSONS P ON P.ID=T.PERSONS_ID
"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT P.FIRST_NAME ||' '|| P.MIDDLE_NAME ||' ' ||P.LAST_NAME  AS NAME,M.MODULE_CODE,M.MODULE_NAME,M.CREDIT_HOURS FROM TEACHERS T
JOIN TEACHERS_MODULES TM ON TM.TEACHERS_PERSONS_ID=T.PERSONS_ID
JOIN MODULES M ON M.ID= TM.MODULES_ID
JOIN PERSONS P ON P.ID=T.PERSONS_ID"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
