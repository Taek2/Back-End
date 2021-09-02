<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매하기</title>
</head>
<body>

	<form method="post" action="d.jsp">
		<mytag:printProduct/>
		
		<input type="text" name="cnt">
		<input type="submit" value="구매하기">
	</form>

</body>
</html>