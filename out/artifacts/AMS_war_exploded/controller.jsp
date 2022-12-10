
<%@page import="java.time.LocalTime"%>
<%@page import="java.util.*"%>
<%@ page import="Util.CreateRandomPassword" %>
<%@ page import="Util.JavaEmail" %>
<%@ page import="javax.mail.MessagingException" %>
<%@ page import="Util.RollBuilder" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="servlet.addApplication" %>
<%@ page import="Models.*" %>
<%@ page import="Util.Config" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="DAO" class="Database.DatabaseController" scope="page"/>
<%
    if(request.getParameter("page").toString().equals("login"))
    {
        System.out.println("hehehehehe");

        String id=request.getParameter("id");
        String password=request.getParameter("password");
        String loginType=request.getParameter("logintype");
        System.out.println(loginType);


        if(loginType.equals("admin"))
        {
            if (DAO.adminLoginValidate(id, password))
            {
                session.setAttribute("userStatus", "1");
                session.setAttribute("userId", id);
                session.setAttribute("userType", "admin");

                response.sendRedirect("dashboard.jsp");

            } else {
                request.getSession().setAttribute("userStatus", "-1");
                response.sendRedirect("login_signup.jsp");
            }
        }

        else if(loginType.equals("user"))
        {
            if(DAO.userLoginValidate(id,password)){
                session.setAttribute("userStatus", "1");
                session.setAttribute("userId",id);
                session.setAttribute("userType","user");

                response.sendRedirect("dashboard.jsp");

            }else{
                request.getSession().setAttribute("userStatus", "-1");
                response.sendRedirect("login_signup.jsp");
            }
        }

        else if(loginType.equals("student"))
        {
            if(DAO.studentLoginValidate(id,password)){
                session.setAttribute("userStatus", "1");
                session.setAttribute("userId",id);
                session.setAttribute("userType","student");

                response.sendRedirect("dashboard.jsp");

            }else{
                request.getSession().setAttribute("userStatus", "-1");
                response.sendRedirect("login_signup.jsp");
            }
        }

        else if(loginType.equals("superadmin"))
        {
            System.out.println(Config.superAdminUserName +" "+ Config.superAdminPassword);
            System.out.println(id+" "+password);

            if(id.equals(Config.superAdminUserName) && password.equals(Config.superAdminPassword)) {
                session.setAttribute("userStatus", "1");
                session.setAttribute("userId", id);
                session.setAttribute("userType", "superadmin");
                response.sendRedirect("dashboard.jsp");


            }else{
                request.getSession().setAttribute("userStatus", "-1");
                response.sendRedirect("login_signup.jsp");
            }
        }

    }




    else if(request.getParameter("page").toString().equals("register")){



            String fName = request.getParameter("fname");
            String lName = request.getParameter("lname");
            String uid = request.getParameter("uid");
            String email = request.getParameter("email");
            String pass = request.getParameter("pass");
            String contactNo = request.getParameter("contactno");
            String address = request.getParameter("address");


            if(DAO.addNewUser(new User(fName, lName, uid.replaceAll(" ",""), email, pass, contactNo, address)))
                response.sendRedirect("index.jsp");
            else {
                System.out.println("here");
                response.sendRedirect("login_signup.jsp?registration_error=1");
            }


    }

    else if(request.getParameter("page").toString().equals("add_admin")) {


        String adminId = request.getParameter("aid");
        String fName = request.getParameter("fname");
        String lName = request.getParameter("lname");
        String pass = request.getParameter("pass");
        String email = request.getParameter("email");

        String contactNo = request.getParameter("contact");
        String address = request.getParameter("address");


        if (DAO.addNewAdmin(new Admin(fName, lName, adminId, email, pass, contactNo, address)))
            response.sendRedirect("superadmin.jsp");
        else {

            response.sendRedirect("add_admin.jsp?add_error=1");
        }
    }




    else if(request.getParameter("page").toString().equals("profile")){



        String fName =request.getParameter("fname");
        String lName =request.getParameter("lname");
        String uid=request.getParameter("uid");
        String email=request.getParameter("email");
        String pass=request.getParameter("pass");
        String contactNo =request.getParameter("contactno");
        String address =request.getParameter("address");




        DAO.updateUser(new User(fName,lName,uid.replaceAll(" ",""),email,pass,contactNo,address));
        response.sendRedirect("dashboard.jsp");
    }

    else if(request.getParameter("page").toString().equals("profile_admin")){

        String fName =request.getParameter("fname");
        String lName =request.getParameter("lname");
        String aid=request.getParameter("aid");
        String email=request.getParameter("email");
        String pass=request.getParameter("pass");
        String contactNo =request.getParameter("contactno");
        String address =request.getParameter("address");




        DAO.updateAdmin(new Admin(fName,lName,aid.replaceAll(" ",""),email,pass,contactNo,address));
        response.sendRedirect("dashboard.jsp");
    }


    else if(request.getParameter("page").toString().equals("register_admin")){

        String fName =request.getParameter("fname");
        String lName =request.getParameter("lname");
        String aid=request.getParameter("aid");
        String email=request.getParameter("email");
        String pass=request.getParameter("pass");
        String contactNo =request.getParameter("contactno");
        String address =request.getParameter("address");


        DAO.addNewAdmin(new Admin(fName,lName,aid.replaceAll(" ",""),email,pass,contactNo,address));
        response.sendRedirect("admin_page.jsp?window=1");



    }

    else if(request.getParameter("page").toString().equals("add_department"))
    {
        String did=request.getParameter("did");
        String dname=request.getParameter("dname");
        String hodId=request.getParameter("hid");



        boolean successful= DAO.addNewDepartment(new Department(did.replaceAll(" ",""), dname, hodId));

        if(!successful)
            response.sendRedirect("add_department.jsp?add_error=1");
        else
            response.sendRedirect("admin_page.jsp?window=2");

    }


    else if(request.getParameter("page").toString().equals("apply"))
    {
     /*   String applierId=request.getParameter("appid");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email=request.getParameter("email");
        String contact=request.getParameter("contact");
        String address=request.getParameter("address");
        String preferredCourse=request.getParameter("cid");
        String applicationStatus="pending";
        String score = request.getParameter("score");
        String hostelRequired = request.getParameter("hostelRequired");




        if(DAO.addNewApplication(applierId,fname,lname,email,contact,address,preferredCourse,applicationStatus,score,hostelRequired)) {

            response.sendRedirect("user_page.jsp?window=0");
        }
        else
            response.sendRedirect("add_application.jsp?add_error=1");

      */
    }


    else if(request.getParameter("page").toString().equals("add_faculty"))
    {
        String fid=request.getParameter("fid");
        String fname=request.getParameter("fname");
        String lname=request.getParameter("lname");
        String email=request.getParameter("email");
        String contact=request.getParameter("contact");
        String deptId=request.getParameter("did");
        String address=request.getParameter("address");




        boolean successful= DAO.addNewFaculty(new Faculty(fid.replaceAll(" ",""),fname,lname,email,contact,deptId,address));

        if(!successful)
            response.sendRedirect("add_faculty.jsp?add_error=1");
        else
            response.sendRedirect("admin_page.jsp?window=4");

    }

    else if(request.getParameter("page").toString().equals("edit_faculty"))
    {

        String fid=request.getParameter("fid");
        String fname=request.getParameter("fname");
        String lname=request.getParameter("lname");
        String email=request.getParameter("femail");
        String contact=request.getParameter("fcontact");
        String deptId=request.getParameter("fdept");
        String address=request.getParameter("faddress");

        System.out.println(fid+" "+fname+" "+lname+" "+email+" "+contact+" "+deptId+" "+address);

        if(DAO.editFaculty(new Faculty(fid,fname,lname,email,contact,deptId,address)))
            response.sendRedirect("admin_page.jsp?window=4");
        else
            response.sendRedirect("edit_faculty.jsp?error=1&fid="+fid);

    }

    else if(request.getParameter("page").toString().equals("accept_app"))
    {



        String applierId=request.getParameter("appid");
        String fname=request.getParameter("fname");
        String lname=request.getParameter("lname");
        String email=request.getParameter("email");
        String contact=request.getParameter("contact");
        String pass= CreateRandomPassword.getRandomPassword();
        String address=request.getParameter("address");
        String courseId=request.getParameter("cid");

        String hostelId=null;
        hostelId=request.getParameter("hid");

        String roll= RollBuilder.buildRoll(DAO.getNextRoll(request.getParameter("cid")) , courseId , DAO);





        if(DAO.addNewStudent(new Student(roll,fname,lname,email,contact,address,courseId,hostelId,pass)))
        {
            String subject="Application Accepted";
            String body="Congratulations "  +fname +" "+ lname +" ,\n your admission application is accepted. Your institute roll number is "
                    + roll+" and password is "+pass+".";
            DAO.setApplicationStatusToAccepted(applierId);
            try {
                JavaEmail.mail(email,subject,body);
            } catch (MessagingException e) {
                e.printStackTrace();
            }
        }
        response.sendRedirect("admin_page.jsp?window=6");



    }


    else if(request.getParameter("page").toString().equals("add_hostel"))
    {
        String hostelId=request.getParameter("hid");
        String hostelName=request.getParameter("hname");
        String wardenID=request.getParameter("wid");



        boolean successful= DAO.addNewHostel(new Hostel(hostelId.replaceAll(" ",""),hostelName,wardenID));

        if(!successful)
            response.sendRedirect("add_hostel.jsp?add_error=1");
        else
            response.sendRedirect("admin_page.jsp?window=5");

    }

    else if(request.getParameter("page").toString().equals("edit_hostel"))
    {
        String hostelId=request.getParameter("hid");
        String wardenID=request.getParameter("wid");

        boolean successful= DAO.changeWarden(hostelId,wardenID);

        if(!successful)
            response.sendRedirect("edit_hostel.jsp?add_error=1");
        else
            response.sendRedirect("admin_page.jsp?window=5");

    }

    else if(request.getParameter("page").toString().equals("edit_department"))
    {
        String deptId=request.getParameter("did");
        String newHODId=request.getParameter("hod");

        boolean successful= DAO.changeHod(deptId,newHODId);

        if(!successful)
            response.sendRedirect("edit_department.jsp?add_error=1");
        else
            response.sendRedirect("admin_page.jsp?window=2");

    }

    else if(request.getParameter("page").toString().equals("faculty") && request.getParameter("operation").equals("del"))
    {
        String faculty_id=request.getParameter("fid");

        if(DAO.fireFaculty(faculty_id))
            response.sendRedirect("admin_page.jsp?window=4");
        else
            response.sendRedirect("admin_page.jsp?window=4&delete_error=1");
    }



    else if(request.getParameter("page").toString().equals("add_course"))
    {
        String courseId=request.getParameter("cid");
        String courseLevel=request.getParameter("clevel");
        String courseName=request.getParameter("cname");
        String offeringDept=request.getParameter("offdept");



        boolean successful= DAO.addNewCourse(new Course(courseId.replaceAll(" ",""),courseLevel,courseName,offeringDept));

        if(!successful)
            response.sendRedirect("add_course.jsp?duplicate_error=1");
        else
        {
            try {
                String prefix,suffix;
                if(courseId.equals("MCA"))
                {
                    prefix="M";
                    suffix="CA";
                }

                else
                {
                    String[] split = courseId.split("-");
                    prefix=String.valueOf(split[0].charAt(0));
                    suffix= split[1].charAt(0)+""+split[1].charAt(1);
                }
                DAO.addToRollConventions(courseId,prefix,suffix);
                response.sendRedirect("admin_page.jsp?window=3");
            }
            catch (Exception e)
            {
                DAO.removeInvalidCourse(courseId);
                response.sendRedirect("add_course.jsp?add_error=1");

            }

        }

    }



    else if(request.getParameter("page").toString().equals("Back To Admin"))
    {

            response.sendRedirect("admin_page.jsp?window=1");
    }



    else if(request.getParameter("page").toString().equals("forgot")){



        String email=request.getParameter("email");
        String username=request.getParameter("uname");

     /*   if(DAO.resetPassword(email,username)!=0)
        {

            response.sendRedirect("forgot_password.jsp?error=1");
        }
        
       else response.sendRedirect("index.jsp");

      */

    }

    else if(request.getParameter("page").toString().equals("application"))
    {
        if(request.getParameter("operation").equals("reject"))
        {
            String appid=request.getParameter("appid");
            String email=request.getParameter("email");
            DAO.rejectApplication(appid);

            String subject="Application Rejected";
            String body="Dear Applicant, \n Your application was rejected.";
            try {
                JavaEmail.mail(email,subject,body);
            } catch (MessagingException e) {
                e.printStackTrace();
            }



            response.sendRedirect("admin_page.jsp?window=6");
        }
    }


    else if(request.getParameter("page").toString().equals("accounts")){
        if(request.getParameter("operation").toString().equals("del"))
        {
            DAO.delUser(request.getParameter("uid"));
            response.sendRedirect("admin_page.jsp?window=1");
        }


    }
    else if(request.getParameter("page").toString().equals("logout")){
       // session.setAttribute("userStatus","0");
        session.removeAttribute("userStatus");
        response.sendRedirect("index.jsp");
    }

%>