<!doctype html>
<html><head>
  <meta charset="utf-8">
  <title>Login</title>



  <link href="css/slider.css" rel="stylesheet" type="text/css">
  <link href="css/form.css" rel="stylesheet" type="text/css">
  <link href="css/main.css" rel="stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/css/slider.css" rel="stylesheet" type="text/css" />
  <link href="${pageContext.request.contextPath}/css/form.css" rel="stylesheet" type="text/css" />
  <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet" type="text/css" />
  <style>a {
    color: blue;
    font-size: 15px;
    font-style: italic ;
  }


  /* visited link */
  a:visited {
    color: purple;

  }

  a:hover {
    color: red;
  }



  </style>
</head>

<body bgcolor="#FFFFFF">
<div id="heading" style="display: none">

  <button onclick="document.getElementById('form').style.display='block'" style="width:auto;">Login</button>
  <div id="information">
    <p>&nbsp;</p>
    <p><b><a href="forgot_password.jsp?error=0" ><u>Forgot Password?</u></a></b></p>


  </div>
</div>



<%
  String registrationError=request.getParameter("registration_error");
  if( registrationError!=null && registrationError.equals("1"))
  {
    registrationError=null;

%>
<script>alert("Error! Username/Email/Contact already exists");</script>

<br>
<%
  }

%>

<div id="form" class="modal" style="display: block">
  <div class="container animate" id="container">
   <%-- <span onclick="document.getElementById('form').style.display='none'" class="close" title="Close">&times;</span> --%>
     <span onclick="window.location.href='index.jsp'" class="close" title="Close">&times;</span>
    <div class="form-container sign-up-container">
      <form method='post' action="controller.jsp">
        <input type="hidden" name="page" value="register">
        <h1>Create Account</h1>
        <input type="text" placeholder="Enter First Name" name="fname" required>
        <input type="text" placeholder="Enter Last Name" name="lname" required>
        <input type="text" placeholder="Enter User Name" name="uid" required>
        <input type="email" placeholder="Enter Email" name="email" required>
        <input type="password" placeholder="Password" name="pass" required>
        <input type="tel" placeholder="Enter Contact Number" name="contactno"  maxlength="10" pattern="[0-9]{10}" required>
        <input type="text" placeholder="Address" name="address" required>
        <button type="submit" value="Register Now">Sign Up</button>
      </form>
    </div>
    <div class="form-container sign-in-container">
      <form method='post' action="controller.jsp">
        <input type="hidden" name="page" value="login">
        <h1>Sign in</h1>
        <img src="Image/Lock.png" alt="Avatar" class="avatar">

        <label for="logintype">Login  As</label>
        <select name="logintype" id="logintype">
          <option value="user">User</option>
          <option value="student">Student</option>
          <option value="admin">Admin</option>
          <option value="superadmin">Super Admin</option>
        </select>

        <input type="text" placeholder="User Name" name="id" />
        <input type="password" placeholder="Password" name="password" />
        <button type="submit" value="Login">Sign In</button>
        <%
          if(request.getSession().getAttribute("userStatus")!=null)
          {

            if(request.getSession().getAttribute("userStatus").equals("-1"))
            {
              request.getSession().removeAttribute("userStatus");
        %>
        <script>alert("username or password is incorrect");</script>
        <p style="color: rgb(56,54,54);font-size: 20px">username or password is incorrect</p>
        <br>
        <%
            }
          }
        %>
      </form>
    </div>
    <div class="overlay-container">
      <div class="overlay">
        <div class="overlay-panel overlay-left">
          <h1>Welcome Back!</h1>
          <p1>To keep connected with us please login with your personal info</p1>
          <button class="ghost" id="signIn">Sign In</button>
        </div>
        <div class="overlay-panel overlay-right">
          <h1>Hello, Applicant!</h1>
          <p1>Enter your personal details and start journey with us</p1>
          <button class="ghost" id="signUp">Sign Up</button>
        </div>
      </div>
    </div>
  </div>
</div>


<script type="text/javascript" src="js/form.js"></script>

</body>
</html>
