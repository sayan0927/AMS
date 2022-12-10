<%@ page import="Models.Application" %><%--
  Created by IntelliJ IDEA.
  User: sayan
  Date: 18-10-2022
  Time: 10:19 PM
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
<%@ page import="Models.Hostel" %>
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
Application application1= DAO.getApplicationDetails(request.getParameter("appId"));

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
        <form action="controller.jsp">
            <input type="hidden" name="page" value="accept_app">
            <table>
                <tr>
                    <td colspan="2">
                        <center><h2>Confirm Application</h2></center>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Applier Id</label>
                    </td>
                    <td>
                        <input type="text" name="appid"   value="<%=application1.getApplierId()%>" class="text" placeholder="Applier ID" required readonly>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>First Name</label>
                    </td>
                    <td>
                        <input type="text"  name="fname"  value="<%=application1.getFirstName()%>" class="text" placeholder="First Name" required readonly>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label>Last Name</label>
                    </td>
                    <td>
                        <input type="text" name="lname"  value="<%=application1.getLastName()%>" class="text" placeholder="Last Name" required readonly>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label>Email</label>
                    </td>
                    <td>
                        <input type="text" name="email"  value="<%=application1.getEmail()%>" class="text" placeholder="Email" required readonly>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label>Contact</label>
                    </td>
                    <td>
                        <input type="text" name="contact"  value="<%=application1.getContact()%>" class="text" placeholder="Contact" required readonly>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label>Address</label>
                    </td>
                    <td>
                        <input type="text" name="address"  value="<%=application1.getAddress()%>" class="text" placeholder="Address" required readonly>
                    </td>
                </tr>

                <tr>
                    <td>
                        <label>Selected Course</label>
                    </td>
                    <td>
                        <input type="text" name="cid"  value="<%=application1.getCourseId()%>" class="text" placeholder="Address" required readonly>
                    </td>
                </tr>



                <% if(application1.getHostelRequired().equals("yes"))
                {
                %>

                <%
                    ArrayList<Hostel> hostels=DAO.getAllHostels();
                %>

                <tr>
                    <td>
                        <label for="course">Allot Hostel </label>
                    </td>

                    <td>
                        <select name="hid" class="select" id="course" >
                            <%
                                for(Hostel hostel:hostels)
                                {
                            %>
                            <option value="<%=hostel.getHostelId()%>" ><%=hostel.getHostelName()%></option>
                            <%
                                }
                            %>
                        </select>

                    </td>
                </tr>

                <%
                }
                %>

                <tr>
                    <td>
                    </td>
                    <td>
                        <center>

                            <input type="submit" value="Accept" class="button">
                            <a href="admin_page.jsp?window=6" class="button"><span style="color:#3B3B3B;width: 100%">Back</span></a>
                        </center>


                    </td>


                </tr>







            </table>
        </form>
    </div>
</center>


