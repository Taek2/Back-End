<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, model.member.*"%>
<jsp:useBean id="datas" class="java.util.ArrayList" scope="request" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 로그인</title>
<link rel="stylesheet" href="css/style.css">
<script>
	function openJoin(){window.open("join.jsp","회원가입창","width=600 height=500");}
</script>
</head>
<body> 
<div class="content">
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
<input type="button" value="회원가입 " onclick="openJoin()">
<hr>

<!-- 아이디 목록 출력 -->
<h2>현재 아이디 목록</h2>
<table border="1">
	<tr>
		<th>번호</th><th>이름</th><th>아이디</th><th>비밀번호</th>
	</tr>
	<c:forEach var="v" items="${datas}">
		<tr>
			<td>${v.memnum}</td>
			<td>${v.name}</td>
			<td>${v.mid}</td>
			<td>${v.mpw}</td>
		</tr>
	</c:forEach>
</table>
</div>

<div class="ad">
	<ul>
		<li><a href="https://www.coupang.com/"><img alt="광고_쿠팡" src="img/ad1.jpg" style="width:200px;height:200px;"></a></li>
		<li><a href="https://www.melon.com/"><img alt="광고_멜론" src="img/ad2.jpg" style="width:200px;height:200px;"></a></li>
		<li><a href="https://www.youtube.com/watch?v=W7edvITC9g4"><img alt="광고_스파이더맨" src="img/ad3.jpg" style="width:200px;height:200px;"></a></li>
	</ul>

</div>
</body>
</html>