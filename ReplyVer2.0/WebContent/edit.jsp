<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.message.MessageVO"%>
<jsp:useBean id="data" class="model.message.MsgSet" scope="request" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	// 삭제 버튼 onClick 옵션 함수 정의
	function del(){
		result=confirm("정말로 삭제하시겠습니까?");
		if(result==true){
			document.form1.action="messageDelete.do"; 
			document.form1.submit();
		}
		else{
			return;
		} 
	}
</script>
</head>
<body>
<a href="main.do">메인으로 돌아가기</a>
<hr>
<form action="messageUpdate.do" method="post" name="form1">

<input type="hidden" name="mnum" value="${data.m.mnum}">
<input type="hidden" name="member" value="${data.m.member}">
<input type="hidden" type="text" name="path" value="${data.m.path}">
<table border="1">
	<tr>
		<td>작성자</td>
		<td><input type="text" name="writer" value="${data.m.writer}"></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input type="text" name="title" value="${data.m.title}"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><input type="text" name="content" value="${data.m.content}"></td>
	</tr>	
	<tr>
		<td colspan='2'><input type="submit" value="내용 변경하기">
		<input type="button" value="글 삭제하기" onClick="del()"></td>
	</tr>
</table>
</form>

</body>
</html>