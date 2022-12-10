
<%@page import="Models.User"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="Models.Admin" %>
<jsp:useBean id="DAO" class="Database.DatabaseController" scope="page"/>
<link href="${pageContext.request.contextPath}/css/style-backend.css" rel="stylesheet" type="text/css" />

<%
  Admin admin =DAO.getAdminDetails(session.getAttribute("userId").toString());

  if(session.getAttribute("userType").equals("admin")){
%>
<!-- SIDEBAR -->
<div class="sidebar" style="background-image: url(image/Sidebar.jpg)">
  <div class="sidebar-background" >
    <h2 class="logo-text">Dashboard</h2>

    <div class="left-menu">
      <a class="active" href="admin_page.jsp?window=1"><h2>Profile</h2></a>
      <a  href="admin_page.jsp?window=0"><h2>Accounts</h2></a>
      <a  href="admin_page.jsp?window=2"><h2>Departments</h2></a>
      <a  href="admin_page.jsp?window=3"><h2>Courses</h2></a>
      <a  href="admin_page.jsp?window=4"><h2>Faculties</h2></a>
      <a  href="admin_page.jsp?window=5"><h2>Hostels</h2></a>
      <a  href="admin_page.jsp?window=6"><h2>Admission <br> Applications</h2></a>
      <a  href="admin_page.jsp?window=7"><h2>Students</h2></a>

    </div>
  </div>
</div>
<!-- CONTENT AREA -->
<div class="content-area">
  <div class="panel" style="float: left;max-width: 600px">

      <%
           }else{
               %>

    <!-- SIDEBAR -->
    <div class="sidebar" style="background-image: url(images/sidebar-1.jpg)">
      <div class="sidebar-background" >
        <h2 class="logo-text">
          Dashboard
        </h2>
        <div class="left-menu">
          <a class="active" href="admin_page.jsp"><h2>Profile</h2></a>
          <a href="admin_page.jsp"><h2>Util</h2></a>
        </div>
      </div>

    </div>
    <!-- CONTENT AREA -->
    <div class="content-area">
      <div class="panel" style="float: left;max-width: 600px">
        <%
          }
          if(request.getParameter("prof_edit")==null){
        %>
        <div class="title">Profile</div>
        <div class="profile ">
          <h2><span class="tag">Your Name</span><span class="val"><%=admin.getFirstName()+" " %><%=admin.getLastName() %></span><br/>
            <span class="tag">Email</span><span class="val"><%=admin.getEmail() %></span><br/>
            <span class="tag">Contact No</span><span class="val"><%=admin.getContact() %></span><br/>
            <span class="tag">Address</span><span class="val"><%=admin.getAddress() %></span></h2>
        </div>
        <%
          {
        %><br/>
        <a href="admin_page.jsp?window=1&prof_edit=1"><span class="add-btn">Edit Profile</span></a>
        <%
          }
        %>

        <%
        }else{
        %>

        <!-- Start of Edit Form --->
        <div class="title">Edit Profile</div>
        <div class="central-div form-style-6" style="position:inherit;margin-top: 70px;" >
          <form action="controller.jsp">
            <input type="hidden" name="page" value="profile_admin">
            <table>

              <tr>
                <td>
                  <label>First Name</label>
                </td>
                <td>
                  <input type="text" name="fname" value="<%=admin.getFirstName() %>" class="text" placeholder="First Name">
                </td>
              </tr>
              <tr>
                <td>
                  <label>Last Name</label>
                </td>
                <td>
                  <input type="text" name="lname" value="<%=admin.getLastName() %>" class="text" placeholder="Last Name">
                </td>
              </tr>

              <tr>
                <td>
                  <label>User Name</label>
                </td>
                <td>
                  <input type="text" name="aid" value="<%=admin.getAdminId() %>" class="text" placeholder="User Id" readonly>
                </td>
              </tr>
              <tr>
                <td>
                  <label>Email</label>
                </td>
                <td>
                  <input type="email" name="email" value="<%=admin.getEmail() %>" class="text" placeholder="Email">
                </td>
              </tr>

              <tr>
                <td>
                  <label>Password</label>
                </td>
                <td>
                  <input type="password" value="<%=admin.getPassword() %>" name="pass" class="text" placeholder="Password">
                </td>
              </tr>
              <tr>
                <td>
                  <label>Contact No</label>
                </td>
                <td>
                  <input type="text" name="contactno" value="<%=admin.getContact() %>" class="text" placeholder="Contact No"  maxlength="10">
                </td>
              </tr>
              <tr>
              </tr>
              <tr>
                <td>
                  <label>Address</label>
                </td>
                <td>
                  <input type="text" name="address" value="<%=admin.getAddress() %>" class="text" placeholder="Address">
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


        <%
          }
        %>

      </div>
    </div>