<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, model.bank.*"
    %>
    
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="bankDAO" class="model.bank.BankDAO"/>
<jsp:useBean id="bankVO" class="model.bank.BankVO"/>
<<jsp:setProperty property="*" name="bankVO"/>

<%

	String action = request.getParameter("action");
	
	if(action.equals("main")){
		ArrayList<BankVO> datas = bankDAO.getDBList();
		request.setAttribute("datas", datas);
		pageContext.forward("main.jsp");
	}
	else if(action.equals("send")){
		BankVO vo1 = new BankVO();
		BankVO vo2 = new BankVO();
		vo1.setName(request.getParameter("sender"));
		vo2.setName(request.getParameter("receiver"));
		vo2.setBalance(Integer.parseInt(request.getParameter("money")));
		
		if(bankDAO.trans(vo1, vo2)){
			session.setAttribute("msg", "송금완료!");
		}
		else{
			session.setAttribute("msg", "송금불가!");
		}
		response.sendRedirect("control.jsp?action=main");
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