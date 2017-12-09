<%--
    Document   : newjsp
    Created on : Dec 28, 2016, 10:48:59 AM
    Author     : Administrator
--%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
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
             User ID:   <input type="text" name="user" />
             Password:  <input type="password" name="pass" />
             <button type="submit">SIGN UP</button>
            </pre>
        </form>

        <jsp:useBean class="am.nuser" id="f"></jsp:useBean>
        <jsp:setProperty name="f" property="*"></jsp:setProperty>

        <c:if test="${not empty f.user}">
            <sql:setDataSource var="snapshot" driver="sun.jdbc.odbc.JdbcOdbcDriver"
                url="jdbc:odbc:amandsn"
                user="sa"  password="mypass"/>
            <sql:update dataSource="${snapshot}" var="count">
                INSERT INTO login VALUES ('${f.user}','${f.pass}')
            </sql:update>

                <c:if test="${count==1}">
                    <c:out value="CREATED USER!"></c:out>
                </c:if>
        </c:if>

    </body>
</html>
