<%--
  Created by IntelliJ IDEA.
  User: sayan
  Date: 09-10-2022
  Time: 06:53 PM
  To change this template use File | Settings | File Templates.
--%>


<%@page import="Models.User"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="DAO" class="Database.DatabaseController" scope="page"/>
<%

    User user=DAO.getUserDetails(request.getParameter("modId").toString());



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
                <input type="hidden" name="page" value="profile">
                <table>

                    <tr>
                        <td colspan="2">
                            <center><h2>Edit User</h2></center>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>First Name</label>
                        </td>
                        <td>
                            <input type="text" name="fname" value="<%=user.getFirstName() %>" class="text" placeholder="First Name">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Last Name</label>
                        </td>
                        <td>
                            <input type="text"  name="lname" value="<%=user.getLastName() %>" class="text" placeholder="Last Name">
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <label>User Name</label>
                        </td>
                        <td>
                            <input type="text" name="uid" value="<%=user.getUserId() %>" class="text" placeholder="User Id" readonly>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Email</label>
                        </td>
                        <td>
                            <input type="email" name="email" value="<%=user.getEmail() %>" class="text" placeholder="Email">
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <label>Password</label>
                        </td>
                        <td>
                            <input type="password" value="<%=user.getPassword() %>" name="pass" class="text" placeholder="Password">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Contact No</label>
                        </td>
                        <td>
                            <input type="text" name="contactno" value="<%=user.getContact() %>" class="text" placeholder="Contact No"  maxlength="10">
                        </td>
                    </tr>
                    <tr>

                    </tr>
                    <tr>
                        <td>
                            <label>Address</label>
                        </td>
                        <td>
                            <input type="text" name="address" value="<%=user.getAddress() %>" class="text" placeholder="Address">
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <center>

                                <input type="submit" value="Done" class="button">
                            </center>
                        </td>
                    </tr>
                </table>
            </form>
        </div>




</body>
</html>
