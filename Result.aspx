<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="DatabaseCoursework.Result" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Result</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT S.ID AS COLLEGE_ID,P.FIRST_NAME ||' '|| P.MIDDLE_NAME ||' ' ||P.LAST_NAME  AS NAME,P.PHONE_NUMBER,P.EMAIL,P.DATE_OF_BIRTH,S.COLLEGE_EMAIL,S.JOINING_DATE,
A.COUNTRY||' '|| A.STATE||' '||A.CITY||' '||A.STREET AS ADDRESS   FROM STUDENT S
JOIN PERSON P ON P.ID=S.PERSON_ID
JOIN PERSON_ADDRESS PA ON PA.PERSON_ID=P.ID
JOIN ADDRESS A ON A.ID=PA.ADDRESS_ID WHERE S.ID= :COLLEGE_ID">
                <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="COLLEGE_ID" PropertyName="SelectedValue"/>
                </SelectParameters>
            </asp:SqlDataSource>
            <br/>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT S.ID AS COLLEGE_ID,P.FIRST_NAME ||' '|| P.MIDDLE_NAME ||' ' ||P.LAST_NAME  AS NAME,P.PHONE_NUMBER,P.EMAIL,P.DATE_OF_BIRTH,S.COLLEGE_EMAIL,S.JOINING_DATE,
A.COUNTRY||' '|| A.STATE||' '||A.CITY||' '||A.STREET AS ADDRESS   FROM STUDENT S
JOIN PERSON P ON P.ID=S.PERSON_ID
JOIN PERSON_ADDRESS PA ON PA.PERSON_ID=P.ID
JOIN ADDRESS A ON A.ID=PA.ADDRESS_ID"></asp:SqlDataSource>
        </div>
        <div class="container">
            <asp:DropDownList CSSClass="form-control" ID="DropDownList1" runat="server" AutoPostBack="true" DataSourceID="SqlDataSource2" DataTextField="NAME" DataValueField="COLLEGE_ID">
            </asp:DropDownList>
            <br />
            <asp:DetailsView CSSClass="table table-borderless" ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource1" Height="50px" Width="125px">
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
        <asp:GridView CSSClass="table table-striped table-borderless table-hover" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
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
        </div>
        
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT S.ID AS COLLEGE_ID,P.FIRST_NAME ||' '|| P.MIDDLE_NAME ||' ' ||P.LAST_NAME  AS NAME,S.COLLEGE_EMAIL,M.MODULE_CODE,M.MODULE_NAME,M.CREDIT_HOURS,A.Assignment_Type,G.GRADE,G.STATUS 
FROM RESULT R,GRADE G,ASSIGNMENT A,STUDENT_MODULE SM, STUDENT S, PERSON P, MODULE M
WHERE R.ASSIGNMENT_ID = A.ID AND 
R.GRADE_ID = G.ID AND 
SM.STUDENT_PERSON_ID = R.STUDENT_MODULE_STUDENT_ID AND 
SM.MODULE_ID = R.STUDENT_MODULE_MODULE_ID AND 
M.ID = SM.MODULE_ID AND
S.PERSON_ID = SM.STUDENT_PERSON_ID AND 
P.ID = S.PERSON_ID AND S.ID= :COLLEGE_ID">
            <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="COLLEGE_ID" PropertyName="SelectedValue"/>
                </SelectParameters>
        </asp:SqlDataSource>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>
