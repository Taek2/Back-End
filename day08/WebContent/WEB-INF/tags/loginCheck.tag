<%@ tag language="java" pageEncoding="UTF-8"%>

<% 		
		
		boolean check = (boolean)session.getAttribute("login"); 
		System.out.println(check);
		if(!check){
			response.sendRedirect("e.jsp");
		}
		else{
	%>
	
		<a href="control.jsp?action=logout"><input type="button" value="로그아웃"></a>
	
	<%} %>