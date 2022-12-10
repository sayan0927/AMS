<%--
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
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css"/>
    <style>
        body {
            background-image: url("Image/1.png");
        }

    </style>
</head>


<%@page import="java.util.ArrayList"%>
<%@ page import="myPackage.classes.*" %>
<%@ page import="Models.Faculty" %>
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
    Hostel hostel=DAO.getHostel(request.getParameter("hid"));

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
            <input type="hidden" name="page" value="edit_hostel">
            <table>
                <tr>
                    <td colspan="2">
                        <center><h2>Edit Hostel</h2></center>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Hostel Id</label>
                    </td>
                    <td>
                        <input type="text" name="hid"   value="<%=hostel.getHostelId()%>" class="text" placeholder="Applier ID" required readonly>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Hostel Name</label>
                    </td>
                    <td>
                        <input type="text"  name="hname"  value="<%=hostel.getHostelName()%>" class="text" placeholder="First Name" required readonly>
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
                            <option value="<%=hostel.getWardenId()%>" ><%=DAO.getWarden(hostel.getWardenId()).getFirstName()+" "+DAO.getWarden(hostel.getWardenId()).getLastName()%></option>
                            <%
                                for(Faculty faculty:faculties)
                                {
                                    if(faculty.getFacultyId().equals(hostel.getWardenId()))
                                        continue;
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

                            <input type="submit" value="Accept" class="button">
                            <a href="admin_page.jsp?window=5" class="button"><span style="color:#3B3B3B;width: 100%">Back</span></a>
                        </center>


                    </td>


                </tr>







            </table>
        </form>
    </div>
</center>


