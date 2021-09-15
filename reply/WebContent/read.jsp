<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*, model.message.*, model.member.*, model.reply.*"%>
<jsp:useBean id="data" class="model.message.MsgSet" scope="request" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<% 
	request.setAttribute("message", data.getM());
%>
<html>
<head>
<meta charset="UTF-8">
<title><%=data.getM().getTitle() %></title>
<script>
	function back(){
		history.go(-1);
	}
</script>
<style>

table{
	text-align:center;
	width:100%;
}

tr td:nth-child(1){
	width:20%;
	background-color:lightgreen;
}
tr:last-child{
	
}

</style>
</head>
<body>
<table border="1">
	<tr>
		<td>제목</td>
		<td>${message.title}</td>
	</tr>
	<tr>
		<td>작성자</td>
		<td>${message.writer}</td>
	</tr>
	<tr>
		<td>작성 시간</td>
		<td>${message.wdate}</td>
	</tr>
	<tr>
		<td>내용</td>
		<td><img src="${message.path}" width=512 height=384></img><br><br>${message.content}</td>
	</tr>
</table>

<c:forEach var="rs" items="${data.rlist}">
	<br>
	<input type="text" value="${rs.r.rwriter}님의 댓글">
	<input type="text" value="${rs.r.rcontent}">
	
	<c:if test="${rs.r.rmember == memnum}">
		<a href="control.jsp?action=replyDelete&rnum=${rs.r.rnum}&mnum=${message.mnum}"><input type="button" value="댓글 삭제"></a>
	</c:if>
	${rs.r.rdate}
	<br>
	
	<c:forEach var="rrs" items="${rs.rrlist}">
		┗><input type="text" value="${rrs.rrwriter}님의 답글">
		<input type="text" value="${rrs.rrcontent}">
		
		<c:if test="${rrs.rrmember == memnum}">
			<a href="control.jsp?action=rreplyDelete&rrpk=${rrs.rrpk}&mnum=${message.mnum}"><input type="button" value="답글 삭제"></a>
		</c:if>
		<br>
	</c:forEach>
	
	<form method="post" action="control.jsp?action=addrreply">
		<input type="hidden" name="rrnum" value="${rs.r.rnum}">
		<input type="hidden" name="mnum" value="${message.mnum}">
		<input type="hidden" name="rrmember" value="${memnum}">
		
		┗><input type="text" name="rrwriter" value="${userID}" readonly>
		<input type="text" name="rrcontent" placeholder="답글">
		<input type="submit" value="답글 등록">
	</form>
	<br>
</c:forEach>

<!-- 댓글 입력 -->
<br><br>
<form method="post" action="control.jsp">
	<input type="hidden" name="action" value="addreply">
	<input type="hidden" name="rmember" value="${memnum}">
	<input type="hidden" name="rmnum" value="${message.mnum}">
	<input type="hidden" name="mnum" value="${message.mnum}">
	<input type="text" name="rwriter" value="${userID}" readonly>
	<input type="text" placeholder="댓글 입력" name="rcontent">
	<input type="submit" value="댓글 등록">
</form>

<a href="control.jsp?action=list"><input type="button" value="뒤로가기"></a>


</body>
</html>