<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<DOCTYPE HTML5>
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="./style.css">
  </head>

  <body width="100%" height="100%">
    <form action="login.do" method="POST" class="loginForm">
      <h2>Login</h2>
      <div class="idForm">
        <input type="text" class="id" placeholder="ID" name="id">
      </div>
      <div class="passForm">
        <input type="password" class="pw" placeholder="PW" name="pw">
      </div>
      <input type="submit" class="btn" value="Login">
      <c:if test="${errmsg != null}">
        <div class="errormsg">
      	${errmsg}<br>
      	</div>
      </c:if>
   
      <div class="bottomText">
        Don't you have ID? <a href="join.jsp">sign up</a>
      </div>
      
    </form>
  </body>
</html>