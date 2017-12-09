<%--
    Document   : index
    Created on : Dec 27, 2016, 11:40:46 AM
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
        <form action="index.jsp" method="post">
            <pre>
            Login ID:   <input type="text" name="user" />
            Password:   <input type="password" name="pass" />

            <button type="submit">LOG IN</button>
            </pre>

        </form>

        <form action="newjsp.jsp">
            <pre>
            <button type="submit">NEW USER</button>
            </pre>
        </form>

        <jsp:useBean class="am.logs" id="n"></jsp:useBean>
        <jsp:setProperty name="n" property="*"></jsp:setProperty>


        <c:if test="${not empty n.user}">

            <sql:setDataSource var="snapshot" driver="sun.jdbc.odbc.JdbcOdbcDriver"
                url="jdbc:odbc:amandsn"
                user="sa"  password="mypass"/>
            <sql:query dataSource="${snapshot}" var="result">Select * from login where Userid='${n.user}' and Password='${n.pass}'</sql:query>


<c:forEach var="rows" items="${result.rows}">
    LOGGED IN!
</c:forEach>
<!--
<table border="1" width="100%">
<tr>
<th>ID</th>
<th>User ID</th>
<th>Password</th>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
<td><c:out value="${row.id}"/></td>
<td><c:out value="${row.Userid}"/></td>
<td><c:out value="${row.Password}"/></td>

</tr>
</c:forEach>
</table>
-->



        </c:if>

    </body>
</html>
