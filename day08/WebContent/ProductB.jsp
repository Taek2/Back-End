<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${param.name} 을(를) ${param.cnt} 개 구매 하셔서 총 ${Product.func1(param.name) * param.cnt} 원 입니다.
</body>
</html>