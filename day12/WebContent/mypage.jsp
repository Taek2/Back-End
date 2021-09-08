<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	// 삭제 버튼 onClick 옵션 함수 정의
	function del(){
		result=confirm("정말로 탈퇴하시겠습니까?");
		if(result==true){
			document.form1.action.value="withdraw";
			document.form1.submit();
		}
		else{
			return;
		} 
	}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="control.jsp" name="form1">
    <table>
    <input type="hidden" name="action" value="mypage">
    <input type="hidden" name="memnum" value="${memnum}">
    <h2>회원정보수정</h2>
    <tr>
    	<td>아이디</td>
        <td><input name="mid" type="text" value="${id}" readonly></td>
    </tr>
    <tr>
    	<td>비밀번호</td>
        <td><input name="mpw" type="password" placeholder="변경할 비밀번호"></td>
    </tr>
    <tr>
   	 	<td colspan=2><input type="submit" value="수정완료">
   	 	<input type="button" value="회원탈퇴" onClick="del()"></td>                     
    </tr>  
    </table>                              
</form>  
</body>
</html>