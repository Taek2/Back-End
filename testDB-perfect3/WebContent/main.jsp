<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.member.*,java.util.*"%>
<jsp:useBean id="dao" class="model.member.MemberDAO" scope="application"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>DB에 저장된 데이터 목록</h3>
<hr>
<%
	ArrayList<MemberVO> datas=dao.select();
	for(MemberVO v:datas){
		out.println(v+"<br>");
	}
%>
<hr>
<a href="reg.html">☞회원가입하러가기</a> <br>
<a href="login.html">☞로그인하러가기</a> <br>

</body>
</html>