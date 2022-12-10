<%@page import="java.util.ArrayList"%>
<%@ page import="Database.DatabaseController" %>
<%@ page import="java.io.NotActiveException" %>
<%@ page import="Models.Faculty" %>
<%@ page import="Models.Hostel" %>
<%@ page import="Models.Student" %>
<%@ page import="Models.Admin" %>
<jsp:useBean id="DAO" class="Database.DatabaseController" scope="page"/>
<link href="${pageContext.request.contextPath}/css/style-backend.css" rel="stylesheet" type="text/css" />
<!-- SIDEBAR -->
<div class="sidebar" style="background-image: url(Image/Sidebar.jpg)">
    <div class="sidebar-background" >
        <h2 class="logo-text">
            Dashboard
        </h2>

        <div class="left-menu">
            <a class="active=" href="superadmin.jsp"><h2>Admins</h2></a>
        </div>
    </div>
</div>

<div class="top-area">
    <center><h2>User</h2></center> <a href="controller.jsp?page=logout" class="button" style="float: right;background:crimson;color:white">Logout</a>
</div>



<%

    //DAO.print(session.getAttribute("userStatus").toString());
    if(session.getAttribute("userStatus")==null || (session.getAttribute("userType")!=null && !session.getAttribute("userType").toString().equals("superadmin"))  )
    {


%>

<script>alert("Please Login First");</script>
<%
    response.sendRedirect("index.jsp");
%>

<br>
<%
    }

%>

<div class="content-area">
    <div class="panel" style="max-width: 850px;float:left">
        <div class="title">List of All Admins</div>
        <br>
        <br>
        <a href="add_admin.jsp" class="button"><span class="add-btn" style="margin-left: 80px;">Add New Admin</span></a>
        <br>
        <table id="one-column-emphasis" style="min-width: 800px;margin: 5px; margin-top: 35px">
            <colgroup>
                <col class="oce-first" />
            </colgroup>
            <thead>
            <tr>
                <th scope="col">Admin Id</th>
                <th scope="col">Name</th>
                <th scope="col">Email </th>
                <th scope="col">Contact</th>

            </tr>
            </thead>
            <tbody>
            <%
                ArrayList<Admin> list=DAO.getAllAdmins();
                Admin admin;
                for(int i=0;i<list.size();i++)
                {
                    admin=list.get(i);
                    {
            %>

            <tr>
                <td><%=admin.getAdminId() %></td>
                <td><%=admin.getFirstName()+" "+admin.getLastName()%></td>
                <td><%=admin.getEmail()%></td>
                <td><%=admin.getContact()%></td>


            </tr>

            <%
                    }
                } %>

            </tbody>
        </table>
    </div>
</div>

