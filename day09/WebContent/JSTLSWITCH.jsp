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
	<select name="test">
		<option>-</option>
		<option ${param.test=='a'?'selected':''}>a</option>
		<option ${param.test=='b'?'selected':''}>b</option>
		<option ${param.test=='c'?'selected':''}>c</option>	
	</select>
	<input type="submit" value="선택완료">
</form>

${param.test}을 선택했습니다.

<c:choose>
	<c:when test="${param.test=='a'}">
		a를 선택했습니다.
	</c:when>
	<c:when test="${param.test=='b'}">
		b를 선택했습니다.
	</c:when>
	<c:otherwise>
		c를 선택했습니다.
	</c:otherwise>
</c:choose>
</body>
</html>