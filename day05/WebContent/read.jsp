<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="data" class="model.message.MessageVO" scope="request" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=data.getTitle() %></title>
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
		<td><%=data.getTitle() %></td>
	</tr>
	<tr>
		<td>작성자</td>
		<td><%=data.getWriter() %></td>
	</tr>
	<tr>
		<td>작성 시간</td>
		<td><%=data.getWdate() %></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><img src="<%=data.getPath()%>" width=512 height=384></img><br><br><%=data.getContent() %></td>
	</tr>
</table>
<button type="button" onClick="back()">뒤로 가기</button>
</body>
</html>