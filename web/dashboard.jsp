

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <jsp:useBean id="DAO" class="Database.DatabaseController" scope="page"/>

        <% 
           if(session.getAttribute("userStatus")!=null){
            String loginConfirm=session.getAttribute("userStatus").toString();
            if(loginConfirm.equals("1")){
                
            if(session.getAttribute("userType").equals("admin"))
                response.sendRedirect("admin_page.jsp?window=1");
            

            else if(session.getAttribute("userType").equals("user"))
                response.sendRedirect("user_page.jsp?window=0");

            else if(session.getAttribute("userType").equals("student"))
                response.sendRedirect("student_page.jsp?window=0");

            else if(session.getAttribute("userType").equals("superadmin"))
                response.sendRedirect("superadmin.jsp?window=0");



            
        
            }else if(!loginConfirm.equals("1")){
               response.sendRedirect("index.jsp");
            }
        }else response.sendRedirect("index.jsp");
        %>