<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.board.*" %>
<jsp:useBean id="vo" class="model.board.BoardVO"></jsp:useBean>
<jsp:setProperty property="*" name="vo"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	BoardDAO dao=new BoardDAO();
	BoardVO data=dao.getBoard(vo);
	request.setAttribute("data", data);
%>
<body>

<form action="updateBoardAction.jsp" method="post">
	<table border="1">
		<input type="hidden" value="${data.id}" name="id" />
		<tr>
			<td>글 제목</td>
			<td><input type="text" name="title" value="${data.title}"></td>
		</tr>
		<tr>
			<td>글 내용</td>
			<td><input type="text" name="content" value="${data.content}"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="글 변경하기"></td>
		</tr>
	</table>
</form>
<hr>
<a href="deleteBoardAction.jsp">글 삭제하기</a>
<hr>
<a href="main.do">메인페이지로 이동하기</a>

</body>
</html>