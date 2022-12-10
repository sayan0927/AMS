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
<jsp:useBean id="DAO" class="Database.DatabaseController" scope="page"/>


<%
	if(session.getAttribute("userStatus")!=null){
		String loginConfirm=session.getAttribute("userStatus").toString();
		if(loginConfirm.equals("1")){

			if(session.getAttribute("userType").equals("admin"))
			{
%>
<center>
	<div class="central-div" style="top:10%">
		<form action="controller.jsp">
			<input type="hidden" name="page" value="register_admin">
			<table>
				<tr>
					<td colspan="2">
						<center><h2>Add Admin</h2></center>
					</td>
				</tr>
				<tr>
					<td>
						<label>First Name</label>
					</td>
					<td>
						<input type="text" name="fname" class="text" placeholder="First Name">
					</td>
				</tr>
				<tr>
					<td>
						<label>Last Name</label>
					</td>
					<td>
						<input type="text"  name="lname" class="text" placeholder="Last Name">
					</td>
				</tr>

				<tr>
					<td>
						<label>User Name</label>
					</td>
					<td>
						<input type="text" name="aid" class="text" placeholder="User Id">
					</td>
				</tr>
				<tr>
					<td>
						<label>Email</label>
					</td>
					<td>
						<input type="email" name="email" class="text" placeholder="Email">
					</td>
				</tr>

				<tr>
					<td>
						<label>Password</label>
					</td>
					<td>
						<input type="password" name="pass" class="text" placeholder="Password">
					</td>
				</tr>
				<tr>
					<td>
						<label>Contact No</label>
					</td>
					<td>
						<input type="text" name="contactno" class="text" placeholder="Contact No">
					</td>
				</tr>
				<tr>
					<td>
						<label>City</label>
					</td>

				</tr>
				<tr>
					<td>
						<label>Address</label>
					</td>
					<td>
						<input type="text" name="address" class="text" placeholder="Address">
					</td>
				</tr>
				<tr>
					<td>
					</td>
<td>
						<center>

							<input type="submit" value="Register Now" class="button">
						</center>


</td>
			<%
           }else{%>

					<center>
						<br><br><br>
					<a href="index.jsp" class="button"><span class="add-btn" style="margin-left: 10px;">Please Login as Admin</span></a>
					</center>
						<%}



		}else{%>


		<center>
						<br><br><br>
					<a href="index.jsp" class="button"><span class="add-btn" style="margin-left: 10px;">Please Login as Admin</span></a>
					</center>



	<%}}else{%>

					<center>
						<br><br><br>
						<a href="index.jsp" class="button"><span class="add-btn" style="margin-left: 10px;">Please Login as Admin</span></a>
					</center>

<%}%>