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
<%@ page import="Models.Department" %>
<%@ page import="Models.Faculty" %>
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
    Department department=DAO.getDepartment(request.getParameter("did"));

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
            <input type="hidden" name="page" value="edit_department">
            <table>
                <tr>
                    <td colspan="2">
                        <center><h2>Edit Department</h2></center>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Department Id</label>
                    </td>
                    <td>
                        <input type="text" name="did"   value="<%=department.getDepartmentId()%>" class="text" placeholder="Applier ID" required readonly>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Department Name</label>
                    </td>
                    <td>
                        <input type="text"  name="dname"  value="<%=department.getDepartmentName()%>" class="text" placeholder="First Name" required readonly>
                    </td>
                </tr>


                <%
                    ArrayList<Faculty> faculties=DAO.getFacultiesInDepartment(department.getDepartmentId());
                    faculties.addAll(DAO.getPotentialHODs());
                %>

                <tr>
                    <td>
                        <label for="hod">HOD</label>
                    </td>

                    <td>
                        <select name="hod" class="select" id="hod" >
                            <option value="<%=department.getHodID()%>" ><%=DAO.getFacultyName(department.getHodID())%></option>
                            <%
                                for(Faculty faculty:faculties)
                                {
                                    if(faculty.getFacultyId().equals(department.getHodID()))
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
                            <a href="admin_page.jsp?window=2" class="button"><span style="color:#3B3B3B;width: 100%">Back</span></a>
                        </center>


                    </td>


                </tr>







            </table>
        </form>
    </div>
</center>


