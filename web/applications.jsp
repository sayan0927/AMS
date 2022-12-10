<%--
  Created by IntelliJ IDEA.
  User: sayan
  Date: 17-10-2022
  Time: 10:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="Models.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="Models.Hostel" %>
<%@ page import="Models.Application" %>
<%@ page import="java.util.regex.Pattern" %>
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
            <a  class="active" href="admin_page.jsp?window=6"><h2>Admission <br> Applications</h2></a>
            <a  href="admin_page.jsp?window=7"><h2>Students</h2></a>
        </div>
    </div>
</div>
<!-- CONTENT AREA -->
<div class="content-area">
    <div class="panel" style="max-width: 900px;float:left">
        <div class="title">List of Applications</div>
        <br>
        <br>

        <br>
        <table id="one-column-emphasis" style="min-width: 800px;margin: 5px; margin-top: 35px">
            <colgroup>
                <col class="oce-first" />
            </colgroup>
            <thead>
            <tr>
                <th scope="col">Applier Id</th>
                <th scope="col">Name</th>
                <th scope="col">Email</th>
                <th scope="col">Contact</th>
                <th scope="col">Course Id</th>
                <th scope="col">Scorecard</th>
                <th scope="col">Reject</th>
                <th scope="col">View</th>

            </tr>
            </thead>
            <tbody>
            <%
                ArrayList<Application> list=DAO.getAllApplications();
                Application application1;
                for(int i=0;i<list.size();i++){
                    application1=list.get(i);

                    if(!application1.getApplicationStatus().equals("pending"))
                        continue;

                    {
            %>

            <tr>
                <td><%=application1.getApplierId() %></td>
                <td><%=application1.getFirstName()+" "+application1.getLastName()%></td>
                <td><%=application1.getEmail()%></td>
                <td><%=application1.getContact()%></td>
                <td><%=application1.getCourseId()%></td>


                <td><a href="DownloadFile?name=<%=application1.getScore()%>"> Download </a> </td>

                <td align="center"><a href="controller.jsp?page=application&operation=reject&appid=<%=application1.getApplierId() %>&email=<%=application1.getEmail() %>"
                                      onclick="return confirm('Are you sure you want to reject this application ?');">
                    <div class="delete-btn" style="max-width: 40px;font-size: 17px; padding: 3px">X</div>
                </a></td>
                <td align="center"><a href="view_application.jsp?appId=<%=application1.getApplierId() %>"
                                      onclick="return confirm('View this application ?');">
                    <div class="edit-btn2" style="max-width: 40px;font-size: 17px; padding: 3px">View</div>
                </a></td>

            </tr>

            <%
                    }
                } %>

            </tbody>
        </table>
    </div>
</div>

