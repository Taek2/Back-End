<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="b1" class="bank.Bank1" />
<jsp:useBean id="b2" class="bank.Bank2" />
<%
	if(request.getMethod().equals("POST")){
		if(b1.trans(Integer.parseInt(request.getParameter("bal")))){ // 수행결과가 실행가능상태라면,
			out.println("<script>alert('가능!');</script>");
		}
		else{
			out.println("<script>alert('불가능!');</script>");
		}
	}

	b1.getBank1();
	b2.getBank2();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border="1">
	<tr>
		<td><%=b1.getName()%></td>
		<td><%=b1.getBalance()%></td>
	</tr>
	<tr>
		<td><%=b2.getName()%></td>
		<td><%=b2.getBalance()%></td>
	</tr>
</table>

<hr>

<form method="post">
	<input type="text" name="bal">
	<input type="submit" value="계좌이체">
</form>













</body>
</html>