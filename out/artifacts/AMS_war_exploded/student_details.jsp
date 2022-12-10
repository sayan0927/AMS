<%@page import="java.util.ArrayList"%>
<%@ page import="Database.DatabaseController" %>
<%@ page import="java.io.NotActiveException" %>
<%@ page import="Models.Faculty" %>
<%@ page import="Models.Hostel" %>
<%@ page import="Models.Student" %>
<jsp:useBean id="DAO" class="Database.DatabaseController" scope="page"/>
<link href="${pageContext.request.contextPath}/css/style-backend.css" rel="stylesheet" type="text/css" />
<!-- SIDEBAR -->
<div class="sidebar" style="background-image: url(Image/Sidebar.jpg)">
    <div class="sidebar-background" >
        <h2 class="logo-text">
            Dashboard
        </h2>

        <div class="left-menu">
            <a class="active=" href="student_page.jsp?window=0"><h2>Admission</h2></a>
        </div>
    </div>
</div>


<%
    Student student=DAO.getStudent(session.getAttribute("userId").toString());
    Faculty hod=DAO.getHOD(student.getCourseId());
   if( !DAO.appliedForHostel(session.getAttribute("userId").toString()))
   {
%>
<div class="content-area">
    <div class="panel" style="max-width: 1300px;float:left">

        <br>
        <br>

        <br>
        <table id="one-column-emphasis" style="min-width: 1000px;margin: 5px; margin-top: 35px">
            <colgroup>
                <col class="oce-first" />
            </colgroup>
            <thead>
            <tr>
                <th scope="col">Student</th>
                <th scope="col">Roll Number</th>
                <th scope="col">Status</th>
                <th scope="col">Hostel</th>
                <th scope="col">Course</th>
                <th scope="col">HOD/Advisor</th>
                <th scope="col">HOD Contact</th>
                <th scope="col">HOD Email</th>



            </tr>
            </thead>
            <tbody>


            <tr>
                <td>  <%=student.getFname()+" "+student.getLname()%>  </td>
                <td>  <%=student.getRoll()%>  </td>
                <td>Admitted</td>
                <td>Not Applied</td>
                <td>  <%=DAO.getCourseName(student.getCourseId())%>  </td>
                <td>  <%=hod.getFirstName()+" "+hod.getLastName()%>  </td>
                <td>  <%=hod.getContact()%>  </td>
                <td>  <%=hod.getEmail()%>  </td>

            </tr>



            </tbody>
        </table>
    </div>
</div>





<%  }
   else
   {
       Hostel hostel=DAO.getHostel(student.getHostelId());
       Faculty warden = DAO.getWarden(hostel.getWardenId());
%>











<!-- CONTENT AREA -->
<div class="content-area">
    <div class="panel" style="max-width: 1300px;float:left">

        <br>
        <br>

        <br>
        <table id="one-column-emphasis" style="min-width: 1100px;margin: 5px; margin-top: 35px">
            <colgroup>
                <col class="oce-first" />
            </colgroup>
            <thead>
            <tr>
                <th scope="col">Student</th>
                <th scope="col">Roll Number</th>
                <th scope="col">Status</th>
                <th scope="col">Hostel</th>
                <th scope="col">Warden</th>
                <th scope="col">Warden Contact</th>
                <th scope="col">Warden Email</th>
                <th scope="col">Course</th>
                <th scope="col">HOD/Advisor</th>
                <th scope="col">HOD Contact</th>
                <th scope="col">HOD Email</th>

            </tr>
            </thead>
            <tbody>

            <tr>
                <td><%=student.getFname()+" "+student.getLname()%></td>
                <td>  <%=student.getRoll()%>  </td>
                <td>Admitted</td>
                <td><%=hostel.getHostelName() %></td>
                <td><%=warden.getFirstName()+" "+warden.getLastName() %></td>
                <td><%=warden.getContact() %></td>
                <td><%=warden.getEmail() %></td>
                <td> <%=DAO.getCourseName(student.getCourseId())%>  </td>
                <td>  <%=hod.getFirstName()+" "+hod.getLastName()%>  </td>
                <td>  <%=hod.getContact()%>  </td>
                <td>  <%=hod.getEmail()%>  </td>


            </tr>

            </tbody>
        </table>
    </div>
</div>







<%
   }
%>


