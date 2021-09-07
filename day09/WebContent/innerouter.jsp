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

<c:import url="IF문실습.jsp" var="innerURL" />
<c:out value="${innerURL}" escapeXml="false" />

<hr>

<c:import url="https://www.naver.com/" var="outerURL" />
<c:out value="${outerURL}" escapeXml="false" />

</body>
</html>