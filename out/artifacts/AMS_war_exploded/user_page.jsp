
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>User</title>
	<link rel="stylesheet" href="css/style-backend.css" type="text/css">
    <link href="${pageContext.request.contextPath}/css/style-backend.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="top-area">
		<center><h2>User</h2></center> <a href="controller.jsp?page=logout" class="button" style="float: right;background:crimson;color:white">Logout</a>
	</div>
    
    <%
            if(session.getAttribute("userStatus")!=null)
            {

           if(session.getAttribute("userStatus").equals("1"))
           {
            %>
            	
           <%-- <div class="menu">
            <a href="user_page.jsp?window=0" class="button">profi</a>
            <a class="button" href="user_page.jsp?window=1">exams</a>
            <a class="button" href="user_page.jsp?window=2">Util</a>
            <a href="controller.jsp?page=logout" class="button" style="float: right;background:crimson;color:white">Logout</a>
            </div>  --%>
            <% 
            //pgpart = pagepart, exams=1,results=2 and profile is default
            if(request.getParameter("window").equals("0"))
            {
                
            %>

                 <jsp:include page="user_profile.jsp"/>

            <%

            }else
            {
            %>

            <%
            }
            %>
            
            <%
           }else response.sendRedirect("index.jsp");
            }else response.sendRedirect("index.jsp");
            
          
           %>
            
           </body>
</html>
            
