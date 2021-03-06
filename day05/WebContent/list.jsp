<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, model.message.*"%>
<jsp:useBean id="datas" class="java.util.ArrayList" scope="request" />
<% 
/*
위의 jsp:useBean을 풀어서 쓰면 정확히 이런 방식으로 동작한다. 
if(datas == null){
	ArrayList<MessageVO> datas = new ArrayList<messageVO>
	datas = request.getParameter("datas"); 
}
*/

%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 목록 화면</title>

<script>

	function check(mnum){
		writer=prompt("글 정보 변경을 위해 작성자명을 입력하시오.");
		document.location.href="control.jsp?action=edit&mnum="+mnum+"&writer="+writer;
		
	}

</script>
</head>
<body>
<h2>게시글 목록</h2>
<hr>
<a href="form.jsp">글 등록</a>
<hr>
<table border="1">
	<tr>
		<th>글 번호</th><th>제목</th><th>작성자</th><th>작성일</th>
	</tr>
	<%
		for(MessageVO vo:(ArrayList<MessageVO>)datas){
			
	%>
	<tr>
		<!-- 글 번호를 누르면 edit(수정)으로 포워딩, & 연산자를 사용해 원하는 파라미터 값을 넘길 수 있다. -->
		<!--  "control.jsp?action=edit&mnum=<%=vo.getMnum()%>" -->
		<td><a href="control.jsp?action=edit&mnum=<%=vo.getMnum()%>"><%=vo.getMnum()%></a></td>
		<td><a href="control.jsp?action=read&mnum=<%=vo.getMnum()%>"><%=vo.getTitle() %></a></td>
		<td><%=vo.getWriter() %></td>
		<td><%=vo.getWdate() %></td>
	</tr>
	<%
		}
	%>
</table>
<a href="logout.jsp">로그아웃</a>

</body>
</html>