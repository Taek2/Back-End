<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, model.message.*"%>
<jsp:useBean id="datas" class="java.util.ArrayList" scope="request" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 목록 화면</title>

</head>
<body>
<h2>게시글 목록</h2>
<hr>
<ol>
	<li><a href="control.jsp?action=list">전체목록보기</a></li>
	<li><a href="form.jsp">글 등록</a></li>
</ol>
<hr>
<table border="1">
	<tr>
		<th>글 번호</th><th>제목</th><th>작성자</th><th>작성일</th>
	</tr>
	<c:forEach var="v" items="${datas}">
	<%
	//	 for(MessageVO vo:(ArrayList<MessageVO>)datas){
			
	%>
	<tr>
		<!-- 글 번호를 누르면 edit(수정)으로 포워딩, & 연산자를 사용해 원하는 파라미터 값을 넘길 수 있다. -->
		
		<td><a href="control.jsp?action=edit&mnum=${v.mnum}">${v.mnum}</a></td>
		<td><a href="control.jsp?action=read&mnum=${v.mnum}">${v.title}</a></td>
		<td>${v.writer}</td>
		<td>${v.wdate}</td>
	</tr>
	<%
		// }
	%>
	</c:forEach>
</table>

<a href="control.jsp?action=list&mcnt=${mcnt+1}&memnum=${memnum}">더보기&gt;&gt;</a>

<br><br>
${userID}님, 환영합니다!<br>
<a href="control.jsp?action=list&selUser=${memnum}">내글목록보기</a>
<a href="logout.jsp">로그아웃</a>

</body>
</html>