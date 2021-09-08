<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="datas" class="java.util.ArrayList" scope="request" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<hr>
<c:if test="${memnum==null}">
	<form action="control.jsp" method="post" name="form1">
		<input type="hidden" name="action" value="login">
		<table border="1">
			<th>로그인</th>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="mid"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="mpw"></td>
			</tr>
			<tr>
				<td colspan='2'><input type="submit" value="로그인"></td>
			</tr>
		</table>
	</form>
	<a href="join.jsp">회원가입 하러가기</a>
</c:if>

<c:if test="${memnum!=null}">
	<h2>${id}님 반갑습니다!</h2>
	<a href="mypage.jsp"><button>마이페이지</button></a>
	<a href="logout.jsp"><button>로그아웃</button></a>
</c:if>
<hr>


<table border="1">
	
	<th>번호</th><th>아이디</th><th>비밀번호</th>
	
	<c:forEach var="v" items="${datas}">
		<tr>
			<td>${v.memnum}</td>
			<td>${v.mid}</td>
			<td>${v.mpw}</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>