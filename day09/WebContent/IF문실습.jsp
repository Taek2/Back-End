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
<form>
	<input type="text" name="number" placeholder="정수를 입력">
	<input type="submit" value="입력완료">
</form>

<c:if test="${param.number%2==0 && param.number!=null}">
	짝수입니다.
</c:if>
<c:if test="${param.number%2==1}">
	홀수입니다.
</c:if>

</body>
</html>