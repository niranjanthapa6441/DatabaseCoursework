<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonDetails.aspx.cs" Inherits="DatabaseCoursework.PersonDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Person Details</title>
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT S.ID AS COLLEGE_ID,P.FIRST_NAME ||' '|| P.MIDDLE_NAME ||' ' ||P.LAST_NAME  AS NAME,P.PHONE_NUMBER,P.EMAIL,P.DATE_OF_BIRTH,S.COLLEGE_EMAIL,S.JOINING_DATE,
A.COUNTRY||' '|| A.STATE||' '||A.CITY||' '||A.STREET AS ADDRESS   FROM STUDENT S
JOIN PERSON P ON P.ID=S.PERSON_ID
JOIN PERSON_ADDRESS PA ON PA.PERSON_ID=P.ID
JOIN ADDRESS A ON A.ID=PA.ADDRESS_ID"></asp:SqlDataSource>
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
