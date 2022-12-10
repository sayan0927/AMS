<%--
  Created by IntelliJ IDEA.
  User: sayan
  Date: 17-10-2022
  Time: 01:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="Models.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="Models.Faculty" %>
<%@ page import="java.util.Comparator" %>
<jsp:useBean id="DAO" class="Database.DatabaseController" scope="page"/>
<link href="${pageContext.request.contextPath}/css/style-backend.css" rel="stylesheet" type="text/css" />
<!-- SIDEBAR -->
<div class="sidebar" style="background-image: url(Image/Sidebar.jpg)">
    <div class="sidebar-background" >
        <h2 class="logo-text">
            Dashboard
        </h2>


        <%
            String deleteError=request.getParameter("delete_error");
            if(deleteError!=null && deleteError.equals("1"))
            {
        %>
        <script>alert("Error! Cannot Fire this faculty as he/she is a HOD or a Warden");</script>
        <%
            }
        %>

        <div class="left-menu">
            <a  href="admin_page.jsp?window=1"><h2>Profile</h2></a>
            <a  href="admin_page.jsp?window=0"><h2>Accounts</h2></a>
            <a  href="admin_page.jsp?window=2"><h2>Departments</h2></a>
            <a  href="admin_page.jsp?window=3"><h2>Courses</h2></a>
            <a  class="active" href="admin_page.jsp?window=4"><h2>Faculties</h2></a>
            <a  href="admin_page.jsp?window=5"><h2>Hostels</h2></a>
            <a  href="admin_page.jsp?window=6"><h2>Admission <br> Applications</h2></a>
            <a  href="admin_page.jsp?window=7"><h2>Students</h2></a>
        </div>
    </div>
</div>
<!-- CONTENT AREA -->
<div class="content-area">
    <div class="panel" style="max-width: 850px;float:left">
        <div class="title">List of All Faculties</div>
        <br>
        <br>
        <a href="add_faculty.jsp"   onclick="return confirm('If this faculty will be HOD of a new department' +
         ' keep Department field to None');" class="button"><span class="add-btn" style="margin-left: 80px;">Add New Faculty</span></a>
        <br>
        <table id="one-column-emphasis" style="min-width: 800px;margin: 5px; margin-top: 35px">
            <colgroup>
                <col class="oce-first" />
            </colgroup>
            <thead>
            <tr>
                <th scope="col">Faculty Id</th>
                <th scope="col">Name</th>
                <th scope="col">Email</th>
                <th scope="col">Contact</th>
                <th scope="col">Department Id</th>
                <th scope="col">Address</th>

            </tr>
            </thead>
            <tbody>
            <%
                ArrayList<Faculty> list=DAO.getAllFaculties();
                list.sort(new Comparator<Faculty>() {
                    @Override
                    public int compare(Faculty o1, Faculty o2) {
                        return Integer.parseInt(o1.getFacultyId())-Integer.parseInt(o2.getFacultyId());
                    }
                });
                Faculty faculty;
                for(int i=0;i<list.size();i++){
                    faculty=list.get(i);
                   {
            %>

            <tr>
                <td><%=faculty.getFacultyId() %></td>
                <td><%=faculty.getFirstName()+" "+faculty.getLastName() %></td>
                <td><%=faculty.getEmail() %></td>
                <td><%=faculty.getContact() %></td>
                <td><%=faculty.getDepartment_id()!=null ? faculty.getDepartment_id(): "N/A" %></td>
                <td><%=faculty.getAddress() %></td>
                <td align="center"><a href="controller.jsp?page=faculty&operation=del&fid=<%=faculty.getFacultyId() %>"
                                      onclick="return confirm('Are you sure you want to fire this faculty ?');">
                    <div class="delete-btn" style="max-width: 40px;font-size: 17px; padding: 3px">X</div>
                </a></td>
                <td align="center"><a href="edit_faculty.jsp?fid=<%=faculty.getFacultyId() %>"
                                      onclick="return confirm('Are you sure you want to edit faculty ?');">
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








