<%--
  Created by IntelliJ IDEA.
  User: sayan
  Date: 17-10-2022
  Time: 07:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="Models.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="Models.Hostel" %>
<%@ page import="Models.Student" %>
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
            <a  href="admin_page.jsp?window=3"><h2>Courses</h2></a>
            <a  href="admin_page.jsp?window=4"><h2>Faculties</h2></a>
            <a  href="admin_page.jsp?window=5"><h2>Hostels</h2></a>
            <a  href="admin_page.jsp?window=6"><h2>Admission <br> Applications</h2></a>
            <a class="active" href="admin_page.jsp?window=5"><h2>Students</h2></a>
        </div>
    </div>
</div>
<!-- CONTENT AREA -->
<div class="content-area">
    <div class="panel" style="max-width: 1300px;float:left">
        <div class="title">List of All Students</div>
        <br>
        <br>
        <br>
        <table id="one-column-emphasis" style="min-width: 800px;margin: 5px; margin-top: 35px">
            <colgroup>
                <col class="oce-first" />
            </colgroup>
            <thead>
            <tr>
                <th scope="col">Department</th>
                <th scope="col">Course</th>
                <th scope="col">Roll</th>
                <th scope="col">Name </th>
                <th scope="col">Email</th>
                <th scope="col">Contact</th>
                <th scope="col">Address</th>
                <th scope="col">Hostel</th>

            </tr>
            </thead>
            <tbody>
            <%
                ArrayList<Student> list=DAO.getAllStudents();
                Student student;
                for(int i=0;i<list.size();i++)
                {
                    student=list.get(i);
                    {
            %>

            <tr>
                <td><%=DAO.getOfferingDepartmentId(student.getCourseId()) %></td>
                <td><%=DAO.getCourseName(student.getCourseId())%></td>
                <td><%=student.getRoll()%></td>
                <td><%=student.getFname()+" "+student.getLname()%></td>
                <td><%=student.getEmail()%></td>
                <td><%=student.getContact()%></td>
                <td><%=student.getAddress()%></td>
                <td><%= student.getHostelId()!=null? DAO.getHostelName(student.getHostelId()) : "N/A"%></td>


            </tr>

            <%
                    }
                } %>

            </tbody>
        </table>
    </div>
</div>










