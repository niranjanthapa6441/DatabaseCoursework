<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Department.aspx.cs" Inherits="DatabaseCoursework.Department" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Department</title>
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
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" 
            DeleteCommand="DELETE FROM &quot;DEPARTMENT&quot; WHERE &quot;ID&quot; = :ID" 
            InsertCommand="INSERT INTO &quot;DEPARTMENT&quot; (&quot;ID&quot;, &quot;DEPARTMENT_NAME&quot;, &quot;DEPARTMENT_CODE&quot;, &quot;STATUS&quot;) VALUES (:ID, :DEPARTMENT_NAME, :DEPARTMENT_CODE, :STATUS)" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" 
            SelectCommand="SELECT &quot;ID&quot;, &quot;DEPARTMENT_NAME&quot;, &quot;DEPARTMENT_CODE&quot;, &quot;STATUS&quot; FROM &quot;DEPARTMENT&quot;" 
            UpdateCommand="UPDATE &quot;DEPARTMENT&quot; SET &quot;DEPARTMENT_NAME&quot; = :DEPARTMENT_NAME, &quot;DEPARTMENT_CODE&quot; = :DEPARTMENT_CODE, &quot;STATUS&quot; = :STATUS WHERE &quot;ID&quot; = :ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ID" Type="Decimal" />
                <asp:Parameter Name="DEPARTMENT_NAME" Type="String" />
                <asp:Parameter Name="DEPARTMENT_CODE" Type="String" />
                <asp:Parameter Name="STATUS" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="DEPARTMENT_NAME" Type="String" />
                <asp:Parameter Name="DEPARTMENT_CODE" Type="String" />
                <asp:Parameter Name="STATUS" Type="String" />
                <asp:Parameter Name="ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
           <br />
           <br />
           <div class="container">
               <asp:GridView CSSClass="table table-striped table-borderless table-hover" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="Id" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="DEPARTMENT_NAME" HeaderText="Department Name" SortExpression="DEPARTMENT_NAME" />
                <asp:BoundField DataField="DEPARTMENT_CODE" HeaderText="Department Code" SortExpression="DEPARTMENT_CODE" />
                <asp:BoundField DataField="STATUS" HeaderText="STATUS" SortExpression="Status" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
        </asp:GridView>
           </div>
        <div class="container">
        <asp:FormView ID="FormView2" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1">
            <InsertItemTemplate>
                Id:
                <asp:TextBox CSSClass="form-control" ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />
                <br />
                Department Name:
                <asp:TextBox CSSClass="form-control" ID="DEPARTMENT_NAMETextBox" runat="server" Text='<%# Bind("DEPARTMENT_NAME") %>' />
                <br />
                Department Code:
                <asp:TextBox CSSClass="form-control"  ID="DEPARTMENT_CODETextBox" runat="server" Text='<%# Bind("DEPARTMENT_CODE") %>' />
                <br />
                Status:
                <asp:TextBox CSSClass="form-control"  ID="STATUSTextBox" runat="server" Text='<%# Bind("STATUS") %>' />
                <br />
                <asp:LinkButton CSSClass="btn btn-success" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton CSSClass="btn btn-success" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <asp:LinkButton CSSClass="btn btn-dark" ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" />
            </ItemTemplate>
        </asp:FormView>
        </div>
       </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>

<script>
   var menu_btn = document.querySelector("#menu-btn");
   var sidebar = document.querySelector("#sidebar");
   var container = document.querySelector(".my-container");
   menu_btn.addEventListener("click", () => {
       sidebar.classList.toggle("active-nav");
       container.classList.toggle("active-cont");
   });

</script>
