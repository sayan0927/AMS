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
            <a class="active" href="admin_page.jsp?window=5"><h2>Hostels</h2></a>
            <a  href="admin_page.jsp?window=6"><h2>Admission <br> Applications</h2></a>
            <a  href="admin_page.jsp?window=7"><h2>Students</h2></a>
        </div>
    </div>
</div>
<!-- CONTENT AREA -->
<div class="content-area">
    <div class="panel" style="max-width: 850px;float:left">
        <div class="title">List of All Hostels</div>
        <br>
        <br>
        <a href="add_hostel.jsp" class="button"><span class="add-btn" style="margin-left: 80px;">Add New Hostel</span></a>
        <br>
        <table id="one-column-emphasis" style="min-width: 800px;margin: 5px; margin-top: 35px">
            <colgroup>
                <col class="oce-first" />
            </colgroup>
            <thead>
            <tr>
                <th scope="col">Hostel Id</th>
                <th scope="col">Hostel Name</th>
                <th scope="col">Warden </th>
                <th scope="col">Change Warden</th>

            </tr>
            </thead>
            <tbody>
            <%
                ArrayList<Hostel> list=DAO.getAllHostels();
                Hostel hostel;
                for(int i=0;i<list.size();i++)
                {
                    hostel=list.get(i);
                    {
            %>

            <tr>
                <td><%=hostel.getHostelId() %></td>
                <td><%=hostel.getHostelName()%></td>
                <td><%=DAO.getFacultyName(hostel.getWardenId())%></td>
                <td align="center"><a href="edit_hostel.jsp?hid=<%=hostel.getHostelId() %>"
                                      onclick="return confirm('Are you sure you want to edit this hostel ?');">
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










