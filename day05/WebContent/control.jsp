<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, model.message.*"
    errorPage="error.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="messageDAO" class="model.message.MessageDAO"/>
<jsp:useBean id="messageVO" class="model.message.MessageVO"/>
<jsp:setProperty property="*" name="messageVO"/>

<%
	// 컨트롤러를 호출했을 때의 action 파라미터에 따라 작업을 분할
	String action = request.getParameter("action");
	System.out.println(action); // log
	
	if(action.equals("list")){
		ArrayList<MessageVO> datas = messageDAO.getDBList();
		request.setAttribute("datas", datas);
		pageContext.forward("list.jsp");
	}
	else if(action.equals("insert")){
		if(messageDAO.insertDB(messageVO)){
			// 같은 페이지의 다른 곳으로 이동할 때는 주로 redirect 방식을 이용함 -> spring에서 자세히
			response.sendRedirect("control.jsp?action=list");
		}
		else{
			// 예외를 발생시켜 에러페이지로 이동
			throw new Exception("DB 변경 오류 발생!");
		}
	}
	else if(action.equals("delete")){
		
	}
	else if(action.equals("update")){
		if(messageDAO.updateDB(messageVO)){
			// 같은 페이지의 다른 곳으로 이동할 때는 주로 redirect 방식을 이용함 -> spring에서 자세히
			response.sendRedirect("control.jsp?action=list");
		}
		else{
			// 예외를 발생시켜 에러페이지로 이동
			throw new Exception("DB 변경 오류 발생!");
		}
	}
	else if(action.equals("edit")){
		MessageVO data = messageDAO.getDBData(messageVO);
		request.setAttribute("data", data);
		pageContext.forward("edit.jsp");
	}
	else{
		out.println("오류 발생!");
	}

%>


    

