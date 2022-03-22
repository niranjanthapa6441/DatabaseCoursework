<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Teacher.aspx.cs" Inherits="DatabaseCoursework.Teacher" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Add Teacher</title>
  <!-- bootstrap 5 css -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous" />
  <!-- BOX ICONS CSS-->
  <link href="https://cdn.jsdelivr.net/npm/boxicons@2.0.5/css/boxicons.min.css" rel="stylesheet" />
  <!-- custom css -->  
   <link href="main.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Side-Nav -->
   <div class="side-navbar active-nav d-flex justify-content-between flex-wrap flex-column" id="sidebar">
     <ul class="nav flex-column text-white w-100">
       <a href="#" class="nav-link h3 text-white my-2">
         Berkeley </br>College
       </a>
       <li href="#" class="nav-link">
         <i class="bx bxs-dashboard"></i>
           <a href="Student.aspx">Dashboard</a>
         
       </li>      
         <div class="dropdown">
   <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
     Student
   </button>
   <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
     <li href="#Student.aspx" class="nav-link">
         <i class="bx bx-user-check"></i>
         <a href="Student.aspx">Add Student</a>
       </li>
       <li href="#" class="nav-link">
         <i class="bx bx-conversation"></i>
         <a href="StudentDetails.aspx">View Student Details</a>
       </li
       <li href="#" class="nav-link">
         <i class="bx bx-conversation"></i>
         <a href="Payment.aspx">View Payment</a>
       </li>
       <li href="#" class="nav-link">
         <i class="bx bx-conversation"></i>
         <a href="Result.aspx">View Result</a>
       </li>
   </ul>
 </div>
         <div class="dropdown">
   <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
     Teacher
   </button>
   <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
     <li href="#" class="nav-link">
         <i class="bx bx-user-check"></i>
         <a href="Teacher.aspx">Add Teacher</a>
       </li>
       <li href="#" class="nav-link">
         <i class="bx bx-conversation"></i>
         <a href="TeacherDetails.aspx">Teacher Details</a>
       </li>
       <li href="#" class="nav-link">
         <i class="bx bx-conversation"></i>
         <a href="TeacherModule.aspx">Teacher Module</a>
       </li>
   </ul>
 </div>
         <li href="#" class="nav-link">
         <i class="bx bx-user-check"></i>
         <a href="Department.aspx">Department</a>
       </li>
       <li href="#" class="nav-link">
         <i class="bx bx-conversation"></i>
         <a href="Module.aspx">Module</a>
       </li>
         <li href="#" class="nav-link">
         <i class="bx bx-conversation"></i>
         <a href="Address.aspx">Address</a>
       </li>
         <li href="#" class="nav-link">
         <i class="bx bx-conversation"></i>
         <a href="PersonDetails.aspx">Person Details</a>
       </li>
     </ul>
 
     <span href="#" class="nav-link h4 w-100 mb-5">
       <a href=""><i class="bx bxl-instagram-alt text-white"></i></a>
       <a href=""><i class="bx bxl-twitter px-2 text-white"></i></a>
       <a href=""><i class="bx bxl-facebook text-white"></i></a>
     </span>
   </div>
 
   <!-- Main Wrapper -->
   <div class="p-1 my-container active-cont">
     <!-- Top Nav -->
     <nav class="navbar top-navbar navbar-light bg-light px-5">
       <a class="btn border-0" id="menu-btn"><i class="bx bx-menu"></i></a>
     </nav>
     <!--End Top Nav -->
        <div>
            <div class="d-flex" id="wrapper">
                    <!-- Sidebar -->
            <div class="container">
                <asp:GridView CSSClass="table table-striped table-borderless table-hover" ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" DataKeyNames="PERSON_ID">
            <Columns>
                <asp:BoundField DataField="PERSON_ID" HeaderText="Person Id" SortExpression="PERSON_ID" ReadOnly="True" />
                <asp:BoundField DataField="ID" HeaderText="Id" SortExpression="ID" />
                <asp:BoundField DataField="COLLEGE_EMAIL" HeaderText="College Email" SortExpression="COLLEGE_EMAIL" />
                <asp:BoundField DataField="JOINING_DATE" HeaderText="Joining Date" SortExpression="JOINING_DATE" />
                <asp:BoundField DataField="SALARY" HeaderText="Salary" SortExpression="SALARY" />
                <asp:CommandField ButtonType="Button" ControlStyle-CssClass="btn btn-dark" ShowDeleteButton="True" HeaderText="Action" ShowEditButton="True" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" 
            SelectCommand="SELECT &quot;PERSON_ID&quot;, &quot;ID&quot;, &quot;COLLEGE_EMAIL&quot;, &quot;JOINING_DATE&quot;, &quot;SALARY&quot; FROM &quot;TEACHER&quot;" 
            DeleteCommand="DELETE FROM &quot;TEACHER&quot; WHERE &quot;PERSON_ID&quot; = :PERSON_ID" InsertCommand="INSERT INTO &quot;TEACHER&quot; (&quot;PERSON_ID&quot;, &quot;ID&quot;, &quot;COLLEGE_EMAIL&quot;, &quot;JOINING_DATE&quot;, &quot;SALARY&quot;) VALUES (?, ?, ?, ?, ?)" UpdateCommand="UPDATE &quot;TEACHER&quot; SET &quot;ID&quot; = ?, &quot;COLLEGE_EMAIL&quot; = ?, &quot;JOINING_DATE&quot; = ?, &quot;SALARY&quot; = ? WHERE &quot;PERSON_ID&quot; = ?">
            <DeleteParameters>
                <asp:Parameter Name="PERSON_ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="PERSON_ID" Type="String" />
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
                <asp:Parameter Name="PERSON_ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
                <br />
                <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" 
                    DeleteCommand="DELETE FROM &quot;PERSON&quot; WHERE &quot;ID&quot; = :ID" 
                    InsertCommand="INSERT INTO &quot;PERSON&quot; (&quot;ID&quot;, &quot;FIRST_NAME&quot;, &quot;MIDDLE_NAME&quot;, &quot;EMAIL&quot;, &quot;LAST_NAME&quot;, &quot;PHONE_NUMBER&quot;, &quot;DATE_OF_BIRTH&quot;) VALUES (:ID, :FIRST_NAME, :MIDDLE_NAME, :EMAIL, :LAST_NAME, :PHONE_NUMBER, :JOINING_DATE)" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" 
                    SelectCommand="SELECT &quot;ID&quot;, &quot;FIRST_NAME&quot;, &quot;MIDDLE_NAME&quot;, &quot;EMAIL&quot;, &quot;LAST_NAME&quot;, &quot;PHONE_NUMBER&quot;, &quot;DATE_OF_BIRTH&quot; FROM &quot;PERSON&quot;" 
                    UpdateCommand="UPDATE &quot;PERSON&quot; SET &quot;FIRST_NAME&quot; = :FIRST_NAME, &quot;MIDDLE_NAME&quot; = :MIDDLE_NAME, &quot;EMAIL&quot; = :EMAIL, &quot;LAST_NAME&quot; = :LAST_NAME, &quot;PHONE_NUMBER&quot; = :PHONE_NUMBER, &quot;DATE_OF_BIRTH&quot; = :DATE_OF_BIRTH WHERE &quot;ID&quot; = :ID">
                    <DeleteParameters>
                        <asp:Parameter Name="ID" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ID" Type="String" />
                        <asp:Parameter Name="FIRST_NAME" Type="String" />
                        <asp:Parameter Name="MIDDLE_NAME" Type="String" />
                        <asp:Parameter Name="EMAIL" Type="String" />
                        <asp:Parameter Name="LAST_NAME" Type="String" />
                        <asp:Parameter Name="PHONE_NUMBER" Type="String" />
                        <asp:Parameter Name="DATE_OF_BIRTH" Type="DateTime" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="FIRST_NAME" Type="String" />
                        <asp:Parameter Name="MIDDLE_NAME" Type="String" />
                        <asp:Parameter Name="EMAIL" Type="String" />
                        <asp:Parameter Name="LAST_NAME" Type="String" />
                        <asp:Parameter Name="PHONE_NUMBER" Type="String" />
                        <asp:Parameter Name="DATE_OF_BIRTH" Type="DateTime" />
                        <asp:Parameter Name="ID" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:FormView ID="FormView4" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource7">
                    <EditItemTemplate>
                        ID:
                        <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                        <br />
                        FIRST_NAME:
                        <asp:TextBox ID="FIRST_NAMETextBox" runat="server" Text='<%# Bind("FIRST_NAME") %>' />
                        <br />
                        MIDDLE_NAME:
                        <asp:TextBox ID="MIDDLE_NAMETextBox" runat="server" Text='<%# Bind("MIDDLE_NAME") %>' />
                        <br />
                        EMAIL:
                        <asp:TextBox ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' />
                        <br />
                        LAST_NAME:
                        <asp:TextBox ID="LAST_NAMETextBox" runat="server" Text='<%# Bind("LAST_NAME") %>' />
                        <br />
                        PHONE_NUMBER:
                        <asp:TextBox ID="PHONE_NUMBERTextBox" runat="server" Text='<%# Bind("PHONE_NUMBER") %>' />
                        <br />
                        DATE_OF_BIRTH:
                        <asp:TextBox ID="DATE_OF_BIRTHTextBox" runat="server" Text='<%# Bind("DATE_OF_BIRTH") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        ID:
                        <asp:TextBox CSSClass="form-control" ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />
                        <br />
                        FIRST_NAME:
                        <asp:TextBox CSSClass="form-control" ID="FIRST_NAMETextBox" runat="server" Text='<%# Bind("FIRST_NAME") %>' />
                        <br />
                        MIDDLE_NAME:
                        <asp:TextBox CSSClass="form-control" ID="MIDDLE_NAMETextBox" runat="server" Text='<%# Bind("MIDDLE_NAME") %>' />
                        <br />
                        EMAIL:
                        <asp:TextBox CSSClass="form-control" ID="EMAILTextBox" runat="server" Text='<%# Bind("EMAIL") %>' />
                        <br />
                        LAST_NAME:
                        <asp:TextBox CSSClass="form-control" ID="LAST_NAMETextBox" runat="server" Text='<%# Bind("LAST_NAME") %>' />
                        <br />
                        PHONE_NUMBER:
                        <asp:TextBox CSSClass="form-control" ID="PHONE_NUMBERTextBox" runat="server" Text='<%# Bind("PHONE_NUMBER") %>' />
                        <br />
                        DATE_OF_BIRTH:
                        <asp:TextBox CSSClass="form-control" ID="DATE_OF_BIRTHTextBox" runat="server" Text='<%# Bind("DATE_OF_BIRTH") %>' />
                        <br />
                        <asp:LinkButton CSSClass="btn btn-success"  ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton CSSClass="btn btn-danger"  ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton CSSClass="btn btn-dark" ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add Details" />
                    </ItemTemplate>
                </asp:FormView>
        <br />
        <br />
        <asp:FormView ID="FormView2" runat="server" DataKeyNames="PERSON_ID" DataSourceID="SqlDataSource3">
            <InsertItemTemplate>
                Phone Number:
                <asp:DropDownList CSSClass="form-select" ID="DropDownList4" runat="server" DataSourceID="SqlDataSource5" DataTextField="PHONE_NUMBER" DataValueField="ID" SelectedValue='<%# Bind("PERSON_ID") %>' >
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT &quot;ID&quot;, &quot;PHONE_NUMBER&quot; FROM &quot;PERSON&quot; WHERE ID NOT IN (SELECT PERSON_ID FROM TEACHER)"></asp:SqlDataSource>
                <br />
                Student Id:
                <asp:TextBox CSSClass="form-control" ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />
                <br />
                College Email:
                <asp:TextBox CSSClass="form-control" ID="COLLEGE_EMAILTextBox" runat="server" Text='<%# Bind("COLLEGE_EMAIL") %>' />
                <br />
                Joining Dare:
                <asp:TextBox CSSClass="form-control" ID="JOINING_DATETextBox" runat="server" Text='<%# Bind("JOINING_DATE") %>' />
                <br />
                Salary:
                <asp:TextBox CSSClass="form-control" ID="SALARYTextBox" runat="server" Text='<%# Bind("SALARY") %>' />
                <br />
                <asp:LinkButton CSSClass="btn btn-success" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
&nbsp;<asp:LinkButton CSSClass="btn btn-danger" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:LinkButton CSSClass="btn btn-dark" ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add New Teacher" />
            </ItemTemplate>
        </asp:FormView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" 
            DeleteCommand="DELETE FROM &quot;TEACHER&quot; WHERE &quot;PERSON_ID&quot; = :PERSON_ID" 
            InsertCommand="INSERT INTO &quot;TEACHER&quot; (&quot;PERSON_ID&quot;, &quot;ID&quot;, &quot;COLLEGE_EMAIL&quot;, &quot;JOINING_DATE&quot;, &quot;SALARY&quot;) VALUES (:PERSON_ID, :ID, :COLLEGE_EMAIL, :JOINING_DATE, :SALARY)" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" 
            SelectCommand="SELECT &quot;PERSON_ID&quot;, &quot;ID&quot;, &quot;COLLEGE_EMAIL&quot;, &quot;JOINING_DATE&quot;, &quot;SALARY&quot; FROM &quot;TEACHER&quot;" 
            UpdateCommand="UPDATE &quot;TEACHER&quot; SET &quot;ID&quot; = :ID, &quot;COLLEGE_EMAIL&quot; = :COLLEGE_EMAIL, &quot;JOINING_DATE&quot; = :JOINING_DATE, &quot;SALARY&quot; = :SALARY WHERE &quot;PERSON_ID&quot; = :PERSON_ID">
            <DeleteParameters>
                <asp:Parameter Name="PERSON_ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="PERSON_ID" Type="String" />
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
                <asp:Parameter Name="PERSON_ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:FormView ID="FormView3" runat="server" DataKeyNames="PERSON_ID,ADDRESS_ID" DataSourceID="SqlDataSource4">
            <InsertItemTemplate>
                Teacher Email:
                <asp:DropDownList CSSClass="form-select" ID="DropDownList5" runat="server" DataSourceID="SqlDataSource5" DataTextField="COLLEGE_EMAIL" DataValueField="ID" SelectedValue='<%# Bind("PERSON_ID") %>'>
                </asp:DropDownList>
                &nbsp;<asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT P.ID, P.PHONE_NUMBER, P.EMAIL, P.DATE_OF_BIRTH,T.COLLEGE_EMAIL,T.SALARY,T.JOINING_DATE FROM TEACHER T JOIN PERSON P ON P.ID=T.PERSON_ID
"></asp:SqlDataSource>
                <br />
                Address:
                <asp:DropDownList CSSClass="form-select" ID="DropDownList3" runat="server" DataSourceID="SqlDataSource6" DataTextField="ADDRESS" DataValueField="ID" SelectedValue='<%# Bind("ADDRESS_ID") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT A.ID,A.COUNTRY||' '|| A.STATE||' '||A.CITY||' '||A.STREET AS ADDRESS FROM ADDRESS A"></asp:SqlDataSource>
                <br />
                <asp:LinkButton CSSClass="btn btn-success" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton CSSClass="btn btn-danger" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:LinkButton CSSClass="btn btn-dark" ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add Teacher Address" />
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" 
            DeleteCommand="DELETE FROM &quot;PERSON_ADDRESS&quot; WHERE &quot;PERSON_ID&quot; = ? AND &quot;ADDRESS_ID&quot; = :ADDRESS_ID" 
            InsertCommand="INSERT INTO &quot;PERSON_ADDRESS&quot; (&quot;PERSON_ID&quot;, &quot;ADDRESS_ID&quot;) VALUES (:PERSON_ID, :ADDRESS_ID)" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT &quot;PERSON_ID&quot;, &quot;ADDRESS_ID&quot; FROM &quot;PERSON_ADDRESS&quot;">
            <InsertParameters>
                <asp:Parameter Name="PERSON_ID" Type="String" />
                <asp:Parameter Name="ADDRESS_ID" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
                <br />
                <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" DeleteCommand="DELETE FROM &quot;TEACHER_MODULE&quot; WHERE &quot;TEACHER_PERSON_ID&quot; = ? AND &quot;MODULE_ID&quot; = ?" InsertCommand="INSERT INTO &quot;TEACHER_MODULE&quot; (&quot;TEACHER_PERSON_ID&quot;, &quot;MODULE_ID&quot;) VALUES (?, ?)" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT &quot;TEACHER_PERSON_ID&quot;, &quot;MODULE_ID&quot; FROM &quot;TEACHER_MODULE&quot;">
                    <DeleteParameters>
                        <asp:Parameter Name="TEACHER_PERSON_ID" Type="String" />
                        <asp:Parameter Name="MODULE_ID" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="TEACHER_PERSON_ID" Type="String" />
                        <asp:Parameter Name="MODULE_ID" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <asp:FormView ID="FormView5" runat="server" DataKeyNames="TEACHER_PERSON_ID,MODULE_ID" DataSourceID="SqlDataSource8">
                    <EditItemTemplate>
                        TEACHER_PERSON_ID:
                        <asp:Label ID="TEACHER_PERSON_IDLabel1" runat="server" Text='<%# Eval("TEACHER_PERSON_ID") %>' />
                        <br />
                        MODULE_ID:
                        <asp:Label ID="MODULE_IDLabel1" runat="server" Text='<%# Eval("MODULE_ID") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        College Email:
                        <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource10" DataTextField="COLLEGE_EMAIL" DataValueField="COLLEGE_ID" SelectedValue='<%# Bind("TEACHER_PERSON_ID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT T.ID AS COLLEGE_ID,P.FIRST_NAME ||' '|| P.MIDDLE_NAME ||' ' ||P.LAST_NAME  AS NAME,P.PHONE_NUMBER,P.EMAIL,P.DATE_OF_BIRTH,T.COLLEGE_EMAIL,T.SALARY,T.JOINING_DATE  FROM TEACHER T
JOIN PERSON P ON P.ID=T.PERSON_ID"></asp:SqlDataSource>
                        <br />
                        Module Name:
                        <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="SqlDataSource11" DataTextField="MODULE_NAME" DataValueField="ID" SelectedValue='<%# Bind("MODULE_ID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT &quot;ID&quot;, &quot;MODULE_NAME&quot; FROM &quot;MODULE&quot;"></asp:SqlDataSource>
                        <br />
                        <asp:LinkButton CSSClass="btn btn-success" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton CSSClass="btn btn-danger" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton CSSClass="btn btn-dark" ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add Module to Teacher" />
                    </ItemTemplate>
                </asp:FormView>
        <br />
            </div>
        </div>
    </form>
</body>
</html>

 <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

<script>
   var menu_btn = document.querySelector("#menu-btn");
   var sidebar = document.querySelector("#sidebar");
   var container = document.querySelector(".my-container");
   menu_btn.addEventListener("click", () => {
       sidebar.classList.toggle("active-nav");
       container.classList.toggle("active-cont");
   });

</script>
