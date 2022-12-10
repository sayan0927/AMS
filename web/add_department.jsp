<%--
  Created by IntelliJ IDEA.
  User: sayan
  Date: 15-10-2022
  Time: 09:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <title>Add Department</title>
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
<jsp:useBean id="DAO" class="Database.DatabaseController" scope="page"/>



<%
    String addError=request.getParameter("add_error");
    if( addError!=null && addError.equals("1"))
    {

%>
<script>alert("Error! ");</script>

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
            <input type="hidden" name="page" value="add_department">
            <table>
                <tr>
                    <td colspan="2">
                        <center><h2>Add Department</h2></center>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Department Id</label>
                    </td>
                    <td>
                        <input type="text" name="did" class="text" placeholder="Department ID" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Department Name</label>
                    </td>
                    <td>
                        <input type="text"  name="dname" class="text" placeholder="Department Name" required>
                    </td>
                </tr>



                    <%
                    ArrayList<Faculty> faculties=DAO.getPotentialHODs();
                    %>

                <tr>
                    <td>
                        <label for="hod">HOD</label>
                    </td>

                    <td>
                        <select name="hid" class="select" id="hod" >
                            <%
                                for(Faculty faculty:faculties)
                                {
                            %>
                            <option value="<%=faculty.getFacultyId()%>" ><%=faculty.getFirstName()+" "+faculty.getLastName()%></option>
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

                            <%
                                if(faculties.size()>0)
                                {
                            %>
                            <input type="submit" value="Add Department" class="button">
                            <%
                                }
                            %>
                            <a href="admin_page.jsp?window=2" class="button"><span style="color:#3B3B3B;width: 100%">Back</span></a>
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


