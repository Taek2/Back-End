<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 페이지</title>

</head>
<body>
<a href="main.do">메인으로 돌아가기</a>
<form action="messageWrite.do" method="post" name="form1" enctype="multipart/form-data">

<input type="hidden" name="member" value="${memnum}">
<table border="1">
	<tr>
		<td>작성자</td>
		<td><input type="text" name="writer" value="${username}" readonly></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input type="text" name="title"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><input type="text" name="content"></td>
	</tr>
	<tr>
		<td>파일 업로드</td>
		<td><input type="file" name="filename1" size=40></td>
	<tr>
		<td colspan='2'><input type="submit" value="작성 완료">
	</tr>
</table>
</form>
</body>
</html>