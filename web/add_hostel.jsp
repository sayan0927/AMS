<%--
  Created by IntelliJ IDEA.
  User: sayan
  Date: 17-10-2022
  Time: 07:21 PM
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



<%@page import="Models.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="Models.Faculty" %>
<jsp:useBean id="DAO" class="Database.DatabaseController" scope="page"/>



<%
    String addError=request.getParameter("add_error");
    if( addError!=null && addError.equals("1"))
    {

%>
<script>alert("Error! A Hostel with provided Details already exists");</script>

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
            <input type="hidden" name="page" value="add_hostel">
            <table>
                <tr>
                    <td colspan="2">
                        <center><h2>Add Hostel</h2></center>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Hostel Id</label>
                    </td>
                    <td>
                        <input type="text" name="hid" class="text" placeholder="Hostel ID" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Hostel Name</label>
                    </td>
                    <td>
                        <input type="text"  name="hname" class="text" placeholder="Hostel Name" required>
                    </td>
                </tr>





                    <%
                    ArrayList<Faculty> faculties=DAO.getAllFaculties();
                    %>

                <tr>
                    <td>
                        <label for="warden">Warden</label>
                    </td>

                    <td>
                        <select name="wid" class="select" id="warden" >
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

                            <input type="submit" value="Add Hostel" class="button">
                            <a href="admin_page.jsp?window=5" class="button"><span style="color:#3B3B3B;width: 100%">Back</span></a>
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



