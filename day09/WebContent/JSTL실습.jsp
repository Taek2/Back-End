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
<table border="1">
	<!-- for(String v : members) -->
	<c:forEach var="v" items="${members}">
	<tr>
		<td>${v.name}</td>
		<!-- c:out 은 데이터 없는 경우에 씀 -->
		<td><c:out value="${v.email}" escapeXml="false"><font color="red">email 정보없음</font></c:out></td>
	</tr>

	</c:forEach>
</table>
</body>
</html>