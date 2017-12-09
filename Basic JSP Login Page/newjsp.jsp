<%--
    Document   : newjsp
    Created on : Dec 23, 2016, 11:51:22 AM
    Author     : Administrator
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="newjsp.jsp">
            <pre>
            USER ID:            <input type="text" name ="newuser" />
            PASSWORD:           <input type="password" name="newpass" />
            PASSWORD (AGAIN):   <input type="password" name="newpassag" />

            <button type="submit">SUBMIT</button>
            </pre>
        </form>

        <%
            if(request.getParameter("newuser")!=null ||request.getParameter("newpass")!=null)
            {
            String userid = request.getParameter("newuser");
            String psswd = request.getParameter("newpass");
            String psswdag = request.getParameter("newpassag");
            if(psswd.equals(psswdag))
            {
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection con=DriverManager.getConnection("jdbc:odbc:amands","sa","mypass");
            PreparedStatement st = con.prepareStatement("Insert into login values (?,?)");
            st.setString(1,userid);
            st.setString(2,psswd);
            st.executeUpdate();
            out.print("Successfully created user! Please login now!");
            }
            else
            {
             out.print("Please retype your password correctly");
            }

            }

            %>

    </body>
</html>
