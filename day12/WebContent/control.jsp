<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, model.member.*"
    errorPage="error.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
%> 

<jsp:useBean id="memberDAO" class="model.member.MemberDAO"/>
<jsp:useBean id="memberVO" class="model.member.MemberVO"/>
<jsp:setProperty property="*" name="memberVO"/>


<%
	String action = request.getParameter("action");
	
	if(action.equals("main")){
		ArrayList<MemberVO> datas = memberDAO.getDBList();
		request.setAttribute("datas", datas);
		pageContext.forward("main.jsp");
	}
	else if(action.equals("login")){
		if(memberDAO.login(memberVO) != null){
			session.setAttribute("memnum", memberDAO.login(memberVO).getMemnum());
			session.setAttribute("id", memberDAO.login(memberVO).getMid());
			response.sendRedirect("control.jsp?action=main");
		}
		else{
		out.println("<script>alert('아이디 비밀번호를 확인하세요!');history.go(-1);</script>");
		}
	}
	else if(action.equals("join")){
		if(memberDAO.insertDB(memberVO)){
			response.sendRedirect("control.jsp?action=main");
		}
		else{
			out.println("<script>alert('회원가입 실패!');history.go(-1);</script>");
		}	
	}
	else if(action.equals("mypage")){
		if(memberDAO.updateDB(memberVO)){
			response.sendRedirect("control.jsp?action=main");
		}
		else{
			// 예외를 발생시켜 에러페이지로 이동
			throw new Exception("DB 변경 오류 발생!");
		}
	}
	else if(action.equals("withdraw")){
		if(memberDAO.deleteDB(memberVO)){
			pageContext.forward("logout.jsp");
		}
		else{
			// 예외를 발생시켜 에러페이지로 이동
			throw new Exception("DB 변경 오류 발생!");
		}
	}
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>