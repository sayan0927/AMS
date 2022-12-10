
<%@page import="Models.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="Models.Department" %>
<jsp:useBean id="DAO" class="Database.DatabaseController" scope="page"/>
<link href="${pageContext.request.contextPath}/css/style-backend.css" rel="stylesheet" type="text/css" />
<!-- SIDEBAR -->
<div class="sidebar" style="background-image: url(Image/Sidebar.jpg)">
    <div class="sidebar-background" >
        <h2 class="logo-text">
            Dashboard
        </h2>

        <div class="left-menu">
            <a  href="admin_page.jsp?window=1"><h2>Profile</h2></a>
            <a  href="admin_page.jsp?window=0"><h2>Accounts</h2></a>
            <a  class="active" href="admin_page.jsp?window=2"><h2>Departments</h2></a>
            <a  href="admin_page.jsp?window=3"><h2>Courses</h2></a>
            <a  href="admin_page.jsp?window=4"><h2>Faculties</h2></a>
            <a  href="admin_page.jsp?window=5"><h2>Hostels</h2></a>
            <a  href="admin_page.jsp?window=6"><h2>Admission <br> Applications</h2></a>
            <a  href="admin_page.jsp?window=7"><h2>Students</h2></a>
        </div>
    </div>
</div>




<!-- CONTENT AREA -->
<div class="content-area">
    <div class="panel" style="max-width: 850px;float:left">
        <div class="title">List of All Departments</div>
        <br>
        <br>
        <a href="add_department.jsp"   onclick="return confirm('HOD must be added as a faculty with no assigned department' );"
           class="button"><span class="add-btn" style="margin-left: 80px;">Add New Department</span></a>
        <br>
        <table id="one-column-emphasis" style="min-width: 800px;margin: 5px; margin-top: 35px">
            <colgroup>
                <col class="oce-first" />
            </colgroup>
            <thead>
            <tr>
                <th scope="col">Department Id</th>
                <th scope="col">Department Name</th>
                <th scope="col">Department Head</th>
                <th scope="col">Change HOD</th>

            </tr>
            </thead>
            <tbody>
            <%
                ArrayList<Department> list=DAO.getAllDepartments();
                Department department;
                for(int i=0;i<list.size();i++){
                    department=list.get(i);
                   {
            %>

            <tr>
                <td><%=department.getDepartmentId() %></td>
                <td><%=department.getDepartmentName() %></td>
                <td><%=DAO.getFacultyName(department.getHodID()) %></td>

                <td align="center"><a href="edit_department.jsp?did=<%=department.getDepartmentId() %>"
                                      onclick="return confirm('Are you sure you want to edit this department?');">
                    <div class="edit-btn2" style="max-width: 40px;font-size: 17px; padding: 3px">Edit</div>
                </a></td>

            </tr>

            <%
                    }
                } %>

            </tbody>
        </table>
    </div>
</div>










