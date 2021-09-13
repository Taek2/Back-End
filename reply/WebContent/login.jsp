<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, model.member.*"%>
<jsp:useBean id="memberDAO" class="model.member.MemberDAO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 로그인</title>
</head>
<body>
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
<hr>

<!-- 아이디 목록 출력 -->
<h2>현재 아이디 목록</h2>
<table border="1">
	<tr>
		<th>번호</th><th>아이디</th><th>비밀번호</th>
	</tr>
	<%	
		for(MemberVO vo:memberDAO.getDBList()){
	%>
	<tr>
		<td><%=vo.getMemnum()%></td>
		<td><%=vo.getMid() %></td>
		<td><%=vo.getMpw() %></td>
	</tr>
	<%
		}
	%>
</table>
</body>
</html>