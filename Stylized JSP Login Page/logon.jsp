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
    <form class="login-form" action="start.jsp" method="post">
      <input type="text" placeholder="name" name="user"/>
      <input type="password" placeholder="password" name="pass"/>

      <button>create</button>
      <p class="message">Already registered? <a href="start.jsp">Sign In</a></p>
    </form>

  </div>
</div>


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
                    <jsp:forward page="start.jsp"></jsp:forward>
                </c:if>
        </c:if>
</body>
</html>
