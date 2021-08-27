<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="model.member.MemberDAO" scope="application"/>
<jsp:useBean id="vo" class="model.member.MemberVO"/>
<jsp:setProperty property="*" name="vo"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>

<%

	if(dao.login(vo)){
		out.println("<script>alert('로그인 성공!');</script>");
		out.println(vo.getUserID() + "님 반갑습니다!<br>");
	}
	else{
		out.println("<script>alert('로그인 실패! 아이디와 비밀번호를 확인하세요!'); history.go(-1);</script>");
	}

%>
<a href="main.jsp">메인으로 돌아가기</a>

</body>
</html>