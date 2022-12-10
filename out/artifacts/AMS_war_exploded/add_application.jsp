<%--
  Created by IntelliJ IDEA.
  User: sayan
  Date: 17-10-2022
  Time: 07:30 PM
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
<%@ page import="Models.Course" %>
<jsp:useBean id="DAO" class="Database.DatabaseController" scope="page"/>



<%

    //DAO.print(session.getAttribute("userStatus").toString());
    if(session.getAttribute("userStatus")==null || (session.getAttribute("userType")!=null && !session.getAttribute("userType").toString().equals("user"))  )
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
    if(DAO.applicationAccepted(session.getAttribute("userId").toString()))
    {
%>
<script>alert("You have already applied");</script>
<%
    response.sendRedirect("user_page.jsp?window=0&accepted=1");
%>

<%
    }
    else if(DAO.applicationRejected(session.getAttribute("userId").toString()))
    {
%>
<script>alert("You have already applied");</script>
<%
    response.sendRedirect("user_page.jsp?window=0&rejected=1");
%>

<%
    }
    else if(DAO.applicationPending(session.getAttribute("userId").toString()))
    {
%>

<script>alert("You have already applied");</script>
<%
    response.sendRedirect("user_page.jsp?window=0&pending=1");
%>

<%
    }
%>










<%
    User user=DAO.getUserDetails(session.getAttribute("userId").toString());

%>




<%
    String addError=request.getParameter("add_error");
    if( addError!=null && addError.equals("1"))
    {

%>
<script>alert("Error!");</script>

<br>
<%
    }

%>




<center>
    <div class="central-div" style="top:5%">
        <form action="addApplication/" enctype="multipart/form-data"
              method="post">
            <input type="hidden" name="page" value="apply">
            <table>
                <tr>
                    <td colspan="2">
                        <center><h2>Apply for Admission</h2></center>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Applier Id</label>
                    </td>
                    <td>
                        <input type="text" name="appid"   value="<%=user.getUserId()%>" class="text" placeholder="Applier ID" required readonly>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>First Name</label>
                    </td>
                    <td>
                        <input type="text"  name="fname"  value="<%=user.getFirstName()%>" class="text" placeholder="First Name" required>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label>Last Name</label>
                    </td>
                    <td>
                        <input type="text" name="lname"  value="<%=user.getLastName()%>" class="text" placeholder="Last Name" required>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label>Email</label>
                    </td>
                    <td>
                        <input type="text" name="email"  value="<%=user.getEmail()%>" class="text" placeholder="Email" required>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label>Contact</label>
                    </td>
                    <td>
                        <input type="text" name="contact"  value="<%=user.getContact()%>" class="text" placeholder="Contact" required>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label>Address</label>
                    </td>
                    <td>
                        <input type="text" name="address"  value="<%=user.getAddress()%>" class="text" placeholder="Address" required>
                    </td>
                </tr>


                <%
                    ArrayList<Course> courses=DAO.getAllCourses();
                %>

                <tr>
                    <td>
                        <label for="course">Preferred Course </label>
                    </td>

                    <td>
                        <select name="cid" class="select" id="course" >
                        <%
                            for(Course course:courses)
                            {
                        %>
                            <option value="<%=course.getCourseId()%>" ><%=course.getCourseName()%></option>
                            <%
                            }
                            %>
                        </select>

                    </td>
                </tr>

                <tr>
                    <td>
                        <label>Scorecard</label>
                    </td>
                    <td>
                         <input type="file" class="upload" accept=".pdf" name="file_name" required /><br>
                    </td>
                </tr>



                <tr>
                    <td>
                        <label for="hostelRequired">Hostel Required </label>
                    </td>
                    <td>
                        <select name="hostelRequired" class="select" id="hostelRequired">
                            <option value="yes" >Yes</option>
                            <option value="no" >No</option>
                        </select>
                    </td>

                </tr>

                <tr>
                    <td>
                    </td>
                    <td>
                        <center>

                            <input type="submit" value="Apply" class="button">
                            <a href="user_page.jsp?window=0" class="button"><span style="color:#3B3B3B;width: 100%">Back</span></a>
                        </center>


                    </td>


                </tr>







            </table>
        </form>
    </div>
</center>


