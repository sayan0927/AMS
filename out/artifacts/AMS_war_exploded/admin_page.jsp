
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="DAO" class="Database.DatabaseController" scope="page"/>
<!DOCTYPE html>
<html>
<head>
	<title>Admin</title>
	<link rel="stylesheet" href="css/style-backend.css" type="text/css">
    <link href="${pageContext.request.contextPath}/css/style-backend.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="top-area">
		<center><h2>Admin Panel</h2></center> <a href="controller.jsp?page=logout" class="button" style="float: right;background:crimson;color:white">Logout</a>
	</div>



            <%
            if(session.getAttribute("userStatus")!=null){
            if(session.getAttribute("userStatus").equals("1") && session.getAttribute("userType").equals("admin"))
            {



            
            %>
            
            <% 

            if(request.getParameter("window").equals("1"))
            {
                
            %>

             <jsp:include page="admin_profile.jsp"/>
            
            <%
                
            }else if(request.getParameter("window").equals("3"))
            {

            %>
                <jsp:include page="course.jsp"/>
            <%


            }
            else if(request.getParameter("window").equals("2"))
            {
            
                %>
            
                <jsp:include page="department.jsp"/>
                
                <%
                
            }
            else if(request.getParameter("window").equals("4"))
            {

                      %>

                      <jsp:include page="faculties.jsp"/>

                     <%
            }
            else if(request.getParameter("window").equals("5"))
            {

                %>
                        <jsp:include page="hostel.jsp"/>
                <%

            }
            else if(request.getParameter("window").equals("6"))
            {

            %>
                     <jsp:include page="applications.jsp"/>
            <%

            }

            else if(request.getParameter("window").equals("7"))
            {

            %>
                     <jsp:include page="registered_students.jsp"/>
            <%
             }

            else
            {
                %>

                 <jsp:include page="accounts.jsp"/>

            
            <%
            }
            %>
            
            <%
            }
            else response.sendRedirect("index.jsp");
            }
            else response.sendRedirect("index.jsp");
            %>
</body>
</html>