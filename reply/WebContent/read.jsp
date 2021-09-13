<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*, model.message.*, model.member.*, model.reply.*"%>
<jsp:useBean id="data" class="model.message.MsgSet" scope="request" />
<!DOCTYPE html>
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
		<td><%=data.getM().getTitle()%></td>
	</tr>
	<tr>
		<td>작성자</td>
		<td><%=data.getM().getWriter() %></td>
	</tr>
	<tr>
		<td>작성 시간</td>
		<td><%=data.getM().getWdate() %></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><img src="<%=data.getM().getPath()%>" width=512 height=384></img><br><br><%=data.getM().getContent() %></td>
	</tr>
</table>

<% 
	System.out.println(data.getRlist());
	for(ReplySet rs : data.getRlist()){
		out.println("====================================<br>");
		out.println("<input type='text' value='" + rs.getR().getRwriter() + "님의 댓글'>");
		out.println("<input type='text' value='" + rs.getR().getRcontent() + "'>");
		out.println(rs.getR().getRdate());
		
		out.println("<form method='post' action='control.jsp?action=addrreply'>");
		out.println("<input type='hidden' name='rrnum' value='" + rs.getR().getRnum() + "'>");
		out.println("<input type='text' name='rrwriter' placeholder='이름'>");
		out.println("<input type='text' name='rrcontent' placeholder='답글'>");
		out.println("<input type='submit' value='답글 등록'>");
		out.println("</form>");
		out.println("====================================<br>");
		
		for(RReplyVO rrs : rs.getRrlist()){
			out.println("<input type='text' value='" + rrs.getRrwriter() + "님의 답글'>");
			out.println("<input type='text' value='" + rrs.getRrcontent() + "'>");
			out.println("<br>");
		}
	}
%>

<br><br>
<form method="post" action="control.jsp">
	<input type="hidden" name="action" value="addreply">
	<input type="hidden" name="rmember" value="<%=data.getM().getMnum()%>">
	<input type="text" placeholder="이름 입력" name="rwriter">
	<input type="text" placeholder="댓글 입력" name="rcontent">
	<input type="submit" value="댓글 등록">
</form>


<button type="button" onClick="back()">뒤로 가기</button>

</body>
</html>