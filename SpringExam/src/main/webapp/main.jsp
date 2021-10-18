<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.board.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 .page:link { color: red; text-decoration: none;}
 .page:visited { color: black; text-decoration: none;}
 .page:hover { color: blue; text-decoration: underline;}
</style>
</head>

<body>
<h3><a href="logout.jsp">로그아웃</a></h3>
<hr>
<h1>글 목록</h1>
<hr>
<table border="1">
	<tr>
		<td>번호</td><td>제목</td><td>내용</td><td>글 작성자</td>
	</tr>
	<c:forEach var="v" items="${datas}">
		<tr>
			<td>${v.id}</td><td>${v.title}</td><td>${v.content}</td><td>${v.writer}</td>
		</tr>
	</c:forEach>
</table>
<c:if test="${pageNum == 1}"><button disabled>◁ 이전 </button></c:if>
<c:if test="${pageNum!=1}"><button><a href="main.do?pageNum=${pageNum-1}">◁ 이전 </a></button></c:if>
<c:forEach var="i" begin="1" end="${maxPage}">
		<a class="page" href="main.do?pageNum=${i}">${i}</a>
		&nbsp;
</c:forEach>
<c:if test="${pageNum == maxPage}"><button disabled>▷ 다음 </button> </c:if>
<c:if test="${pageNum!=maxPage}"><button><a href="main.do?pageNum=${pageNum+1}">▷ 다음 </a></button></c:if>
<hr>
<a href="form.jsp?pageNum=${pageNum}">글 작성</a>
</body>
</html>