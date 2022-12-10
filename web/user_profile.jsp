
<%@page import="Models.User"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="DAO" class="Database.DatabaseController" scope="page"/>
<link href="${pageContext.request.contextPath}/css/style-backend.css" rel="stylesheet" type="text/css" />


<%
    String pending = request.getParameter("pending");
    if(pending!=null && pending.equals("1"))
    {
%>
<script>alert("Your application is pending");</script>

<%
    }
%>

<%
    String alreadyAccepted = request.getParameter("accepted");
    if(alreadyAccepted !=null && alreadyAccepted.equals("1"))
    {
%>
<script>alert("Your application was accepted, Please check your email");</script>

<%
    }
%>

<%
    String alreadyRejected = request.getParameter("rejected");
    if(alreadyRejected !=null && alreadyRejected.equals("1"))
    {
%>
<script>alert("Sorry your application was Rejected");</script>

<%
    }
%>






<%
    User user=DAO.getUserDetails(session.getAttribute("userId").toString());
    String name=user.getFirstName();
    if(session.getAttribute("userType").equals("user")){
%>
<!-- SIDEBAR -->
<div class="sidebar" style="background-image: url(image/Sidebar.jpg)">
    <div class="sidebar-background" >
        <h2 class="logo-text">Dashboard</h2>

        <div class="left-menu">
            <a class="active" href="user_page.jsp?window=0"><h2>Profile</h2></a>
            <a  href="add_application.jsp"><h2>Apply</h2></a>

          <%--  <a href="admin_page.jsp?window=1"><h2>Accounts</h2></a> --%>
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
                    <a class="active" href="user_page.jsp?window=0"><h2>Profile</h2></a>
                    <a href="user_page.jsp?window=2"><h2>Util</h2></a>
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
                    <h2><span class="tag">Your Name</span><span class="val"><%=user.getFirstName()+" " %><%=user.getLastName() %></span><br/>
                        <span class="tag">Email</span><span class="val"><%=user.getEmail() %></span><br/>
                        <span class="tag">Contact No</span><span class="val"><%=user.getContact() %></span><br/>

                        <span class="tag">Address</span><span class="val"><%=user.getAddress() %></span></h2>
                </div>
                <%
                    {
                %><br/>
                <a href="user_page.jsp?window=0&prof_edit=1"><span class="add-btn">Edit Profile</span></a>
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
                        <input type="hidden" name="page" value="profile">
                        <table>

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


                <%
                    }
                %>

            </div>
        </div>