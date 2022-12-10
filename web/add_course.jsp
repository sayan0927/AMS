<%--
  Created by IntelliJ IDEA.
  User: sayan
  Date: 16-10-2022
  Time: 12:08 AM
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
<%@ page import="Models.Department" %>
<jsp:useBean id="DAO" class="Database.DatabaseController" scope="page"/>



<%
    String duplicateError =request.getParameter("duplicate_error");
    if( duplicateError !=null && duplicateError.equals("1"))
    {

%>
<script>alert("Error! Invalid Details or a Course with provided Details already exists");</script>

<br>
<%
    }

%>

<%
    String addError=request.getParameter("add_error");
    if( addError!=null && addError.equals("1"))
    {

%>
<script>alert("Error! Could not add this course");</script>

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
            <input type="hidden" name="page" value="add_course">
            <table>
                <tr>
                    <td colspan="2">
                        <center><h2>Add Course</h2></center>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Course Id</label>
                    </td>
                    <td>
                        <input type="text" name="cid" class="text" placeholder="Course Id" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Course Level</label>
                    </td>
                    <td>
                        <input type="text"  name="clevel" class="text" placeholder="Course Level" required>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label>Course Name</label>
                    </td>
                    <td>
                        <input type="text" name="cname" class="text" placeholder="Course Name" required>
                    </td>
                </tr>

                    <%
                    ArrayList<Department> departments=DAO.getAllDepartments();
                    %>

                <tr>
                    <td>
                        <label for="department">Offering Department </label>
                    </td>

                    <td>
                        <select name="offdept" class="select" id="department" >
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
                    </td>
                    <td>
                        <center>

                            <input type="submit" value="Add Course" class="button">
                            <a href="admin_page.jsp?window=3" class="button"><span style="color:#3B3B3B;width: 100%">Back</span></a>
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



