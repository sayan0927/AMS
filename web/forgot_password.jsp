
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title></title>
    <link href="${pageContext.request.contextPath}/css/style-backend.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
</head>
<style>
    body {
        background-image: url("Image/show.jpg");
    }
    s2 {

        font-size: 25px;
        font-family: oblique;
        color:black;
    }
</style>
<body>


<%if(request.getParameter("error").equals("1")){%>

<s2>
<center><br>
    <image src="Image/error.jpg" width="150" height="150"/>
    <p><br>Entered Email and Username does not match <br> or is not registered to any account.</p><br>
    <p><b><a href="forgot_password.jsp?error=0" ><div class="add-btn" style="width: 150px;font-size: 16px ;color:#000000; padding: 10px">Try Again</div></a></b></p>
</center>
</s2>
<%}else{%>
<center>
    <div class="central-div" style="top:10%">
        <form action="controller.jsp">
            <input type="hidden" name="page" value="forgot">
            <table>
                <tr>

                    <td colspan="2">
                        <center><h2>Reset Password</h2></center>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>Please Enter Your Email</label>
                    </td>
                    <td>
                        <input type="email" name="email" class="text" placeholder="Email">
                    </td>
                </tr>

                <tr>
                    <td>
                        <label>Please Enter Your Username</label>
                    </td>
                    <td>
                        <input type="text" name="uname" class="text" placeholder="username">
                    </td>
                </tr>

                <tr>


                    <td>

                        <label>The New Password will be sent to your Email</label>

                    </td>

                    <td>
                        <center>

                            <input type="submit" value="Reset" class="button">
                        </center>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</center>

<%}%>

</body>
</html>