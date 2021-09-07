<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:catch var="errMsg">
	<%= 10/0 %>
</c:catch>

${errMsg}<br>

<c:set var="msg" value="안녕하세요!"/>

<h1>${msg}</h1>
<hr>

<!-- member.email -->
<c:set target="${member}" property = "email" value="gus3578@naver.com"/>
${member.name}<br>
${member.email}
</body>
</html>