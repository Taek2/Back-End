<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dao" class="model.member.MemberDAO" scope="application"/>
<jsp:useBean id="vo"	class="model.member.MemberVO" />
<jsp:setProperty property="*" name="vo"/>
<%
	dao.insert(vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>회원가입</h2>
<hr>
<table border="1">
	<tr>
		<td>이름</td>
		<td><%=vo.getUserName()%></td>
	</tr>
	<tr>
		<td>아이디</td>
		<td><%=vo.getUserID()%></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><%=vo.getUserPW()%></td>
	</tr>
</table>
<hr>
<a href="main.jsp">처음으로</a>

</body>
</html>