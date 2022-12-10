<%--
  Created by IntelliJ IDEA.
  User: sayan
  Date: 16-10-2022
  Time: 12:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="Models.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="Models.Department" %>
<%@ page import="Models.Course" %>
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
            <a  href="admin_page.jsp?window=2"><h2>Departments</h2></a>
            <a class="active" href="admin_page.jsp?window=3"><h2>Courses</h2></a>
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
        <div class="title">List of All Courses</div>
        <br>
        <br>
        <a href="add_course.jsp" class="button"><span class="add-btn" style="margin-left: 80px;">Add New Course</span></a>
        <br>
        <table id="one-column-emphasis" style="min-width: 800px;margin: 5px; margin-top: 35px">
            <colgroup>
                <col class="oce-first" />
            </colgroup>
            <thead>
            <tr>
                <th scope="col">Course Id</th>
                <th scope="col">Course Level</th>
                <th scope="col">Course Name</th>
                <th scope="col">Offering Department</th>


            </tr>
            </thead>
            <tbody>
            <%
                ArrayList<Course> list=DAO.getAllCourses();
                Course course;
                for(int i=0;i<list.size();i++){
                    course=list.get(i);
                    {
            %>

            <tr>
                <td><%=course.getCourseId() %></td>
                <td><%=course.getCourseLevel() %></td>
                <td><%=course.getCourseName() %></td>
                <td><%=course.getOfferingDepartment() %></td>


            </tr>

            <%
                    }
                } %>

            </tbody>
        </table>
    </div>
</div>










