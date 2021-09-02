<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form method="post" action="ProductB.jsp">
	<jsp:useBean id="Product" class="model.ProductBean" scope="session"/>
		<select name="name">
			<% 
				for(String v : Product.getNames()){ %>
				<option><%=v %></option>
			<% 
				} 
			%>
		</select>
		<input type="text" name="cnt">
		
	
		<input type="submit" value="구매하기">
	</form>

</body>
</html>