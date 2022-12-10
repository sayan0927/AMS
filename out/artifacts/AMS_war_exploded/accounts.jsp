
<%@page import="Models.User"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="DAO" class="Database.DatabaseController" scope="page"/>
<link href="${pageContext.request.contextPath}/css/style-backend.css" rel="stylesheet" type="text/css" />
<!-- SIDEBAR -->
			<div class="sidebar" style="background-image: url(Image/Sidebar.jpg)">
				<div class="sidebar-background" >
					<h2 class="logo-text">
						Dashboard
					</h2>

                    <div class="left-menu">
                        <a  href="admin_page.jsp?window=1"><h2>Profile</h2></a>
                        <a class="active" href="admin_page.jsp?window=0"><h2>Accounts</h2></a>
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
                                <div class="panel" style="max-width: 850px;float:left">
                                <div class="title">List of All Registered Users</div>
                                <br>
                                <br>
                                 <br>
                                <table id="one-column-emphasis" style="min-width: 800px;margin: 5px; margin-top: 35px">
    <colgroup>
    	<col class="oce-first" />
    </colgroup>
    <thead>
    	<tr>
        	<th scope="col">Name</th>
            <th scope="col">email</th>
            <th scope="col">Address</th>
            <th scope="col">Contact</th>

            
        </tr>
    </thead>
    <tbody>
           <%
              ArrayList<User> list=DAO.getAllUsers();
              User user;
              for(int i=0;i<list.size();i++){
                  user=list.get(i);
                  if(!user.getUserId().equals(session.getAttribute("userId").toString())){
               %>
   
    	<tr>
        	<td><%=user.getFirstName()+" "+user.getLastName() %></td>
            <td><%=user.getEmail() %></td>
            <td><%=user.getAddress() %></td>
            <td><%=user.getContact()%></td>


            
        </tr>

               <%
                  }
                  } %>
               
                </tbody>
</table>
                                </div>
            </div>










