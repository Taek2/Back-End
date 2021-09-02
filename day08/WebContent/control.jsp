<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="memberbean" class="model.MemberBean"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
	String action = request.getParameter("action");
	
	if(action.equals("login")){
		if(memberbean.login(request.getParameter("id"), request.getParameter("pw"))){
			session.setAttribute("login", true);
			pageContext.forward("f.jsp");
		}
		else{
			session.setAttribute("login", false);
			pageContext.forward("f.jsp");
			
		}
	}
	else if(action.equals("logout")){
		session.invalidate();
		pageContext.forward("e.jsp");
	}
	else{
		out.println("꽦!");
	}

	%>

</body>
</html>