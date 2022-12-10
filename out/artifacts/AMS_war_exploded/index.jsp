<%@ page import="java.util.List" %>
<%@ page import="Models.Department" %>
<%@ page import="Util.Config" %>

<%
	Config.currentURL=config.getServletContext().getInitParameter("currentURL"); // Contains "bar"
	Config.databaseURL=config.getServletContext().getInitParameter("DatabaseURL");
	Config.databaseUsername=config.getServletContext().getInitParameter("DatabaseUsername");
	Config.databasePassword=config.getServletContext().getInitParameter("DatabasePassword");
	Config.scorecardStorage=config.getServletContext().getInitParameter("scorecardStorage");
	Config.systemEmail=config.getServletContext().getInitParameter("systemEmail");
	Config.systemEmailPassword=config.getServletContext().getInitParameter("systemEmailPassword");
	Config.systemEmailHost=config.getServletContext().getInitParameter("systemEmailHost");
	Config.superAdminUserName=config.getServletContext().getInitParameter("superAdminUsername");
	Config.superAdminPassword=config.getServletContext().getInitParameter("superAdminPassword");
%>



<!DOCTYPE html>
<jsp:useBean id="DAO" class="Database.DatabaseController" scope="page"/>
<html>
<head>
	<link href="./css/index.css" type="text/css" rel="stylesheet">
	<title>HOME</title>
	<style>
		body {
			background-image: url("Image/bg_home.jpg");
		}
	</style>
</head>

<body id="homeBody">
<div class="outer_main">
	<header >
		<div class="header">
			<div class="logo" style="font-weight: 800; font-size: large; display: flex;">
				<img src="Image/icons/mainLogo.png"></img>
				<div>
					<p>NITC</p>
					<p style="font-size: 12px;">Quality par excellence</p>
				</div>
			</div>

			<div style="display: flex;">
				<div style="padding-right: 40px; padding-left: 40px; border-right: 1px solid grey;">
					<p style="font-size: 10px; color: grey;">EMAIL</p>
					<p style="font-size: 20px;">info@nitc.ac.in</p>
				</div>
				<div style="padding-right: 40px; padding-left: 40px; border-right: 1px solid grey;">
					<p style="font-size: 10px; color: grey;">CONTACT</p>
					<p style="font-size: 20px;">1800-0000-0000</p>
				</div>
				<button class="nav-element" onclick="location.href='login_signup.jsp'" style="text-decoration: none; color:white">LOGIN / SIGNUP</button>

			</div>

		</div>

	</header>


	<div class="panels">

		<div class="dropdown">
			<div class="panel_names"><a><h3>HOME</h3></a></div>
			<div class="dropdown-content">
				<a href="./maintanence.jsp">NOTIFICATIONS</a>
				<a href="./maintanence.jsp">NEW ADMISSIONS</a>
				<a href="./maintanence.jsp">DEPARTMENTS</a>
				<a href="./maintanence.jsp">SCHOLARSHIPS</a>
			</div>
		</div>

		<%--
		<div class="dropdown">
			<div class="panel_names"><a><h3>DEPARTMENTS</h3></a></div>
			<div class="dropdown-content">
				<a href="./maintanence.jsp">COMPUTER SCIENCE</a>
				<a href="./maintanence.jsp">MECHANICAL</a>
				<a href="./maintanence.jsp">ARCHITECTURE</a>
				<a href="./maintanence.jsp">CIVIL</a>
				<a href="./maintanence.jsp">ELECTRONICS & COMMUNICATIONS</a>
				<a href="./maintanence.jsp">+MORE...</a>
			</div>
		</div>

		--%>




		<div class="dropdown">
			<div class="panel_names"><a><h3>DEPARTMENTS</h3></a></div>
			<div class="dropdown-content">
				<%
					List<Department> departments=DAO.getAllDepartments();
					for(Department department:departments)
					{
				%>
				<a href="./maintanence.jsp"><%=department.getDepartmentName() %></a>
				<%
					}
				%>
			</div>
		</div>



		<div class="dropdown">
			<div class="panel_names"><a><h3>ADMISSIONS</h3></a></div>
			<div class="dropdown-content">
				<a href="./maintanence.jsp">UG ADMISSIONS</a>
				<a href="./maintanence.jsp">PG ADMISSIONS</a>
				<a href="./maintanence.jsp">M.Phil. / PhD</a>
			</div>
		</div>

		<div class="dropdown">
			<div class="panel_names"><a><h3>ACADEMICS</h3></a></div>
			<div class="dropdown-content">
				<a href="./maintanence.jsp">CURRICULUM</a>
				<a href="./maintanence.jsp">SYLLABUS</a>
				<a href="./maintanence.jsp">COURSE MATERIAL</a>
				<a href="./maintanence.jsp">TIME TABLE</a>
				<a href="./maintanence.jsp">VIDEO LECTURES</a>
			</div>
		</div>


		<div class="dropdown">
			<div class="panel_names"><a><h3>REPORTS\</h3></a></div>
			<div class="dropdown-content">
				<a href="./maintanence.jsp">PLACEMENT REPORTS</a>
				<a href="./maintanence.jsp">NAAC GRADING</a>
				<a href="./maintanence.jsp">NBA GRADING</a>
				<a href="./maintanence.jsp">NIRF PERFORMANCE</a>
				<a href="./maintanence.jsp">PREVIOUS ACHIEVEMENTS</a>
			</div>
		</div>

		<div class="dropdown">
			<div class="panel_names"><a><h3>HOSTELS</h3></a></div>
			<div class="dropdown-content">
				<a href="./maintanence.jsp">HOSTEL ADMISSIONS</a>
				<a href="./maintanence.jsp">APPLY</a>
				<a href="./maintanence.jsp">RULES</a>
				<a href="./maintanence.jsp">DUES</a>
				<a href="./maintanence.jsp">NOTIFICATIONS</a>
				<a href="./maintanence.jsp">GRIEVANCE</a>
			</div>
		</div>

		<div class="dropdown">
			<div class="panel_names"><a><h3>CONTACT</h3></a></div>
			<div class="dropdown-content">
				<a href="./maintanence.jsp">EMAIL</a>
				<a href="./maintanence.jsp">PHONE</a>
				<a href="./maintanence.jsp">SUGGESTIONS / FEEDBACK</a>
			</div>
		</div>

		<div class="dropdown">
			<div class="panel_names"><a><h3>ABOUT US</h3></a></div>
			<div class="dropdown-content" style="margin-left: -31px;">
				<a href="./maintanence.jsp">HISTORY</a>
				<a href="./maintanence.jsp">ESTABLISHMENT</a>
				<a href="./maintanence.jsp">PATREONS</a>
			</div>
		</div>

	</div>


	<div class="main" style="background-image: url(Image/bg_main.jpg)">
		<div class="main_card">
			<!-- <h3>National Institue of Technology Calicut</h3> -->
			<p><br>An institue of excellence, in service of nation since 75 years,celeberating its Diamond Jubilee.</p>
			<p>Whole heartidly welcoming you to experince the magnificient blend of education with exposure.</p>
			<button class="apply-now" onclick="location.href='login_signup.jsp'">APPLY NOW</button>
		</div>
	</div>

	<div class="bottom">
		<div class="bottom_sub">
			<div class="bottom-text">
				<img src="Image/icons/teachings.png">
				<p>Get taught by industry experts and best of hands on experience with our top class faculties.</p>
				<p>Get in touch with latest technological trends and industrial demands with us.</p>
			</div>
			<div class="b">
				<button class="know-more">KNOW MORE</button>
			</div>

		</div>

		<div class="bottom_sub">
			<div class="bottom-text">
				<img src="Image/icons/books.png">
				<p>We at NITC provide best quality level education with most advanced technologies thus enabling students to survive in this ever evolving era.</p>
			</div>
			<div class="b">
				<button class="know-more">KNOW MORE</button>
			</div>
		</div>

		<div class="bottom_sub">
			<div class="bottom-text">
				<img src="Image/icons/worldwide.png">
				<p>Here at NITC, we offer students worlwide exposure by the means of excursions, seminars, webinars and workshops.</p>
				<p>You can gain the unmatched international appeal here.</p>
			</div>
			<div class="b">
				<button class="know-more">KNOW MORE</button>
			</div>
		</div>

		<div class="bottom_sub">
			<div class="bottom-text">
				<img src="Image/icons/sports.png">
				<p>Not only education, we equally pay our attention to ECA, specifically to promote physical and mental wellness with well trained staffs, coaches and facilities.</p>
			</div>
			<div class="b">
				<button class="know-more">KNOW MORE</button>
			</div>
		</div>
	</div>

</div>
</body>
</html>
