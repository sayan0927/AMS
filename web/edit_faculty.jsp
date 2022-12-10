<%--
  Created by IntelliJ IDEA.
  User: sayan
  Date: 09-10-2022
  Time: 06:53 PM
  To change this template use File | Settings | File Templates.
--%>


<%@page import="Models.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="Models.Faculty" %>
<%@ page import="Models.Department" %>
<%@ page import="java.util.List" %>
<jsp:useBean id="DAO" class="Database.DatabaseController" scope="page"/>


<%

    //DAO.print(session.getAttribute("userStatus").toString());
    if(session.getAttribute("userStatus")==null || (session.getAttribute("userType")!=null && !session.getAttribute("userType").toString().equals("admin"))  )
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


<%
    String error=request.getParameter("error");
    if(error!=null && error.equals("1"))
    {
%>
<script>alert("Error! This Email/Contact is already in use");</script>
<%
    }
%>


<%
    Faculty faculty=DAO.getFaculty(request.getParameter("fid").toString());
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="css/style-backend.css" type="text/css">
    <link href="${pageContext.request.contextPath}/css/style-backend.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
    <style>
        body {
            background-image: url("Image/1.png");
        }

    </style>
</head>
<body>




<!-- Start of Edit Form --->

<div class="central-div" style="top:10%">
    <form action="controller.jsp">
        <input type="hidden" name="page" value="edit_faculty">
        <table>

            <tr>
                <td colspan="2">
                    <center><h2>Edit Faculty</h2></center>
                </td>
            </tr>

            <tr>
                <td>
                    <label>Faculty Id</label>
                </td>
                <td>
                    <input type="text" name="fid" value="<%=faculty.getFacultyId() %>" class="text"  readonly>
                </td>
            </tr>



            <tr>
                <td>
                    <label>First Name</label>
                </td>
                <td>
                    <input type="text" name="fname" value="<%=faculty.getFirstName() %>" class="text" >
                </td>
            </tr>
            <tr>
                <td>
                    <label>Last Name</label>
                </td>
                <td>
                    <input type="text"  name="lname" value="<%=faculty.getLastName() %>" class="text" >
                </td>
            </tr>

            <tr>
                <td>
                    <label>Email</label>
                </td>
                <td>
                    <input type="email" name="femail" value="<%=faculty.getEmail() %>" class="text">
                </td>
            </tr>

            <tr>
                <td>
                    <label>Contact</label>
                </td>
                <td>
                    <input type="text" dirname="fcontact" value="<%=faculty.getContact() %>" name="fcontact" class="text"  maxlength="10">
                </td>
            </tr>

            <tr>

            </tr>
            <tr>
                <td>
                    <label>Address</label>
                </td>
                <td>
                    <input type="text" name="faddress" value="<%=faculty.getAddress() %>" class="text" >
                </td>
            </tr>


            <tr>
                <td>
                    <label>Department</label>
                </td>
                <td>
                    <%
                        Department department=DAO.getDepartment(faculty.getDepartment_id());
                        if(department!=null)
                        {
                    %>
                    <input type="text" name="fdept" value="<%= department.getDepartmentId()%>" class="text" readonly>
                    <%
                        }
                        else
                        {
                    %>
                         <select name="fdept" class="select" id="department" >
                        <option value="" > None </option>
                    <%

                            List<Department> departments=DAO.getAllDepartments();
                            for(Department d:departments)
                            {
                    %>

                     <option value="<%=d.getDepartmentId()%>" ><%=d.getDepartmentName()%></option>
                    <%
                            }
                        }
                    %>
                    </select>
                </td>
            </tr>

            <tr>
                <td>
                </td>
                <td>
                    <center>
                        <input type="submit" value="Submit" class="button">
                        <a href="admin_page.jsp?window=4" class="button"><span style="color:#3B3B3B;width: 100%">Back</span></a>
                    </center>
                </td>
            </tr>
        </table>
    </form>
</div>




</body>
</html>
