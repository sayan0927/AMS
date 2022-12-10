<%--
  Created by IntelliJ IDEA.
  User: sayan
  Date: 17-10-2022
  Time: 01:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

<%@page import="Models.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="Models.Faculty" %>
<%@ page import="Models.Department" %>
<jsp:useBean id="DAO" class="Database.DatabaseController" scope="page"/>






<%
    String addError=request.getParameter("add_error");
    if( addError!=null && addError.equals("1"))
    {

%>
<script>alert("Error! A Faculty with provided Details already exists");</script>

<br>
<%
    }

%>

<%
    if(session.getAttribute("userStatus")!=null){
        String loginConfirm=session.getAttribute("userStatus").toString();
        if(loginConfirm.equals("1")){

            if(session.getAttribute("userType").equals("admin"))
            {
%>






<center>
    <div class="central-div" style="top:10%">
        <form action="controller.jsp">
            <input type="hidden" name="page" value="add_faculty">
            <table>
                <tr>
                    <td colspan="2">
                        <center><h2>Add Faculty</h2></center>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Faculty Id</label>
                    </td>
                    <td>
                        <input type="text" name="fid" class="text" placeholder="Faculty ID" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>First Name</label>
                    </td>
                    <td>
                        <input type="text"  name="fname" class="text" placeholder="First Name" required>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label>Last Name</label>
                    </td>
                    <td>
                        <input type="text" name="lname" class="text" placeholder="Last Name" required>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label>Email</label>
                    </td>
                    <td>
                        <input type="email" name="email" class="text" placeholder="Email" required>
                    </td>
                </tr>


                <tr>
                    <td>
                        <label>Contact</label>
                    </td>
                    <td>
                        <input type="text" name="contact" class="text" placeholder="contact" maxlength="10" required>
                    </td>
                </tr>






                    <%
                    ArrayList<Department> departments=DAO.getAllDepartments();
                    %>

                <tr>
                    <td>
                        <label for="department">Department </label>
                    </td>

                    <td>
                        <select name="did" class="select" id="department" >
                            <option value="" > None </option>
                            <%
                                for(Department department:departments)
                                {
                            %>
                            <option value="<%=department.getDepartmentId()%>" ><%=department.getDepartmentName()%></option>
                            <%
                                }
                            %>
                        </select>

                    </td>
                </tr>






                <tr>
                    <td>
                        <label>Address</label>
                    </td>
                    <td>
                        <input type="text" name="address" class="text" placeholder="Address" required>
                    </td>
                </tr>



                <tr>
                    <td>
                    </td>
                    <td>
                        <center>

                            <input type="submit" value="Add Faculty" class="button">
                            <a href="admin_page.jsp?window=4" class="button"><span style="color:#3B3B3B;width: 100%">Back</span></a>
                        </center>


                    </td>
                        <%
           }else{%>

                    <center>
                        <br><br><br>
                        <a href="index.jsp" class="button"><span class="add-btn" style="margin-left: 10px;">Please Login as Admin</span></a>
                    </center>
                        <%}



		}else{%>


                    <center>
                        <br><br><br>
                        <a href="index.jsp" class="button"><span class="add-btn" style="margin-left: 10px;">Please Login as Admin</span></a>
                    </center>



                        <%}}else{%>

                    <center>
                        <br><br><br>
                        <a href="index.jsp" class="button"><span class="add-btn" style="margin-left: 10px;">Please Login as Admin</span></a>
                    </center>

                        <%}%>


