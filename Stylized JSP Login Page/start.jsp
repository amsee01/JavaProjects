<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Flat HTML5/CSS3 Login Form</title>



      <link rel="stylesheet" href="style.css">


</head>

<body>
  <div class="login-page">
  <div class="form">
    <form class="register-form">
      <input type="text" placeholder="name"/>
      <input type="password" placeholder="password"/>
      <input type="text" placeholder="email address"/>
      <button>create</button>
      <p class="message">Already registered? <a href="#">Sign In</a></p>
    </form>
    <form class="login-form" action="start.jsp" method="post">
      <input type="text" placeholder="username" name="user"/>
      <input type="password" placeholder="password" name="pass"/>
      <button type="submit">login</button>
      <p class="message">Not registered? <a href="logon.jsp">Create an account</a></p>
    </form>
  </div>
</div>


  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    <script src=index.js"></script>

    <jsp:useBean class="am.logs" id="n"></jsp:useBean>
        <jsp:setProperty name="n" property="*"></jsp:setProperty>


        <c:if test="${not empty n.user}">

            <sql:setDataSource var="snapshot" driver="sun.jdbc.odbc.JdbcOdbcDriver"
                url="jdbc:odbc:amandsn"
                user="sa"  password="mypass"/>
            <sql:query dataSource="${snapshot}" var="result">Select * from login where Userid='${n.user}' and Password='${n.pass}'</sql:query>


<c:forEach var="rows" items="${result.rows}">
    <jsp:forward page="success.html"></jsp:forward>
</c:forEach>

    </c:if>
</body>
</html>
