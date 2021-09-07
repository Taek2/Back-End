<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<% 
	ArrayList<String> datas= new ArrayList<String>(); 
	datas.add("apple");
	datas.add("banana");
	datas.add("pineapple");
	pageContext.setAttribute("datas", datas);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<c:forEach var="v" items="${datas}">
		<tr><td>${v}</td></tr>
	</c:forEach>
</table>
</body>
</html>