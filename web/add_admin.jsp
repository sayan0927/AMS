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
<script>alert("Error! Could not add this Admin");</script>

<br>
<%
    }

%>




<%
    if(session.getAttribute("userStatus")!=null){
        String loginConfirm=session.getAttribute("userStatus").toString();
        if(loginConfirm.equals("1")){

            if(session.getAttribute("userType").equals("superadmin"))
            {
%>






<center>
    <div class="central-div" style="top:10%">
        <form action="controller.jsp">
            <input type="hidden" name="page" value="add_admin">
            <table>
                <tr>
                    <td colspan="2">
                        <center><h2>Add Admin</h2></center>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Admin Id</label>
                    </td>
                    <td>
                        <input type="text" name="aid" class="text" placeholder="Admin Id" required>
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
                        <label>Password</label>
                    </td>
                    <td>
                        <input type="password" name="pass" class="text" placeholder="Last Name" required>
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
                        <input type="tel" name="contact" class="text" placeholder="Contact" maxlength="10" pattern="[0-9]{10}" required>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label>Address</label>
                    </td>
                    <td>
                        <input type="tel" name="address" class="text" placeholder="Address" >
                    </td>
                </tr>





                <tr>
                    <td>
                    </td>
                    <td>
                        <center>

                            <input type="submit" value="Add Admin" class="button">
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



