<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="DatabaseCoursework.Student" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Add Student</title>
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
                <asp:GridView CSSClass="table table-striped table-borderless table-hover" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" DataKeyNames="PERSON_ID">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                    <asp:BoundField DataField="COLLEGE_EMAIL" HeaderText="COLLEGE_EMAIL" SortExpression="COLLEGE_EMAIL" />
                    <asp:BoundField DataField="JOINING_DATE" HeaderText="JOINING_DATE" SortExpression="JOINING_DATE" />
                    <asp:BoundField DataField="PERSON_ID" HeaderText="PERSON_ID" SortExpression="PERSON_ID" ReadOnly="True" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT &quot;PERSON_ID&quot;, &quot;ID&quot;, &quot;COLLEGE_EMAIL&quot;, &quot;JOINING_DATE&quot; FROM &quot;STUDENT&quot;"></asp:SqlDataSource>
            <br />
            <br />
            <asp:FormView ID="FormView2" runat="server" DataKeyNames="PERSON_ID" DataSourceID="SqlDataSource3" OnPageIndexChanging="FormView2_PageIndexChanging">
                <InsertItemTemplate>
                    Id:
                    <asp:TextBox CSSClass="form-control" ID="IDTextBox" runat="server" Text='<%# Bind("ID") %>' />
                    <br />
                    College Email:
                    <asp:TextBox CSSClass="form-control" ID="COLLEGE_EMAILTextBox" runat="server" Text='<%# Bind("COLLEGE_EMAIL") %>' />
                    <br />
                    Joining Date:
                    <asp:TextBox CSSClass="form-control" ID="JOINING_DATETextBox" runat="server" Text='<%# Bind("JOINING_DATE") %>' />
                    <br />
                    Phone Number:<asp:DropDownList CSSClass="form-select" ID="DropDownList6" runat="server" DataSourceID="SqlDataSource7" DataTextField="PHONE_NUMBER" DataValueField="ID" SelectedValue='<%# Bind("PERSONS_ID") %>'>
                    </asp:DropDownList>
                    &nbsp;<asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT &quot;PHONE_NUMBER&quot;, &quot;ID&quot; FROM &quot;PERSON&quot;"></asp:SqlDataSource>
                    <br />
                    <asp:LinkButton CSSClass="btn btn-success" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton CssClass="btn btn-danger" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton CSSClass="btn btn-dark" ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add New Student" />
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" 
                DeleteCommand="DELETE FROM &quot;STUDENT&quot; WHERE &quot;PERSON_ID&quot; = :PERSON_ID" 
                InsertCommand="INSERT INTO &quot;STUDENT&quot; (&quot;ID&quot;, &quot;COLLEGE_EMAIL&quot;, &quot;JOINING_DATE&quot;, &quot;PERSON_ID&quot;) VALUES (:ID, :COLLEGE_EMAIL, :JOINING_DATE, :PERSON_ID)" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" 
                SelectCommand="SELECT &quot;ID&quot;, &quot;COLLEGE_EMAIL&quot;, &quot;JOINING_DATE&quot;, &quot;PERSON_ID&quot; FROM &quot;STUDENT&quot;" 
                UpdateCommand="UPDATE &quot;STUDENT&quot; SET &quot;COLLEGE_EMAIL&quot; = :COLLEGE_EMAIL, &quot;JOINING_DATE&quot; = :JOINING_DATE, &quot;ID&quot; = :ID WHERE &quot;PERSON_ID&quot; = :PERSON_ID">
                <DeleteParameters>
                    <asp:Parameter Name="PERSON_ID" Type="String" />
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
                    <asp:Parameter Name="PERSON_ID" Type="String" />
                    <asp:Parameter Name="ID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:FormView ID="FormView4" runat="server" DataKeyNames="PERSON_ID,ADDRESS_ID" DataSourceID="SqlDataSource6">
                <InsertItemTemplate>
                    Student Email:
                    <asp:DropDownList CSSClass="form-select" ID="DropDownList2" runat="server" DataSourceID="SqlDataSource7" DataTextField="COLLEGE_EMAIL" DataValueField="ID" SelectedValue='<%# Bind("PERSONs_ID") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource  ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT P.ID,S.ID AS COLLEGE_ID,P.FIRST_NAME ||' '|| P.MIDDLE_NAME ||' ' ||P.LAST_NAME  AS NAME,P.PHONE_NUMBER,P.EMAIL,P.DATE_OF_BIRTH,S.COLLEGE_EMAIL,S.JOINING_DATE FROM STUDENT S
JOIN PERSON P ON P.ID=S.PERSON_ID

"></asp:SqlDataSource>
                    <br />
                    ADDRESS_ID:
                    <asp:DropDownList CSSClass="form-select" ID="DropDownList3" runat="server" DataSourceID="SqlDataSource8" DataTextField="ADDRESS" DataValueField="ID" SelectedValue='<%# Bind("ADDRESS_ID") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT A.ID,
A.COUNTRY||' '|| A.STATE||' '||A.CITY||' '||A.STREET AS ADDRESS   FROM ADDRESS A

"></asp:SqlDataSource>
                    <br />
                    <asp:LinkButton CSSClass="btn btn-success" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
&nbsp;<asp:LinkButton ID="InsertCancelButton" CSSClass="btn btn-danger" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton CSSClass="btn btn-dark" ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add Student Address" />
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" 
                DeleteCommand="DELETE FROM &quot;PERSON_ADDRESS&quot; WHERE &quot;PERSON_ID&quot; = ? AND &quot;ADDRESS_ID&quot; = ?" 
                InsertCommand="INSERT INTO &quot;PERSON_ADDRESS&quot; (&quot;PERSON_ID&quot;, &quot;ADDRESS_ID&quot;) VALUES (:PERSONS_ID, :ADDRESS_ID)" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT &quot;PERSON_ID&quot;, &quot;ADDRESS_ID&quot; FROM &quot;PERSON_ADDRESS&quot;">
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
                <asp:FormView ID="FormView5" runat="server" DataKeyNames="STUDENT_PERSON_ID,MODULE_ID" DataSourceID="SqlDataSource5">
                    <InsertItemTemplate>
                        Student Email:
                        <asp:DropDownList CSSClass="form-select" ID="DropDownList7" runat="server" DataSourceID="SqlDataSource8" DataTextField="COLLEGE_EMAIL" DataValueField="ID" SelectedValue='<%# Bind("STUDENT_PERSON_ID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT P.ID,S.ID AS COLLEGE_ID,P.FIRST_NAME ||' '|| P.MIDDLE_NAME ||' ' ||P.LAST_NAME  AS NAME,P.PHONE_NUMBER,P.EMAIL,P.DATE_OF_BIRTH,S.COLLEGE_EMAIL,S.JOINING_DATE FROM STUDENT S
JOIN PERSON P ON P.ID=S.PERSON_ID
"></asp:SqlDataSource>
                        <br />
                        Module Name:
                        <asp:DropDownList CSSClass="form-select" ID="DropDownList8" runat="server" DataSourceID="SqlDataSource9" DataTextField="MODULE_NAME" DataValueField="ID" SelectedValue='<%# Bind("MODULE_ID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT &quot;ID&quot;, &quot;MODULE_NAME&quot; FROM &quot;MODULE&quot;"></asp:SqlDataSource>
                        <br />
                        <asp:LinkButton CSSClass="btn btn-success" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton CSSClass="btn btn-danger" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton CSSClass="btn btn-dark" ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add Module To Student" />
                    </ItemTemplate>
                </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Coursework %>" 
                InsertCommand="INSERT INTO &quot;STUDENT_MODULE&quot; (&quot;STUDENT_PERSON_ID&quot;, &quot;MODULE_ID&quot;) VALUES (:STUDENT_PERSON_ID, :MODULE_ID)" ProviderName="<%$ ConnectionStrings:Coursework.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_PERSON_ID&quot;, &quot;MODULE_ID&quot; FROM &quot;STUDENT_MODULE&quot;" DeleteCommand="DELETE FROM &quot;STUDENT_MODULE&quot; WHERE &quot;STUDENT_PERSON_ID&quot; = ? AND &quot;MODULE_ID&quot; = ?">
                <DeleteParameters>
                    <asp:Parameter Name="STUDENT_PERSON_ID" Type="String" />
                    <asp:Parameter Name="MODULE_ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="STUDENT_PERSON_ID" Type="String" />
                    <asp:Parameter Name="MODULE_ID" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
            <br />
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
