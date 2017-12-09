<%--
    Document   : index
    Created on : Dec 23, 2016, 11:23:16 AM
    Author     : Administrator
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="index.jsp">
            <pre>
            Login ID:   <input type="text" name="user"/>
            Password:   <input type="password" name="pass"/>
<br>
                        <button type="submit">LOGIN</button>
            </pre>

             <%
            if(request.getParameter("user")!=null ||request.getParameter("pass")!=null)
            {
            String userid = request.getParameter("user");
            String psswd = request.getParameter("pass");
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection con=DriverManager.getConnection("jdbc:odbc:amands","sa","mypass");
            PreparedStatement st = con.prepareStatement("Select * from login where Userid=? and Pass=?");
            st.setString(1, userid);
            st.setString(2, psswd);
            ResultSet rs=st.executeQuery();

            if(rs.next())
            {
             out.print("LOGGED IN");
            }
            else
            {
                out.print("INVALID LOGIN!");
            }
            }

            %>

        </form>

        <form action="newjsp.jsp">
            <hr>
            <pre>
                 <button type="submit">NEW USER</button>
            </pre>
        </form>



    </body>
</html>
