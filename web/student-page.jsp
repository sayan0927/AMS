<%--
  Created by IntelliJ IDEA.
  User: sayan
  Date: 22-10-2022
  Time: 02:42 PM
  To change this template use File | Settings | File Templates.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="DAO" class="Database.DatabaseController" scope="page"/>
<!DOCTYPE html>
<html>
<head>
    <title>Student</title>
    <link rel="stylesheet" href="css/style-backend.css" type="text/css">
    <link href="${pageContext.request.contextPath}/css/style-backend.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="top-area">
    <center><h2>Student</h2></center> <a href="controller.jsp?page=logout" class="button" style="float: right;background:crimson;color:white">Logout</a>
</div>



<%
    if(session.getAttribute("userStatus")!=null)
    {
        if(session.getAttribute("userStatus").equals("1") && session.getAttribute("userType").equals("student"))
        {



%>

<%

    if(request.getParameter("window").equals("0"))
    {

%>

<jsp:include page="student_details.jsp"/>

<%

    }
        }
        else response.sendRedirect("index.jsp");
    }
    else response.sendRedirect("index.jsp");
%>
</body>
</html>